
import 'package:flutter/material.dart';
import 'package:flutter_app/StandardDropdownWidget.dart';
import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Standard/StandardService.dart';
import 'package:flutter_app/src/mo/Subject/Subject.dart';
import 'package:flutter_app/src/mo/Subject/SubjectActivity.dart';
import 'package:flutter_app/src/mo/Subject/SubjectService.dart';

// Generic standard drop down list

class SubjectDropdownWidget extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return ExamAddUIState.init();
  }
}
Future<List<Subject>> getSubjects() async{
  StandardDropDown standardWidget = new StandardDropDown();
  int id= standardWidget.getSelectedStandard();
  SubjectActivity subjectActivity = new SubjectActivity();
  if(id!=null) {
    List<Subject> subjectList = await subjectActivity
        .getSubjectByStandardId (id);
    return subjectList;
  }else{
    List<Subject> subjectList = await subjectActivity.getSubjectListFromLocalDB();
  }
  return null;
}
class ExamAddUIState extends State<SubjectDropdownWidget> {

  TextEditingController labelText = new TextEditingController( );
  String subjectOf = "Select Subject";
  ExamAddUIState.init( ){

  }

  @override
  Widget build( BuildContext context ) {
    return FutureBuilder (
        future: getSubjects() ,
        builder: ( context , projectSnap ) {
          //if ( projectSnap.data != null) {
            return _getDropDownFormField (  Icon ( Icons.subject ) , projectSnap );
         // }
    });

  }

  _getDropDownFormField( Icon icon,AsyncSnapshot snapshot ) {
    List<Subject> subjectList = new List();
    if(snapshot.data != null){
      subjectList = snapshot.data;
    }
          return FormField (
              builder: ( FormFieldState state ) {
                return InputDecorator (
                  decoration: InputDecoration (
                      icon: icon ,
                      prefixText: subjectOf
                  ) ,
                  child: DropdownButtonHideUnderline (
                      child: Padding (
                        padding: EdgeInsets.only ( right: 8.0 , left: 8.0 ) ,
                        child: DropdownButton (
                          isDense: true ,

                          onChanged: ( String newValue ) {
                            setState ( ( ) {
                              subjectOf = newValue;
                              state.didChange ( newValue );
                            } );
                          } ,

                          items: subjectList.map ( ( Subject subject ) {
                            return new DropdownMenuItem(
                              value: subject.name ,
                              child: new Text( subject.name ) ,
                            );
                          }).toList (),
                        ) ,
                      )
                  ) ,
                );
              }
          );


  }
}
