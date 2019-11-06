
import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:flutter_app/src/mo/Parent/Parent.dart';
import 'package:flutter_app/src/mo/Student/Student.dart';

import 'StudentService.dart';

class StudentActivity{

  Future<List<Student>> getAllStudent() async{
    StudentService studentservice = new StudentService();
    List<Student> events =  await studentservice.getStudentListFromLocalDB();
    return events;
  }

  saveStudentDetail(GenericModel genericmodel, callBack){
    StudentService studentservice = new StudentService();
    studentservice.updateParentDetailOfStudent(genericmodel);
    Future.delayed(Duration(seconds: 15), () {
      callBack();
    });
  }

  addStudent(GenericModel genericModel, callBack){
    StudentService studentService = new StudentService();
    studentService.addStudent(genericModel).then((value){
      callBack();
    });

   /* Future.delayed(Duration(seconds: 5), () {
      callBack();
    });*/
  }

  removeParentDetail(GenericModel genericmodel, callBack){
    StudentService studentservice = new StudentService();
    studentservice.removeParentDetailOfStudent(genericmodel);
    Future.delayed(Duration(seconds: 15),(){
      callBack();
    });
  }

}