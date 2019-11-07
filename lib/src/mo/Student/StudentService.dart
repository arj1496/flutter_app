import 'dart:collection';

import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:flutter_app/src/mo/Parent/Parent.dart';
import 'package:flutter_app/src/mo/Parent/ParentService.dart';
import 'package:flutter_app/src/mo/Student/StandardMapping.dart';
import 'package:flutter_app/src/mo/Student/Student.dart';
import 'package:flutter_app/src/mo/Student/StudentDao.dart';
import 'package:flutter_app/src/mo/Student/StudentWebService.dart';

class StudentService {
  StudentDao _studentDao = new StudentDao();
  ParentService parentService = new ParentService();
  StudentWebService studentWebService = new StudentWebService();

  Future addStudent(GenericModel genericModel) async {
    Map<String, dynamic> responseData = await studentWebService.addStudent(genericModel);

    if (responseData['status']) {
      Student student = Student.fromJson_server(responseData['student']);
      print(student);
      List<Student> studentList = [];
      studentList.add(student);
      batchAddStudents(studentList);

      List<dynamic> parentsDynamic = responseData['parents'];
      if (parentsDynamic != null && parentsDynamic.length > 0) {
        List<Parent> parentList = List.generate(parentsDynamic.length, (i) {
          Parent parent = Parent.fromJsonServer(parentsDynamic[i]);
          return parent;
        });
        await parentService.batchAddParents(parentList);
      }
    } else {
      print("False");
    }
  }

  // this method is used to save the List of Students
  batchAddStudents(List<Student> studentList) {
    _studentDao.batchAddStudents(studentList);
  }

  batchAddStudentStandardMapping(List<StandardMapping> standardMappingList) {
    _studentDao.batchAddStudentStandardMapping(standardMappingList);
  }

  Future<List<Student>> getStudentListDataFromServer() async {

    HashMap map = new HashMap<String, String>();
    map['student_sync_time'] = 0.toString();

    Map<String, dynamic> studentDataFromServer = await studentWebService.getData_(map, "rest/sync/getSyncInfo");
    List<Student> studentList;
    if (studentDataFromServer['isStudentSync']) {
      print(studentDataFromServer);
      List<dynamic> studentsDynamic = studentDataFromServer['students'];
      studentList = List.generate(studentsDynamic.length, (i) {
        Student student = Student.fromJson_server(studentsDynamic[i]);
        return student;
      });
      await batchAddStudents(studentList);
    } else {
      print('Student Sync is false');
    }
    return studentList;
  }

  // To get student data with parentList
  /**
   * get parentids from student and call parentservice to get parent data in the form of list.
   */
  Future<List<Student>> getStudentListFromLocalDB() async {
    List<Student> studentListFromFuture = await _studentDao.getAllStudentDataFromLocalDB();
    List<Student> studentList = new List();
    for (Student student in studentListFromFuture) {
      Student std = new Student();
      std = student;
      List<Parent> parentList = await parentService.getAllParentDataFromId(student.parentIds);
      std.parentList = parentList;

      List<StandardMapping> standardMappings = await getStudentStandardMapping(student.id);
      std.standardMappings = standardMappings;
      studentList.add(std);
    }
    return studentList;
  }

  getStudentStandardMapping(int studentId) async{
    return await _studentDao.getStudentStandardMapping(studentId);
  }

  syncCallBackHandle(Map<String, dynamic> syncDataResponse) async {
    List<dynamic> studentsDynamic = syncDataResponse['students'];
    if (studentsDynamic != null && studentsDynamic.length > 0) {
      List<StandardMapping> standardMappingList = new List();
      List<Student> studentList = List.generate(studentsDynamic.length, (i) {
        Student student = Student.fromJson_server(studentsDynamic[i]);
        List<StandardMapping> standardMappings = getStandardMappingListFromStudentDynmaicList(studentsDynamic[i]);
        standardMappingList.addAll(standardMappings);
        return student;
      });
      await batchAddStudents(studentList);
      await batchAddStudentStandardMapping(standardMappingList);

    }
  }

  List<StandardMapping> getStandardMappingListFromStudentDynmaicList(Map<String, dynamic> studentsDynamic){
    List<StandardMapping> standardMappingList;
    List<dynamic> standardMappingDynamics = studentsDynamic['standardMappings'];
    if(standardMappingDynamics != null && standardMappingDynamics.length > 0){
      standardMappingList = new List();
      for(int i = 0; i < standardMappingDynamics.length; i++){
        standardMappingList = List.generate(standardMappingDynamics.length, (i) {
          StandardMapping standardMapping = StandardMapping.fromJsonServer(standardMappingDynamics[i]);
          return standardMapping;
        });
      }
    }
    return standardMappingList;
  }

  updateParentDetailOfStudent(GenericModel genericmodel) async {
    Map<String, dynamic> responseData = await studentWebService.updateParentDetailOfStudent(genericmodel);
    if (responseData['status']) {
      Student student = Student.fromJson_server(responseData['student']);
      print(student);
    }
  }

  removeParentDetailOfStudent(GenericModel genericmodel) async {


  }




}
