import 'package:flutter/material.dart';
import 'package:flutter_app/src/mo/Event/ParticipantType.dart';
import 'package:flutter_app/src/mo/Participant/EventKeyPojo.dart';
import 'package:flutter_app/src/mo/Participant/EventKeyPojo.dart' as prefix0;
import 'package:flutter_app/src/mo/Participant/Participant.dart';
import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Standard/StandardActivity.dart';
import '../../../AppTheme.dart';


class SubjectPopup extends StatefulWidget {

  final Function callback;
  final List<int> data;
  const SubjectPopup(
      {this.callback,this.data});

  @override
  State<StatefulWidget> createState() => _MyPageState();
}






class _MyPageState extends State<SubjectPopup> {

  List<String> schoolPaticipant = ["SCHOOL","SCHOOL STUDENTS","SCHOOL TEACHERS","SCHOOL PARENTS"];
  Map<int,bool> partInputs = new Map();
  List<Participant> selectedSchoolParticipant = new List();



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
                widget.callback ( selectedSchoolParticipant );
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

  _showAlert(  callback) {
    return showDialog (
        context: context ,
        builder: ( context ) {
          return AlertDialog (
              title: new Text( "Particpant" ) ,
              content:  Container(
                child: Column (
                  mainAxisSize: MainAxisSize.min ,
                  children: <Widget>[
                    ListView.builder (
                      //physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true ,
                        itemCount: schoolPaticipant.length ,
                        itemBuilder: ( context , i ) {
                          return CheckboxListTile (
                              value: partInputs.length > 0 ? partInputs[i]:false,
                              title: new Text( schoolPaticipant[i] ) ,
                              controlAffinity: ListTileControlAffinity.leading ,
                              onChanged: ( bool val ) {
                                setState(() {
                                  ItemChange ( val , i , );
                                });
                              } );
                        } ),
                  ] ,
                ),
              ),



              actions: <Widget>[
                MaterialButton (
                    child: Text ( "DONE" ) ,
                    onPressed: ( ) {
                      callback (selectedSchoolParticipant );
                      Navigator.pop ( context );
                    } ) ,
              ]
          );
        }
    );
  }







  void ItemChange( bool val , int index ) {
    setState ( ( ) {
      partInputs[index] = val;
      if (val) {
        selectedSchoolParticipant.add (
            prepareParticipantObject ( schoolPaticipant[index] ) );
      }
    } );
  }



  Participant prepareParticipantObject(String type){

    Participant participant = new Participant();
    participant.participantType = type;
    participant.participantRole = "VIEWER";
    return participant;
  }





}