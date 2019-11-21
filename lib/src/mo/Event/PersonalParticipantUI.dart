import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/mo/Participant/Participant.dart';
import 'package:flutter_app/src/mo/Person/Person.dart';
import '../../../AppTheme.dart';
import 'ParticipantBloc.dart';
import 'ParticipantSelectModel.dart';

class PersonalParticipantUI extends StatefulWidget {
  @override
  _ListTileViewUVState createState() => _ListTileViewUVState();

  final Function callback;
  final List<Participant> data;
  const PersonalParticipantUI(
      {this.callback,this.data});
}

class _ListTileViewUVState extends State<PersonalParticipantUI>  {

   bool boolVal = false;
   List<Person> _personList = new List();
   List<Participant> selectedParticipant = new List();
   static int flag = 1;
   Map<int,bool> partInputs = new Map();
   final bloc = ParticipantBloc(flag);



  Future<List<Person>> getParticipant(int flag) async{
      ParticipantSelectModel participantSelectModel = new ParticipantSelectModel();

    if(flag == 1){
      _personList = await participantSelectModel.getTeacher();
    }else if(flag ==2){
      _personList = await participantSelectModel.getStudent();
    }else{
      _personList = await participantSelectModel.getParent();
    }

    return _personList;
  }
  @override
  void initState(){
    setState(() {
     /* for(Person person  in _personList){
        if(!partInputs.containsKey(person.id)) {
          partInputs[person.id] = false;
        }
      }*/
     if(widget.data != null){
      for(Participant participant in widget.data){
         partInputs[participant.id] = true;
      }
     }
     else {
       for (Person person in _personList) {
         partInputs[person.id] = true;
       }
     }
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppTheme.background,
        title: Text("Personal Participant"),
      ),
       body: Container(
             child:Column(
               children: <Widget>[
                 selectParticipant(),
                 serarchParticipant(),
                 Expanded(
                   child:getParticipantList_(),
                 )

               ],
             )
         ),

        bottomNavigationBar:  ButtonUI(),
    );
  }

  selectParticipant() {
    return Padding (
      padding: EdgeInsets.only ( bottom: 5 , top: 5 ) ,
      child: Row (
        children: <Widget>[Material ( //Wrap with Material
          shape: RoundedRectangleBorder (
              borderRadius: new BorderRadius.circular( 0.0 ) ,
              side: BorderSide ( color: AppTheme.nearlyBlue )
          ) ,
          //elevation: 16.0,
          clipBehavior: Clip.antiAlias , // Add This
          child: MaterialButton (
            minWidth: 120.0 ,
            height: 35 ,
            child: new Text( "TEACHER" ,
                style: new TextStyle(
                    fontSize: 12.0 , color: AppTheme.nearlyBlue ) ) ,
            onPressed: ( ) async {
                //Provider.of<ParticipantSelectModel>(context, listen: false).getTeacher();
              bloc.submitQuery(1);
                //getParticipantList();
            } ,
          ) ,
        ) ,
          Material ( //Wrap with Material
            shape: RoundedRectangleBorder (
                borderRadius: new BorderRadius.circular( 0.0 ) ,
                side: BorderSide ( color: AppTheme.nearlyBlue )
            ) ,
            //elevation: 16.0,
            clipBehavior: Clip.antiAlias , // Add This
            child: MaterialButton (
              minWidth: 120.0 ,
              height: 35 ,
              child: new Text( "PARENT" ,
                  style: new TextStyle(
                      fontSize: 12.0 , color: AppTheme.nearlyBlue ) ) ,
              onPressed: ( ) async {
                //getParticipant(2);
                bloc.submitQuery(2);
                //getParticipantList();
                //  Provider.of<ParticipantSelectModel>(context, listen: false).getParent();
              } ,
            ) ,
          ) ,
          Material ( //Wrap with Material
            shape: RoundedRectangleBorder (
                borderRadius: new BorderRadius.circular( 0.0 ) ,
                side: BorderSide ( color: AppTheme.nearlyBlue )
            ) ,
            //elevation: 16.0,
            clipBehavior: Clip.antiAlias , // Add This
            child: MaterialButton (
              minWidth: 120.0 ,
              height: 35 ,
              child: new Text( "STUDENT" ,
                  style: new TextStyle(
                      fontSize: 12.0 , color: AppTheme.nearlyBlue ) ) ,
              onPressed: ( ) {

                bloc.submitQuery(3);
                //getParticipantList();
                // Provider.of<ParticipantSelectModel>(context, listen: false).getStudent("Student");
              } ,
            ) ,
          ) ,
        ] ,
      ) ,
    );

    //return ButtonUI2.init(_formKey, genericModel,'DRAFT','PUBLISH','CLOSE',exam);

  }

