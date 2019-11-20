import 'package:flutter/material.dart';
import 'package:flutter_app/src/mo/Event/ParticipantType.dart';
import 'package:flutter_app/src/mo/Participant/EventKeyPojo.dart';
import 'package:flutter_app/src/mo/Participant/EventKeyPojo.dart' as prefix0;
import 'package:flutter_app/src/mo/Participant/Participant.dart';
import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Standard/StandardActivity.dart';
import '../../../AppTheme.dart';


class ClassPopup extends StatefulWidget {

  final Function callback;
  final List<int> data;
  const ClassPopup(
      {this.callback,this.data});

  @override
  State<StatefulWidget> createState() => _MyPageState();
}

Future< Map<Standard,List<EventKeyPojo>>> getStandards() async {
  StandardActivity standardActivity = new StandardActivity();
  List<Standard>_standardList = await standardActivity.getStandardListFromLocalDB();
  Map<Standard,List<EventKeyPojo>> _standards = prePareMap(_standardList);
  return _standards;
}

Map<Standard, List<EventKeyPojo>> prePareMap(List<Standard> standardList) {


    Map<Standard,List<EventKeyPojo>> standardMap = new Map();

    for(Standard standard in standardList){
      List<EventKeyPojo> eventKeyPojoList = getEventPojo(standard);
      standardMap[standard] = eventKeyPojoList;
    }
    return standardMap;
}

List<EventKeyPojo> getEventPojo(Standard standard){
  List<EventKeyPojo> eventKeyPojoList = new List();
    EventKeyPojo eventKeyPojo = new EventKeyPojo();
    eventKeyPojo.id = standard.id.toString() + "_TEACHER";
    eventKeyPojo.name = "TEACHER";
    eventKeyPojo.select =false;
    eventKeyPojoList.add(eventKeyPojo);
    EventKeyPojo eventKeyPojo1 = new EventKeyPojo();
    eventKeyPojo1.id = standard.id.toString() + "_PARENT";
    eventKeyPojo1.name = "PARENT";
  eventKeyPojo1.select =false;
    eventKeyPojoList.add(eventKeyPojo1);
    EventKeyPojo eventKeyPojo2 = new EventKeyPojo();
    eventKeyPojo2.id = standard.id.toString() + "_STUDENT";
    eventKeyPojo2.name = "STUDENT";
  eventKeyPojo2.select =false;
    eventKeyPojoList.add(eventKeyPojo2);
    return eventKeyPojoList;
  }


class _MyPageState extends State<ClassPopup> {

  Map<Standard,List<EventKeyPojo>> standardMap = new Map( );
  List<Participant> selectedsStandardList = new List( );
  Map<String,bool> partInputs = new Map();
  Map<int,bool> stdInputs = new Map( );
  List<Standard> standardList = new List();
  bool flag = true;


/*  @override
  void initState(){
    super.initState();
    setState(() {
      for (Standard standard in standardMap.keys) {
        for(int t=0;t<standardMap[standard].length;t++){
          EventKeyPojo eventKeyPojo = standardMap[standard][t];
          partInputs[eventKeyPojo.id] = false;
        }
        }
    });
  }*/

