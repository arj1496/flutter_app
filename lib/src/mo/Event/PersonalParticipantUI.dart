import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/HeaderContainer.dart';
import 'package:flutter_app/src/mo/teacher/Teacher.dart';
import 'package:flutter_app/src/mo/teacher/TeacherActivity.dart';

import '../../../AppTheme.dart';
import 'Event.dart';

class PersonalParticipantUI extends StatefulWidget {
  @override
  _ListTileViewUVState createState() => _ListTileViewUVState();

}

class _ListTileViewUVState extends State<PersonalParticipantUI> {
  bool boolVal = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppTheme.background,
        title: Text("Personal Participant"),
      ),
       body: SingleChildScrollView(
         child: Column(
         children: <Widget>[
           selectParticipant(),
           serarchParticipant(),
           getParticipantList(),
           ButtonUI(),
         ],
      ),
     ),
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
              //genericModel.status = "DRAFT";

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
      child: new TextField(
        style: new TextStyle(fontSize: 18.0, color: Colors.black),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Type name",
          suffixIcon: new IconButton(
            icon: new Icon(Icons.search),
            onPressed: () async{
              FocusScope.of(context).requestFocus(new FocusNode());
            },
          ),
        ),
      ),
    );
    Expanded(
      child: new Padding(
        padding: new EdgeInsets.only(top: 8.0),
        child: Text("wel"),
      ),
    );
  }

  getParticipantList() {
    return FutureBuilder (
        future:getParticipant(),
        builder: ( context , projectSnap ) {
          return Column (
            children: <Widget>[_getParticipantUI ( projectSnap )] ,
          );
        }
        );
  }

  _getParticipantUI( AsyncSnapshot snapshot ) {
     List<Teacher> teacherList = new List();
    if (snapshot.data != null) {
      // setSelectedList ( widget.data,flag );
      teacherList = snapshot.data;
    }
    return SingleChildScrollView (
      child: ListView.builder (
         physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true ,
          itemCount: teacherList.length ,
          itemBuilder: ( context , i ) {
            return CheckboxListTile (
                value: boolVal ,
                title: new Text( teacherList[i].firstName +
                    "(" +
                    teacherList[i].lastName +
                    ")" ) ,
                controlAffinity: ListTileControlAffinity.leading ,
                onChanged: ( bool val ) {
                  ItemChange ( val , i , );
                } );
          } ) ,
    );
  }

  void ItemChange( bool val , int index ) {
    setState ( ( ) {
      if (val) {
        boolVal = true;
      } else {
        boolVal = false;
      }
    } );
  }

  Future<List<Teacher>> getParticipant() async {
    TeacherActivity teacherActivity = new TeacherActivity();
    List<Teacher> _teachers = await teacherActivity.getAllTeacherList();
    return _teachers;
  }

  ButtonUI(   ) {
    return Padding (
      padding: EdgeInsets.only ( bottom: 0 , top: 30 ) ,
      child: Container(
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
              //genericModel.status = "DRAFT";

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
              child: new Text( "SAVE" ,
                  style: new TextStyle(
                      fontSize: 12.0 , color: AppTheme.nearlyBlue ) ) ,
              onPressed: ( ) async {

              } ,
            ) ,
          ) ,

        ] ,
      ) ,
    ),);
  }
}