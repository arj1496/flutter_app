

import 'dart:convert';

import 'package:flutter_app/src/fr/LoginDAO.dart';
import 'package:flutter_app/src/fr/SharedPreference.dart';
import 'package:flutter_app/src/fr/db/DBProvider.dart';
import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Student/Student.dart';
import 'package:flutter_app/src/mo/Subject/Subject.dart';
import 'package:sqflite/sqflite.dart';

class UserProfileDao{

  LoginDAO loginDAO = new LoginDAO();

  Future<Database> getDataBaseHandler( ) async {
    final dbHelper = DBProvider.single_instance;
    final db = await dbHelper.database;
    return db;
  }

  Future<List<Subject>> getAcceessibleSubjectsFromLocalDB() async{
    Database db = await getDataBaseHandler();
    String fields =
        "s.id as subjectId, "
        "s.name as subjectName, "
        "s.standardId as subStandardId, "
        "s.isAccess as isAccessibleSubject, "
        "s.color as subjectColor, "
        "s.isOptional as subOptional, "
        "s.optionalStudentIds as subOptionalStudentIds, "
        "st.id as standardId,"
        "st.name as standardName, "
        "st.isAccess as stdAccessible ";
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT ${fields} FROM Subject s left join Standard st "
        "on s.standardId = st.id where s.isAccess = 1");
    var subjectList =  List.generate(maps.length, (i) {
      Subject subject = Subject.fromJsonLocalWithStandard(maps[i]);
      print("Subject : ${subject.name} : ${subject.standard.name}" );
      return subject;
    });

    return subjectList;
  }

  Future<List<Standard>> getAcceessibleStandardsFromLocalDB() async{
    Database db = await getDataBaseHandler();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM standard std where std.isAccess = 1");
    var standardList = List.generate(maps.length, (i){
      Standard standard = Standard.fromJsonLocal(maps[i]);
      print("Standard : ${standard.name} : ${standard.name}" );
      return standard;
    });

    return standardList;
  }

  Future<List<SharedPreference>> getSharedPreferenceDataList() async{

    Database db = await getDataBaseHandler();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM SharedPreference ");
    List<SharedPreference> sharedPreferenceData =  List.generate(maps.length, (i) {
      return SharedPreference.fromJson(maps[i]);
    });
    return sharedPreferenceData;
  }

  Map<String, dynamic> getSharedPreferenceDataMap(List<SharedPreference> sharedPreferenceData){
    Map<String, dynamic> sharedPreferenceDataMap = new Map();
    sharedPreferenceData.forEach((sharedPreferenceObject){
      var key = json.decode(sharedPreferenceObject.key);
      var value = json.decode(sharedPreferenceObject.value);
      sharedPreferenceDataMap[key] = value;
    });
    return sharedPreferenceDataMap;
  }

  Map<String, dynamic> getUserDetails(Map<String, dynamic> sharedPreferenceDataMap){
    return sharedPreferenceDataMap['userDetails'];
  }

  Map<String, dynamic> getSchoolDetails(Map<String, dynamic> sharedPreferenceDataMap){
    return sharedPreferenceDataMap['schoolDetail'];
  }

  getEmailIdFromLocalDB() async{
    List<SharedPreference> sharedPreferenceData = await getSharedPreferenceDataList();
    Map<String, dynamic> sharedPreferenceDataMap = getSharedPreferenceDataMap(sharedPreferenceData);
    Map<String, dynamic> userDetails = getUserDetails(sharedPreferenceDataMap);
    var emailId = userDetails['userId'];
    return emailId;
  }

  getRoleFromLocalDB() async{
    List<SharedPreference> sharedPreferenceData = await getSharedPreferenceDataList();
    Map<String, dynamic> sharedPreferenceDataMap = getSharedPreferenceDataMap(sharedPreferenceData);
    Map<String, dynamic> userDetails = getUserDetails(sharedPreferenceDataMap);
    var role = userDetails['role'];
    return role;
  }

  getStudentsOfParentFromLocalDB() async{
    List<SharedPreference> sharedPreferenceData = await getSharedPreferenceDataList();
    Map<String, dynamic> sharedPreferenceDataMap = getSharedPreferenceDataMap(sharedPreferenceData);
    Map<String, dynamic> userDetails = getUserDetails(sharedPreferenceDataMap);
    List<Student> studentList =  getStudentObjectFromGrowableList(userDetails['students']);
    return studentList;
  }

  List<Student> getStudentObjectFromGrowableList(List<dynamic> studentGrowableList){
    List<Student> studentList;
    if(studentGrowableList != null && studentGrowableList.length > 0){
      studentList = List.generate(studentGrowableList.length, (i){
        Student student = Student.fromJson_server(studentGrowableList[i]);
        return student;
      });
    }
    return studentList;
  }




}