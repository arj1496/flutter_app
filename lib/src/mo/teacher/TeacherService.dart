
import 'dart:async';
import 'dart:collection';

import 'package:flutter_app/src/mo/teacher/TeacherDAO.dart';
import 'package:flutter_app/src/mo/teacher/TeacherWebService.dart';
import 'Teacher.dart';

class TeacherServcie{

  TeacherDAO teacherDAO = new TeacherDAO();

  Teacher addTeacher(Teacher teacher){

    Teacher _teacher = teacherDAO.addTeacher(teacher);
    //print("Teacher Server Db Id :- " + _teacher.id.toString());
  }

  // this method is used to save the List of Teachers
  batchAddTeacher(List<Teacher> teacherList){
    teacherDAO.batchAddTeacher(teacherList);
  }

  List<Teacher> getTeacherList_() {
    List<Teacher> teachersList = null;
    Future<List<Teacher>> teacherListFromFuture = teacherDAO.getAllTeacherData();
    teacherListFromFuture.then((teachers){
      teachersList =  teachers;
    });
    return teachersList;
  }

  Future<List<Teacher>> getTeacherList() async{
    List<Teacher> teacherListFromFuture = await teacherDAO.getAllTeacherData();
    return teacherListFromFuture;
  }

  Future<List<Teacher>> getTeacherListDataFromServer() async {
    TeacherWebService _teacherWebService = new TeacherWebService();

    HashMap map = new HashMap<String, String>();
    map['teacher_sync_time'] = 0.toString();

    Map<String, dynamic> teacherDataFromServer = await _teacherWebService.getData_(map, "rest/sync/getSyncInfo");
    List<Teacher> teacherList = null;
    if(teacherDataFromServer['isTeacherSync']){
      print(teacherDataFromServer);
      List<dynamic> teachersDynamic = teacherDataFromServer['teachers'];
      teacherList = List.generate(teachersDynamic.length, (i){
        Teacher teacher = Teacher.fromJson(teachersDynamic[i]);
        return teacher;
      });
      await batchAddTeacher(teacherList);
    }else{
      print('Teacher Sync is false');
    }
    return teacherList;
  }




}