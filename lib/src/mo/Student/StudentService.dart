

import 'dart:collection';

import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Student/Student.dart';
import 'package:flutter_app/src/mo/Student/StudentDao.dart';
import 'package:flutter_app/src/mo/Student/StudentWebService.dart';

class StudentService{

  StudentDao _studentDao = new StudentDao();

  // this method is used to save the List of Students
  batchAddStudents(List<Student> studentList){
    _studentDao.batchAddStudents(studentList);
  }

  Future<List<Student>> getStudentListDataFromServer() async {
    StudentWebService _studentWebService = new StudentWebService();

    HashMap map = new HashMap<String, String>();
    map['student_sync_time'] = 0.toString();

    Map<String, dynamic> studentDataFromServer = await _studentWebService.getData_(map, "rest/sync/getSyncInfo");
    List<Student> studentList;
    if(studentDataFromServer['isStudentSync']){
      print(studentDataFromServer);
      List<dynamic> studentsDynamic = studentDataFromServer['students'];
      studentList = List.generate(studentsDynamic.length, (i){
        Student student = Student.fromJson(studentsDynamic[i]);
        return student;
      });
      await batchAddStudents(studentList);
    }else{
      print('Student Sync is false');
    }
    return studentList;
  }

  Future<List<Student>> getStudentListFromLocalDB() async{
    List<Student> studentListFromFuture = await _studentDao.getAllStudentDataFromLocalDB();
    return studentListFromFuture;
  }

  List<Student> getStudentsForTest(){

    List<Student> students = new List();

    for(var i = 1 ; i < 10; i++){
      Student student = new Student();
      student.lid = i;
      student.id = i;
      student.firstName = 'Bhagyashri' + i.toString();
      student.lastName = 'Kadam ' + i.toString();
      student.studentId = '201820181234567890 ' + i.toString();
      student.schoolName = 'schoolName' + i.toString();
      student.gender = 'Male';
      Standard standard = new Standard();
      standard.id = 101;
      standard.name = 'Class 1';
      student.standard = standard;
      student.rollNo = i.toString();
      student.person = i;
      student.email = 'urvesh@urvesh.com';
      student.mobileNumber = '1234567890';
      student.parentIds = '';
      student.isWritable = 1;
      student.userId = i;
      student.cardId = 'card' + i.toString();
      student.iscardActive = 1;
      student.birthDate = i;
      students.add(student);
    }
    return students;
  }

}