  serarchParticipant() {
    return Padding(
      padding: new EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
      child: new TextFormField(
        style: new TextStyle(fontSize: 18.0, color: Colors.black),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Type name",
          suffixIcon: new IconButton(
            icon: new Icon(Icons.search),
          ),
        ),
        onChanged: (text) {
          bloc.searchParticipant(text);
        },
      ),
    );

  }

  getParticipantList() {
    return Column (
      mainAxisSize: MainAxisSize.min ,
      children: <Widget>[
        FutureBuilder (
            future: getParticipant(flag) ,
            builder: ( context , projectSnap ) {
              return Column (
                children: _getParticipantUI ( projectSnap ) ,
              );
            } ) ,
      ] ,

    );
  }


  getParticipantList_(){
    return StreamBuilder(
       stream:  this.bloc.allPersons,
        builder: (context, snapshot) {
          final results = snapshot.data;

         /* if (results.isEmpty) {
            return Center(child: Text('No Results'));
          }*/

          return _getParticipantUI(results);
        },
      );
    }


 _getParticipantUI( personList ) {
  /* for(Person person  in personList){
     if(!partInputs.containsKey(person.id)) {
       partInputs[person.id] = false;
     }
   }*/

  /* for(Person person  in personList){
     if(widget.data.contains(person)) {
        partInputs[person.id] = true;
     }else{
       partInputs[person.id] = false;
     }
   }*/
     return ListView.builder (
             physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true ,
              itemCount: personList.length ,
              itemBuilder: ( context , i ) {
                return CheckboxListTile (
                    value: partInputs.containsKey(personList[i].id) ,
                    title: new Text( personList[i].firstName +
                        "(" +
                        personList[i].lastName +
                        ")" ) ,
                    controlAffinity: ListTileControlAffinity.leading ,
                    onChanged: ( bool val ) {
                      ItemChange ( val , personList[i] );
                    } );
              } );

      /* widgetList.add(widget);
       return widgetList;*/
  }

  void ItemChange( bool val , Person person ) {
    setState ( ( ) {
      partInputs[person.id] = val;
      if (val) {
        if (!selectedParticipant.contains(person.id)) {
            selectedParticipant.add (prepareParticipantObject(person));
        }
      }else{
        selectedParticipant.remove(prepareParticipantObject(person));
      }
    } );
  }


  ButtonUI(   ) {
    return Padding (
      padding: EdgeInsets.only ( bottom: 0 , top: 0 ) ,

      child:Container(
        child:Row (
        children: <Widget>[Material ( //Wrap with Material
          shape: RoundedRectangleBorder (
              borderRadius: new BorderRadius.circular( 0.0 ) ,
              side: BorderSide ( color: AppTheme.nearlyBlue )
          ) ,
          //elevation: 16.0,
          clipBehavior: Clip.antiAlias , // Add This
          child: MaterialButton (
            minWidth: 180.0 ,
            height: 35 ,
            child: new Text( "DONE" ,
                style: new TextStyle(
                    fontSize: 12.0 , color: AppTheme.nearlyBlue ) ) ,
            onPressed: ( ) async {
              widget.callback ( selectedParticipant );
              Navigator.pop ( context );
            } ,
          ) ,
        ) ,
          Material ( //Wrap with Material
            shape: RoundedRectangleBorder (
                borderRadius: new BorderRadius.circular( 0.0 ) ,
                side: BorderSide ( color: AppTheme.nearlyBlue )
            ) ,
            //elevation: 16.0,
            clipBehavior: Clip.antiAlias , // Add This
            child: MaterialButton (
              minWidth: 180.0 ,
              height: 35 ,
              child: new Text( "CANCEL" ,
                  style: new TextStyle(
                      fontSize: 12.0 , color: AppTheme.nearlyBlue ) ) ,
              onPressed: ( ) async {
                  Navigator.pop(context);
              } ,
            ) ,
          ) ,

        ] ,
      ) ,
    ),);
  }

  Participant prepareParticipantObject(Person person){
    Participant participant = new Participant();
    participant.id = person.id;
    if( person.role == "Parent") {
      participant.participantType = "INDIVIDUAL_PARENT";
    }else if( person.role == "Teacher"){
      participant.participantType = "INDIVIDUAL_TEACHER";
    }else{
      participant.participantType = "INDIVIDUAL_STUDENT";
    }
    return participant;
  }
}