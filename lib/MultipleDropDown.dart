
import 'package:flutter/material.dart';
import 'package:flutter_app/StandardDropdownWidget.dart';
import 'package:flutter_app/SubjectDropdownWidget.dart';
import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Subject/Subject.dart';
import 'package:flutter_app/src/mo/Subject/SubjectActivity.dart';
import 'package:flutter_app/src/mo/Subject/SubjectService.dart';




class MultipleDropDown extends StatelessWidget {

  TextEditingController labelText = new TextEditingController( );
  String classOf = "Select Class";
  String subjectOf = "Select Class";
  static int selectedStandardId;
  static List<Standard> _standard;

  static List<Subject> _subject;
  static SubjectService subjectService = new SubjectService( );

  @override
  Widget build( BuildContext context ) {
    return Container (
      padding: EdgeInsets.symmetric ( horizontal: 50 , vertical: 30 ) ,
      child: Column (
        children: <Widget>[
         /* StandardDropdownWidget(),
          SubjectDropdownWidget(),*/
        ] ,
      ) ,
    );
  }
}


