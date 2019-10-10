
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

  List<Teacher> getTeacherListDataFromServer() {
    TeacherWebService _teacherWebService = new TeacherWebService();

    HashMap map = new HashMap<String, String>();
    map['teacher_sync_time'] = 0.toString();

    Future<dynamic> teacherFromServerFuture = _teacherWebService.getData_(map, "rest/sync/getSyncInfo");
    List<dynamic> techersDynamic = teacherFromServerFuture.then((value) {
      if(value['isTeacherSync']){
        print(value);
        List<dynamic> teachers = value['teachers'];
        return teachers;
      }
      return null;
    }) as List;

    List<Teacher> teacherList = List.generate(techersDynamic.length, (i){
      Teacher teacher = Teacher.fromJson(techersDynamic[i]);
      return teacher;
    });
    TeacherServcie teacherServcie = new TeacherServcie();
    for(var i = 0; i < teacherList.length; i++){
      Teacher teacher = teacherList[i];
      teacherServcie.addTeacher(teacher);
    }
    return teacherList;
  }




}