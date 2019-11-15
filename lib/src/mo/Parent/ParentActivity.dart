
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


}