  @override
  Widget build( BuildContext context ) {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
          backgroundColor: AppTheme.background,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: AppTheme.background,
            title: Text("Edit Exam form"),
          ),
          //body: _getContainerBody(),
          body:SingleChildScrollView(
            child: _showAlert(context),
          ),
        bottomNavigationBar: _submitButton() ,
      ),
    );
  }

  _submitButton() {
    return Padding (
      padding: EdgeInsets.only ( bottom: 0 , top: 30 ) ,
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
              minWidth: 160.0 ,
              height: 35 ,
              child: new Text( "SAVE" ,
                  style: new TextStyle(
                      fontSize: 12.0 , color: AppTheme.nearlyBlue ) ) ,
              onPressed: ( ) async {
                widget.callback ( selectedsStandardList );
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
                minWidth: 160.0 ,
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

  Widget _showAlert( BuildContext context ) {
    return Column (
        mainAxisSize: MainAxisSize.min ,
        children: <Widget>[
          FutureBuilder (
              future: getStandards( ) ,
              builder: ( context , projectSnap ) {
                return Column (
                  children: _getStandardList ( projectSnap ) ,
                );
              } ) ,
        ] ,

    );


  }

  List<Widget> _getStandardList( AsyncSnapshot snapshot ) {
    standardMap = snapshot.data;
  //  print ( standardMap.length );
    if (snapshot.data != null) {
      // setSelectedList ( widget.data,flag );
      standardMap = snapshot.data;
        setRange ( );
    }
    List<Widget> widgetList = new List();
    int i =0;
    if(standardMap != null) {
      for (Standard standard in standardMap.keys) {
        Widget widget = getWidget ( standard , standardMap[standard] , i );
        // setRange_(standardMap[standard]);

         for(int t=0;t<standardMap[standard].length;t++){
           EventKeyPojo eventKeyPojo = standardMap[standard][t];
           if(!partInputs.containsKey(eventKeyPojo.id)) {
             partInputs[eventKeyPojo.id] = false;
           }
          }
        i++;
        widgetList.add ( widget );
      }
    }
    return widgetList;
  }
  Widget getWidget(Standard standard,standardList,index){
    standardList = standardList;
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(0.0),
        child: Row(
         children: <Widget>[
            Checkbox(
              value: stdInputs[standard.id] ,
              onChanged: (bool value,) {
                setState(() {
                  ItemStandardChange ( value , standard , );
                });
              },
            ),
            Text(standard.name,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: AppTheme.robotoFontName,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        letterSpacing: 0.0,
                        color: AppTheme.nearlyBlack
                            .withOpacity(0.6),
                      ),
                    ),
         ],
        ),
      ),
          Padding(
            padding: const EdgeInsets.only(top:3.0),
            child: Container(
              height: 3,

              decoration: BoxDecoration(
                gradient: LinearGradient ( colors: [
                  AppTheme.nearlyDarkBlue ,
                  HexColor ( "#6F56E8" )
                ],
                ),
                borderRadius: BorderRadius.all(
                    Radius.circular(6.0)),
              ),
            ),
          ),
      ListView.builder (
           physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true ,
          itemCount: standardList.length ,
          itemBuilder: ( context , i ) {
            return CheckboxListTile (
                value:partInputs[standardList[i].id],
                title: new Text( standardList[i].name) ,
                controlAffinity: ListTileControlAffinity.leading ,
                onChanged: ( bool val ) {
                  ItemChange ( val , standardList[i] );
                } );
          } ),

          Padding(
            padding: const EdgeInsets.only(bottom:3.0),
            child: Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient ( colors: [
                  AppTheme.nearlyDarkBlue ,
                  HexColor ( "#6F56E8" )
                ],
                ),
                borderRadius: BorderRadius.all(
                    Radius.circular(6.0)),
              ),
            ),
          ),
      ],
    );
  }




  void ItemChange( bool val , EventKeyPojo index ) {
    setState ( ( ) {

      partInputs[index.id] = val;
      if (val) {
        if (!selectedsStandardList.contains ( standardMap[index])) {
          selectedsStandardList.add ( prepareEventKeyParticipantObject(index));
        }
      }
    } );
  }

  void ItemStandardChange( bool val , Standard standard ) {
    setState ( ( ) {
      stdInputs[standard.id] = val;
      List<EventKeyPojo> selectedClassPart = standardMap[standard];
      for(EventKeyPojo selectedClass in selectedClassPart){
        partInputs[selectedClass.id] = val;
      }
      if (val) {
        selectedsStandardList.add(prepareParticipantObject(standard));
      }else{
        selectedsStandardList.remove(prepareParticipantObject(standard));
      }
    } );
  }

  setSelectedList( data ,flag) {
    if(flag) {
      for (int i = 0; i < data.length; i++) {
        if (!selectedsStandardList.contains ( data[i] )) {
           selectedsStandardList.add (prepareParticipantObject( data[i]) );
        }
      }
    }
    flag = false;
  }

  setRange( ) {
    for (Standard standard in standardMap.keys) {
      if(!stdInputs.containsKey(standard.id)) {
        stdInputs[standard.id] = false;
      }
    }
  }

  /*setRange_(List<EventKeyPojo> stdList){
    for (int i = 0; i <stdList.length; i++) {
      EventKeyPojo eventKeyPojo = new EventKeyPojo();
      eventKeyPojo = stdList[i];
      eventKeyPojo.select = true;
      partInputs.add(eventKeyPojo);
    }
  }*/

  Participant prepareParticipantObject(Standard standard){
    Participant participant = new Participant();
    participant.participantId = standard.id;
    participant.participantType ="STANDARD";
    return participant;
  }

  Participant prepareEventKeyParticipantObject(EventKeyPojo eventKeyPojo){
    Participant participant = new Participant();
    List<String> str = eventKeyPojo.id.split("_");
    //participant.standard = standard;
    participant.participantId = int.parse(str[0]);
    participant.participantType ="STANDARD_"+str[1];
    return participant;
  }


}