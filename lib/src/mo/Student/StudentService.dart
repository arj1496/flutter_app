

import 'dart:collection';

import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:flutter_app/src/mo/Parent/Parent.dart';
import 'package:flutter_app/src/mo/Parent/ParentService.dart';
import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Student/Student.dart';
import 'package:flutter_app/src/mo/Student/StudentDao.dart';
import 'package:flutter_app/src/mo/Student/StudentWebService.dart';

class StudentService{

  StudentDao _studentDao = new StudentDao();
  ParentService parentService = new ParentService();

 Future addStudent(GenericModel genericModel) async{
    StudentWebService _studentWebService = new StudentWebService();
    Map<String, dynamic> responseData = await _studentWebService.addStudent(genericModel);

    if(responseData['status']){
      Student student = Student.fromJson_server(responseData['student']);
      print(student);
      List<Student> studentList = [];
      studentList.add(student);
      batchAddStudents(studentList);

      List<dynamic> parentsDynamic = responseData['parents'];
      if(parentsDynamic != null && parentsDynamic.length > 0){
        List<Parent> parentList = List.generate(parentsDynamic.length, (i){
          Parent parent = Parent.fromJsonServer(parentsDynamic[i]);
          return parent;
        });
        await parentService.batchAddParents(parentList);
      }
    }
    else{
      print("False");
    }
  }

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


      Parent father = new Parent();
      father.firstName = "Dilip";
      father.lastName = "Kadam";
      father.email = "d@gmail.com";
      father.gender = "MALE";
      father.mobileNumber = "9405186233";
      father.relation = "FATHER";

      Parent mother = new Parent();
      mother.firstName = "Kalpana";
      mother.lastName = "Kadam";
      mother.email = "kk@gmail.com";
      mother.gender = "FEMALE";
      mother.mobileNumber = "9422481016";
      mother.relation = "MOTHER";

      List<Parent> parentList = new List();
      parentList.add(father);
      parentList.add(mother);
      student.parentList = parentList;

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

  updateParentDetailOfStudent(GenericModel genericmodel) async {
    StudentWebService studentwebservice = new StudentWebService();
    Map<String, dynamic> responseData = await studentwebservice
        .updateParentDetailOfStudent(genericmodel);
    if (responseData['status']) {
      Student student = Student.fromJson_server(responseData['student']);
      print(student);
    }
  }

}