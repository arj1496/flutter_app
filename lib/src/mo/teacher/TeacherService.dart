
import 'dart:async';

import 'package:flutter_app/src/mo/teacher/TeacherDAO.dart';
import 'Teacher.dart';

class TeacherServcie{

  TeacherDAO teacherDAO = new TeacherDAO();

  Teacher addTeacher(Teacher teacher){

    Teacher _teacher = teacherDAO.addTeacher(teacher);
      print("Teacher Local Db Id :- " + _teacher.lid.toString());
  }

  List<Teacher> getTeacherList_() {
    List<Teacher> teachersList = null;
    Future<List<Teacher>> teacherListFromFuture = teacherDAO.getAllTeacherData();
    teacherListFromFuture.then((teachers){
      teachersList =  teachers;
    });
    return teachersList;
  }

  getTeacherList() async{
    List<Teacher> teacherListFromFuture = await teacherDAO.getAllTeacherData();
    return teacherListFromFuture;
  }


}