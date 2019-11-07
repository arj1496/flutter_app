import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/mo/Exam/Exam.dart';
import 'package:flutter_app/src/mo/Exam/ExamActivity.dart';
import 'package:flutter_app/src/mo/Exam/ExamService.dart';
import 'package:flutter_app/src/mo/Student/StudentActivity.dart';
import 'package:flutter_app/src/mo/Student/StudentService.dart';
import 'package:flutter_app/src/mo/Subject/Subject.dart';
import 'package:flutter_app/src/mo/Subject/SubjectService.dart';

import '../../../AppTheme.dart';


class SubjectList extends StatefulWidget {
  @override
  State createState() => YourPageState();
}

class YourPageState extends State<SubjectList> {
  List<String> _standard = <String>['Class-1', 'Class-2', 'Class-3', 'Class-4', 'Class-5','Class-6', 'Class-7', 'Class-8', 'Class-9', 'Class-10'];
  TextEditingController controller = new TextEditingController();
  Subject filter;
  static ExamService examService = new ExamService();
  StudentActivity studentActivity = new StudentActivity();
  Exam exam = examService.getExam();
  ExamActivity examActivity = new ExamActivity();


  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
  Future<List<Subject>> getSubjects() async{
    SubjectService subjectService = new SubjectService();
    List<Subject> _subject = await subjectService.getAccesibleSubjectList();
    return _subject;
  }
  @override
  Widget build(BuildContext context) {
    return new Material(

        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Padding(
                padding: new EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
                child: new TextField(

                  style: new TextStyle(fontSize: 18.0, color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: new Icon(Icons.search),

                    //labelText: filter,
                    suffixIcon: new IconButton(
                      icon: new Icon(Icons.close),
                      onPressed: () async{

                      },
                    ),
                    //hintText: "Select class...",

                  ),
                  controller: controller,
                )),
            new Expanded(
              child: new Padding(
                  padding: new EdgeInsets.only(top: 8.0),
                  child: _buildListView()),
            ),
            ],
        ));
  }

  Widget _buildListView() {
    return FutureBuilder (
        future: getSubjects() ,
        builder: ( context , projectSnap ) {

          if (filter == null || filter == "") {
            return _buildRow(projectSnap.data);
          }
        }
    );
  }

  Widget _buildRow(Subject c) {
    return new ListTile(
        title: new Text(
          c.name + c.standard.name,
        ),
        onTap:(){
          setState((){
            filter = c;
            //if you want to assign the index somewhere to check
          });}
    );
  }
}