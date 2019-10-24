
import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';

import 'StudentService.dart';

class StudentActivity{

  saveStudentDetail(GenericModel genericmodel, callBack){
    StudentService studentservice = new StudentService();
    studentservice.updateParentDetailOfStudent(genericmodel);
    Future.delayed(Duration(seconds: 15), () {
      callBack();
    });
  }

  addStudent(GenericModel genericModel, callBack){
    StudentService studentService = new StudentService();
    studentService.addStudent( genericModel);
  }


}