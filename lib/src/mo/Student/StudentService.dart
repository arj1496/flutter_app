

import 'dart:collection';

import 'package:flutter_app/src/mo/Parent/Parent.dart';
import 'package:flutter_app/src/mo/Parent/ParentService.dart';
import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Student/Student.dart';
import 'package:flutter_app/src/mo/Student/StudentDao.dart';
import 'package:flutter_app/src/mo/Student/StudentWebService.dart';

class StudentService{

  StudentDao _studentDao = new StudentDao();
  ParentService parentService = new ParentService();

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
        Student student = Student.fromJson_server(studentsDynamic[i]);
        return student;
      });
      await batchAddStudents(studentList);
    }else{
      print('Student Sync is false');
    }
    return studentList;
  }

  // To get student data with parentList
  /**
   * get parentids from student and call parentservice to get parent data in the form of list.
   */
  Future<List<Student>> getStudentListFromLocalDB() async{
    List<Student> studentListFromFuture = await _studentDao.getAllStudentDataFromLocalDB();
    List<Student> newList = new List();
    for(Student student in studentListFromFuture){
      Student std = new Student();
      std = student;
      List<Parent> parentList = await parentService.getAllParentDataFromId(student.parentIds);
      std.parentList = parentList;
      newList.add(std);
    }
    return newList;
  }

  Future<List<Student>> getStudentListFromLocalDB_(int classId, int subjectId) async{
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
      student.personId = i;
      student.email = 'urvesh@urvesh.com';
      student.mobileNumber = '1234567890';
      student.parentIds = '';
      student.isWritable = 1;
      student.userId = i;
      student.cardId = 'card' + i.toString();
      student.isCardActive = 1;
      student.birthDate = i;

      students.add(student);
    }
    return students;
  }

  syncCallBackHandle(Map<String, dynamic> syncDataResponse) async {
    List<dynamic> studentsDynamic = syncDataResponse['students'];
    if(studentsDynamic != null && studentsDynamic.length > 0){
      List<Student> studentList = List.generate(studentsDynamic.length, (i){
        Student student = Student.fromJson_server(studentsDynamic[i]);
        return student;
      });
      await batchAddStudents(studentList);
    }

  }

}