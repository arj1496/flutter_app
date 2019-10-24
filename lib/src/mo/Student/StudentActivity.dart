
import 'package:flutter_app/src/mo/Parent/Parent.dart';
import 'package:flutter_app/src/mo/Parent/ParentService.dart';
import 'package:flutter_app/src/mo/Student/StudentService.dart';

import 'Student.dart';

class StudentActivity{

  StudentService studentService = new StudentService();
  ParentService parentService = new ParentService();
  saveStudentDetail(student, callBack){
    Future.delayed(Duration(seconds: 15), () {
      callBack();
    });
  }

  Future<List<Student>> getStudentListFromLocalDB() async{
    List<Student> studentListFromFuture = await studentService.getStudentListFromLocalDB();
    return studentListFromFuture;
  }
}