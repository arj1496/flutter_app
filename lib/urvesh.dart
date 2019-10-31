import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/src/fr/Login.dart';
import 'package:flutter_app/src/fr/LoginService.dart';
import 'package:flutter_app/src/fr/SharedPreference.dart';
import 'package:flutter_app/src/mo/Parent/Parent.dart';
import 'package:flutter_app/src/mo/Parent/ParentService.dart';
import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Standard/StandardService.dart';
import 'package:flutter_app/src/mo/Student/Student.dart';
import 'package:flutter_app/src/mo/Student/StudentService.dart';
import 'package:flutter_app/src/mo/Subject/Subject.dart';
import 'package:flutter_app/src/mo/Subject/SubjectService.dart';
import 'package:flutter_app/src/mo/Synchronization/SyncService.dart';
import 'package:flutter_app/src/mo/teacher/Teacher.dart';
import 'package:flutter_app/src/mo/teacher/TeacherService.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class UrveshHome extends StatefulWidget{

  @override
  _UrveshHomePageState createState() => _UrveshHomePageState();
}

class _UrveshHomePageState extends State<UrveshHome> {

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 15.0);
  SharedPreferences sharedPreferences;

  @override
  initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (
          Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _getNormalScafold();
    //return _getFormScafold();
  }

  Scaffold _getNormalScafold() {
    final logoutButon = Material(
      color: Colors.indigo,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(

        minWidth: MediaQuery
            .of(context)
            .size
            .width / 2,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          sharedPreferences.clear();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (BuildContext context) => LoginPage()
              ), (Route<dynamic> route) => false
          );
        },
        child: Text("Logout",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final homePage = Material(
      color: Colors.indigo,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(

        minWidth: MediaQuery
            .of(context)
            .size
            .width / 2,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) => MyApp()
              ), (Route<dynamic> route) => false
          );
        },
        child: Text("Home Page",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final getDataBtn = Material(
      color: Colors.indigo,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width / 2,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          getTeacherData();
        },
        child: Text("Get Teacher Data from LocalDB",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold
            )
        ),
      ),
    );

    final saveTeacherBtn = Material(
      color: Colors.indigo,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(

        minWidth: MediaQuery
            .of(context)
            .size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          addTeacher();
        },
        child: Text("Save Teacher to LocalDB",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final saveTeacherBtn_ = Material(
      color: Colors.indigo,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(

        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _getTecherFromServerAndSaveToLocalDB();
        },
        child: Text("Save Teacher to LocalDB get from WebService",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final sharedPrefrenceBtn = Material(
      color: Colors.indigo,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(

        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _getSharedPreDataFromLocalDB();
        },
        child: Text("get Shared Data from LocalDB ",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final studentsFromServer = Material(
      color: Colors.indigo,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(

        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _getStudentDataFromServer();
        },
        child: Text("get Student Data From Server ",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final studentDataFromLocalDB = Material(
      color: Colors.indigo,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(

        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _getStudentDataFromLocalDB();
        },
        child: Text("get Student Data from LocalDB ",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );


    final standardsFromServer = Material(
      color: Colors.indigo,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(

        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _getStandardDataFromServer();
        },
        child: Text("get Standard Data From Server ",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final standardDataFromLocalDB = Material(
      color: Colors.indigo,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(

        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _getStandardDataFromLocalDB();
        },
        child: Text("get Standard Data from LocalDB ",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final subjectFromServer = Material(
      color: Colors.indigo,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(

        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _getSubjectDataFromServer();
        },
        child: Text("get Subject Data From Server ",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final subjectDataFromLocalDB = Material(
      color: Colors.indigo,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(

        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _getSubjectDataFromLocalDB();
        },
        child: Text("get Subject Data from LocalDB ",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final parentFromServer = Material(
      color: Colors.indigo,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(

        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _getParentDataFromServer();
        },
        child: Text("get Parent Data From Server ",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final parentDataFromLocalDB = Material(
      color: Colors.indigo,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(

        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _getParentDataFromLocalDB();
        },
        child: Text("get Parent Data from LocalDB ",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final syncData = Material(
      color: Colors.indigo,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(

        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _getParameterizedSyncData();
        },
        child: Text("Sync parameterized data from server ",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Urvesh Page"),
      ),
      body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
              child: Column(
                children: <Widget>[
                  logoutButon,
                  SizedBox(height: 5.0,),
                  homePage,
                  SizedBox(height: 5.0,),
                  getDataBtn,
                  //SizedBox(height: 5.0,),
                  //saveTeacherBtn,
                  //SizedBox(height: 5.0,),
                  //saveTeacherBtn_,
                  SizedBox(height: 5.0,),
                  sharedPrefrenceBtn,
                  //SizedBox(height: 5.0,),
                  //studentsFromServer,
                  SizedBox(height: 5.0,),
                  studentDataFromLocalDB,
                  //SizedBox(height: 5.0,),
                  //standardsFromServer,
                  SizedBox(height: 5.0,),
                  standardDataFromLocalDB,
                  //SizedBox(height: 5.0,),
                  //subjectFromServer,
                  SizedBox(height: 5.0,),
                  subjectDataFromLocalDB,
                  //SizedBox(height: 5.0,),
                  //parentFromServer,
                  SizedBox(height: 5.0,),
                  parentDataFromLocalDB,
                  SizedBox(height: 5.0,),
                  syncData
                ],
              ),
            ),
          )
      ),
    );
  }

  void addTeacher() {
    Teacher teacher = new Teacher(
      lid: null,
      id: null,
      firstName: "Test",
      lastName: "Teacher",
      person: 3,
      gender: "M",
      email: "urveshTEst@urvesh.com",
      standardIds: "11,12,13,14,15",
      subjectIds: "16,17,18,19,20",
      userId: 4,
      role: "teacher"
    );

    TeacherServcie teacherServcie = new TeacherServcie();
    teacherServcie.addTeacher(teacher);

  }

  Future<List<Teacher>> getTeacherData() async{
    TeacherServcie teacherServcie = new TeacherServcie();
    List<Teacher> teacherList = await teacherServcie.getTeacherList();
    print(teacherList);
    for(int i = 0; i < teacherList.length; i++){
      print('id : ${teacherList[i].id} | name :  ${teacherList[i].firstName} ${teacherList[i].lastName}');
    }
  }

  Future<List<Teacher>> _getTecherFromServerAndSaveToLocalDB() async {
    TeacherServcie teacherServcie = new TeacherServcie();
    List<Teacher> _teacherList =  await teacherServcie.getTeacherListDataFromServer();
    print(_teacherList);
    return _teacherList;

  }

  Future<List<SharedPreference>> _getSharedPreDataFromLocalDB() async {
    LoginService loginService = new LoginService();
    List<SharedPreference> _sharedPreferenceList =  await loginService.getSharedPrefrerenceData();
    _sharedPreferenceList.forEach((sharedPreferenceObject){
     var data = json.decode(sharedPreferenceObject.value);
     print(data);
    });
    return _sharedPreferenceList;
  }

  _getStudentDataFromServer() async {
    StudentService studentService = new StudentService();
    List<Student> studentList = await studentService.getStudentListDataFromServer();
    print(studentList);
  }

  _getStudentDataFromLocalDB() async {
    StudentService studentService = new StudentService();
    List<Student> studentList = await studentService.getStudentListFromLocalDB();
    print(studentList);
  }

  _getStandardDataFromServer() async {
    StandardService standardService = new StandardService();
    List<Standard> standardList = await standardService.getStandardListDataFromServer();
    print(standardList);
  }

  _getStandardDataFromLocalDB() async {
    StandardService standardService = new StandardService();
    List<Standard> standardList = await standardService.getStandardListFromLocalDB();
    print(standardList.length);
    for(int i = 0; i < standardList.length; i++){
      print('id : ${standardList[i].id} name :  ${standardList[i].name}');
    }
  }

  _getSubjectDataFromServer() async {
    SubjectService subjectService = new SubjectService();
    List<Subject> subjectList = await subjectService.getSubjectListDataFromServer();
    print(subjectList);
  }

  _getSubjectDataFromLocalDB() async {
    SubjectService subjectService = new SubjectService();
    List<Subject> subjectList = await subjectService.getSubjectListFromLocalDB();
    print(subjectList.length);
    for(int i = 0; i < subjectList.length; i++){
      print('id : ${subjectList[i].id} name :  ${subjectList[i].name}');
    }
  }

  _getParentDataFromServer() async {
    ParentService parentService = new ParentService();
    List<Parent> parentList = await parentService.getParentListDataFromServer();
    print(parentList);
  }

  _getParentDataFromLocalDB() async {
    ParentService parentService = new ParentService();
    List<Parent> parentList = await parentService.getParentListFromLocalDB();
    print(parentList);
  }

  void _getParameterizedSyncData() async {
    SyncService syncService = new SyncService();
    await syncService.regularLightSync();
  }

}