
import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:flutter_app/src/mo/Parent/Parent.dart';
import 'package:flutter_app/src/mo/Student/Student.dart';

import 'StudentService.dart';

class StudentActivity{

  StudentService studentService = new StudentService();

  Future<List<Student>> getAllStudent() async{
    List<Student> studentList =  await studentService.getStudentListFromLocalDB();
    return studentList;
  }

  saveStudentDetail(GenericModel genericmodel, callBack){
    studentService.updateParentDetailOfStudent(genericmodel);
    Future.delayed(Duration(seconds: 15), () {
      callBack();
    });
  }

  addStudent(GenericModel genericModel, callBack){
    studentService.addStudent(genericModel).then((value){
      callBack();
    });

   /* Future.delayed(Duration(seconds: 5), () {
      callBack();
    });*/
  }

  removeParentDetail(GenericModel genericmodel, callBack){
    studentService.removeParentDetailOfStudent(genericmodel);
    Future.delayed(Duration(seconds: 15),(){
      callBack();
    });
  }

  Future<List<Student>> getAllStudentsByClassIdFromLocalDB(int classId) async{
    List<Student> studentList =  await studentService.getAllStudentsByClassIdFromLocalDB(classId);
    return studentList;
  }

}