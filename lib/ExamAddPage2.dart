import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/mo/Exam/Exam.dart';
import 'package:flutter_app/src/mo/Exam/ExamActivity.dart';
import 'package:flutter_app/src/mo/Exam/ExamService.dart';
import 'package:flutter_app/src/mo/Student/Student.dart';
import 'package:flutter_app/src/mo/Student/StudentActivity.dart';
import 'package:flutter_app/src/mo/Student/StudentService.dart';

import 'AppTheme.dart';

class ExamAddPage2 extends StatefulWidget {
  @override
  State createState() => YourPageState();
}

class YourPageState extends State<ExamAddPage2> {
  List<String> _standard = <String>['Class-1', 'Class-2', 'Class-3', 'Class-4', 'Class-5','Class-6', 'Class-7', 'Class-8', 'Class-9', 'Class-10'];
  TextEditingController controller = new TextEditingController();
  String filter = "Select Class";
  static ExamService examService = new ExamService();
  StudentActivity studentActivity = new StudentActivity();
  Exam exam = examService.getExam();
  ExamActivity examActivity = new ExamActivity();
  @override
  void initState() {
    super.initState();
    //fill countries with objects
    controller.addListener(() {
      setState(() {
        filter = controller.text;

      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
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
                      int examObject = await examActivity.addExamToServer(exam);
                        controller.clear();
                        FocusScope.of(context).requestFocus(new FocusNode());
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
            MaterialButton(
              minWidth: 200.0,
              height: 35,

              child: new Text("Add exam",
                  style: new TextStyle(fontSize: 12.0, color: AppTheme.nearlyBlue)),
              onPressed: () async{
                //int examObject = await examActivity.addExamToServer(exam);

//          setState(() {
//            _isNeedHelp = true;
//          });
              },
            ),

            MaterialButton(
              minWidth: 200.0,
              height: 35,

              child: new Text("get exam",
                  style: new TextStyle(fontSize: 12.0, color: AppTheme.nearlyBlue)),
              onPressed: ()async {
              /*  List<Student> studentObject = await studentActivity.getStudentListFromLocalDB();
                String str = json.encode(studentObject);
                print("student left join examaddpage2: ${str} ");

*///          setState(() {
//            _isNeedHelp = true;
//          });
                List<Exam> examList = await examActivity.getFilterExam(9, 62, "Terminal (A)");
                print(examList.length);
              },
            ),

            MaterialButton(
              minWidth: 200.0,
              height: 35,

              child: new Text("sub join demo",
                  style: new TextStyle(fontSize: 12.0, color: AppTheme.nearlyBlue)),
              onPressed: ()async {
               // List<Exam> examObject = await examService.getSubJoinDbExam();
                //print(examObject.length);
//          setState(() {
//            _isNeedHelp = true;
//          });
              },
            ),
          ],
        ));
  }

  Widget _buildListView() {
    return ListView.builder(

        itemCount: _standard.length,
        itemBuilder: (BuildContext context, int index) {

          if (filter == null || filter == "") {
            return _buildRow(_standard[index]);
          } else {
            if (_standard[index]
                .toLowerCase()
                .contains(filter.toLowerCase())) {
              return _buildRow(_standard[index]);
            } else {
              return new Container();
            }
          }

        }
    );
  }

  Widget _buildRow(String c) {
    return new ListTile(
        title: new Text(
          c,
        ),
        onTap:(){
          setState((){
            filter = c;
            //if you want to assign the index somewhere to check
          });}
    );
  }
}