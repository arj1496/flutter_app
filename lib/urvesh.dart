import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/nayan.dart';
import 'package:flutter_app/src/fr/Login.dart';
import 'package:flutter_app/src/fr/LoginService.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter_app/src/fr/SchoolUtils.dart';
import 'package:flutter_app/src/fr/SharedPreference.dart';
import 'package:flutter_app/src/fr/webservice/WebClient.dart';
import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Standard/StandardService.dart';
import 'package:flutter_app/src/mo/Student/Student.dart';
import 'package:flutter_app/src/mo/Student/StudentService.dart';
import 'package:flutter_app/src/mo/Subject/Subject.dart';
import 'package:flutter_app/src/mo/Subject/SubjectService.dart';
import 'package:flutter_app/src/mo/teacher/Teacher.dart';
import 'package:flutter_app/src/mo/teacher/TeacherService.dart';
import 'package:http/http.dart' as http;
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
            .width,
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
            .width,
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
        minWidth: MediaQuery.of(context).size.width,
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

    return Scaffold(
      appBar: AppBar(
        title: Text("Urvesh Page"),
      ),
      body: Center(
          child: Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Column(
                children: <Widget>[
                  /*SizedBox(
                    height: 155.0,
                    child: Image.asset(
                      "images/mount-carmel-logo.png",
                      fit: BoxFit.contain,
                    ),
                  ),*/
                  SizedBox(height: 5.0,),
                  logoutButon,
                  SizedBox(height: 5.0,),
                  homePage,
                  SizedBox(height: 5.0,),
                  getDataBtn,
                  SizedBox(height: 5.0,),
                  saveTeacherBtn,
                  SizedBox(height: 5.0,),
                  saveTeacherBtn_,
                  SizedBox(height: 5.0,),
                  sharedPrefrenceBtn,
                  SizedBox(height: 5.0,),
                  studentsFromServer,
                  SizedBox(height: 5.0,),
                  studentDataFromLocalDB,
                  SizedBox(height: 5.0,),
                  standardsFromServer,
                  SizedBox(height: 5.0,),
                  standardDataFromLocalDB,
                  SizedBox(height: 5.0,),
                  subjectFromServer,
                  SizedBox(height: 5.0,),
                  subjectDataFromLocalDB
                ],
              ),
            ),
          )
      ),
    );
  }

  void getData() {
    WebClient webClient = new WebClient();

    HashMap map = new HashMap<String, String>();
    map['teacher_sync_time'] = 0.toString();

    Future<dynamic> test = webClient.getData_(map, "rest/sync/getSyncInfo");
    test.then((value) {
      if(value['isTeacherSync']){
        print(value);

        List<dynamic> teachers = value['teachers'];
        List<Teacher> test = List.generate(teachers.length, (i){
          Teacher teacher = Teacher.fromJson(teachers[i]);
          return teacher;
        });
        TeacherServcie teacherServcie = new TeacherServcie();
        teacherServcie.batchAddTeacher(test);
      }else{
        print('Teacher Sync is false');
      }
    });
  }

  void addTeacher() {
    Teacher teacher = new Teacher(
      lid: null,
      id: null,
      firstName: "TEst",
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
    List<Teacher> test = await teacherServcie.getTeacherList();
    print(test);
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
    print(standardList);
  }

  _getSubjectDataFromServer() async {
    SubjectService subjectService = new SubjectService();
    List<Subject> subjectList = await subjectService.getSubjectListDataFromServer();
    print(subjectList);
  }

  _getSubjectDataFromLocalDB() async {
    SubjectService subjectService = new SubjectService();
    List<Subject> subjectList = await subjectService.getSubjectListFromLocalDB();
    print(subjectList);
  }

}