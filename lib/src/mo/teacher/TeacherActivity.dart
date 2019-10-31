import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:flutter_app/src/mo/teacher/Teacher.dart';
import 'package:flutter_app/src/mo/teacher/TeacherService.dart';

class TeacherActivity{

  TeacherServcie teacherService = new TeacherServcie();

  List<Teacher> getAllTeacherList(){
    List<Teacher> teacherList = new List();
    for(int i = 0; i < 10; i++){
      Teacher teacher = new Teacher();
      teacher.lid = i;
      teacher.id =  i;
      teacher.birthDate= "";
      teacher.firstName = "FirstName" + i.toString();
      teacher.lastName = "LastName" + i.toString();
      teacher.person = i;
      teacher.isWritable =  0;
      teacher.gender = "gender" + i.toString();
      teacher.email = "email" + i.toString();
      teacher.mobileNumber ="987654321"+ i.toString();
      teacher.standardIds = "standardIds" + i.toString();
      teacher.subjectIds = "subjectIds" + i.toString();
      teacher.userId = i;
      teacher.role = "Teacher";
      teacherList.add(teacher);
    }
    return teacherList;
  }
  void addorupdate(GenericModel genericModel, callback) {
    Teacher teacher = new Teacher();
    teacher.firstName=genericModel.firstName;
    teacher.lastName=genericModel.lastName;
    teacher.birthDate=genericModel.birthDate;
    teacher.email=genericModel.email;
    teacher.mobileNumber=genericModel.mobileNumber;
    teacher.gender=genericModel.gender;
    teacher.academicType=genericModel.academicType;
    teacher.invitation=genericModel.invitation;

    teacherService.addOrUpdateTeacher(genericModel).then((val){
      print("teacher added successfully");
      Future.delayed(Duration(seconds:5), () {
        callback();
      });

    });
  }
  Future<List<Teacher>> getJoinDbTeacher() async {
    List<Teacher> teacherListFromFuture = await teacherService.getJoinDbTeacher();
    return teacherListFromFuture;

  }
}