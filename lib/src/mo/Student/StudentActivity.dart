
import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:flutter_app/src/mo/Parent/Parent.dart';
import 'package:flutter_app/src/mo/Student/Student.dart';

import 'StudentService.dart';

class StudentActivity{

  StudentService studentService = new StudentService();

  List<Student> getAllTeacherList(){
    List<Student> teacherList = new List();
    for(int i = 6; i < 10; i++){
      Student teacher = new Student();
      teacher.lid = i;
      teacher.id =  i;
      teacher.firstName = "FirstName" + i.toString();
      teacher.lastName = "LastName" + i.toString();
      teacher.isWritable =  0;
      teacher.gender = "gender" + i.toString();
      teacher.email = "email" + i.toString();
      teacher.mobileNumber ="987654321"+ i.toString();
      teacher.userId = i;
      teacherList.add(teacher);
    }
    return teacherList;
  }

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