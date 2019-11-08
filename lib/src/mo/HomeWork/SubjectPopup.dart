import 'package:flutter/material.dart';
import 'package:flutter_app/src/fr/UserProfile.dart';
import 'package:flutter_app/src/mo/Subject/Subject.dart';
import 'package:flutter_app/src/mo/Subject/SubjectService.dart';

class SubjectPopup extends StatefulWidget {

  final Function callback;
  final List<int> data;
  const SubjectPopup(
      {this.callback,this.data}

  );

  @override
  State<StatefulWidget> createState() => _MyPageState();
}

Future<List<Subject>> getSubjects() async {
  UserProfile userProfile = new UserProfile();
  List<Subject> _subject = await userProfile.getAccessibleSubjects();
  return _subject;
}

class _MyPageState extends State<SubjectPopup> {
  List<Subject> subjectList = new List( );
  List<int> selectedsSubjectList = new List( );
  bool flag = true;

  @override
  Widget build( BuildContext context ) {
    return _showAlert ( context );
  }

  Widget _showAlert( BuildContext context ) {
    return AlertDialog (
      title: Text ( "Select Subject" ) ,
      content: Column (
        mainAxisSize: MainAxisSize.min ,
        children: <Widget>[
          FutureBuilder (
              future: getSubjects ( ) ,
              builder: ( context , projectSnap ) {
                return Column (
                  children: <Widget>[_getSubjectList ( projectSnap )] ,
                );
              } ) ,
        ] ,
      ) ,
      actions: <Widget>[
        MaterialButton (
            child: Text ( "Select" ) ,
            onPressed: ( ) {
              widget.callback ( selectedsSubjectList );
              Navigator.pop ( context );
            } ) ,
        MaterialButton (
            child: Text ( "Close" ) ,
            onPressed: ( ) {
              Navigator.of ( context ).pop ( );
            } ) ,
      ] ,
    );
  }

  _getSubjectList( AsyncSnapshot snapshot ) {
    // List<Subject> subjectList = new List();
    if (snapshot.data != null) {
     // setSelectedList ( widget.data,flag );
      subjectList = snapshot.data;
      setRange ( );
    }
    return SingleChildScrollView (
      child: ListView.builder (
          shrinkWrap: true ,
          itemCount: subjectList.length ,
          itemBuilder: ( context , i ) {
            return CheckboxListTile (
                value: inputs[i] ,
                title: new Text( subjectList[i].name +
                    "(" +
                    subjectList[i].standard.name +
                    ")" ) ,
                controlAffinity: ListTileControlAffinity.leading ,
                onChanged: ( bool val ) {
                  ItemChange ( val , i , );
                } );
          } ) ,
    );
  }

  List<bool> inputs = new List<bool>( );

  void ItemChange( bool val , int index ) {
    setState ( ( ) {
      inputs[index] = val;
      if (val) {
        if (!selectedsSubjectList.contains ( subjectList[index].id )) {
          selectedsSubjectList.add ( subjectList[index].id );
        }
      } /*else {
        selectedsSubjectList.removeAt ( index );
      }*/
    } );
  }

  setSelectedList( data ,flag) {
    if(flag) {
      for (int i = 0; i < data.length; i++) {
        if (!selectedsSubjectList.contains ( data[i] )) {
          selectedsSubjectList.add ( data[i] );
        }
      }
    }
    flag = false;
  }

  setRange( ) {
    for (int i = 0; i < subjectList.length; i++) {
      if (widget.data.contains ( subjectList[i].id )) {
        inputs.add ( true );
        if (!selectedsSubjectList.contains ( widget.data[i] )) {
          selectedsSubjectList.add ( widget.data[i] );
        }
      } else {
        inputs.add ( false );
      }

      //inputs.add(true);
    }
  }
}