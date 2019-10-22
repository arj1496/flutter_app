
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
        Teacher teacher = Teacher.fromJsonServer(teachersDynamic[i]);
        return teacher;
      });
      await batchAddTeacher(teacherList);
    }else{
      print('Teacher Sync is false');
    }
    return teacherList;
  }

  syncCallBackHandle(Map<String, dynamic> syncDataResponse) async {
    List<dynamic> addTeachersDynamic = syncDataResponse['teachers'];
    if(addTeachersDynamic != null && addTeachersDynamic.length > 0){
      List<Teacher> addTeacherList = List.generate(addTeachersDynamic.length, (i){
        Teacher teacher = Teacher.fromJsonServer(addTeachersDynamic[i]);
        return teacher;
      });
      await batchAddTeacher(addTeacherList);
    }
    List<dynamic> deleteTeachersDynamic = syncDataResponse['deletedTeachers'];
    if(deleteTeachersDynamic != null && deleteTeachersDynamic.length > 0){
      List<int> teacherIds = new List();
      for(int i = 0; i < deleteTeachersDynamic.length; i++){
        teacherIds.add(deleteTeachersDynamic[i]['entityId']);
      }
      await batchDeleteTeacher(teacherIds);
    }
  }

  deleteTeacher(Teacher teacher){
    teacherDAO.deleteTeacher(teacher.id);
  }

  batchDeleteTeacher(List<int> teacherIds){
    teacherDAO.batchDeleteTeacher(teacherIds);
  }




}