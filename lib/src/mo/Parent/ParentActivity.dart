
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:flutter_app/src/mo/Exam/ExamService.dart';
import 'package:flutter_app/src/mo/Parent/ParentService.dart';

import 'Parent.dart';



// This contains only comminaction logic between ui and service .
class ParentActivity{

 ParentService parentService = new ParentService();
  Future<List<Parent>> getAllParents() async{
    List<Parent> examListFromFuture = await parentService.getParentListFromLocalDB();
    return examListFromFuture;
  }

 List<Parent> getAllTeacherList(){
   List<Parent> teacherList = new List();
   for(int i = 10; i < 15; i++){
     Parent teacher = new Parent();
     teacher.id =  i;
     teacher.firstName = "FirstName" + i.toString();
     teacher.lastName = "LastName" + i.toString();
     teacher.isWritable =  0;
     teacher.gender = "gender" + i.toString();
     teacher.email = "email" + i.toString();
     teacher.mobileNumber ="987654321"+ i.toString();
     teacherList.add(teacher);
   }
   return teacherList;
 }
}

