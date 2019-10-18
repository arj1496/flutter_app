
import 'dart:convert';

import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Student/Student.dart';

class StandardMapping{

  int lid;
  int id;
  Student student;
  Standard standard;
  int schoolDsId;
  int gradeId;
  int studentStatus;
  String rollNo;
  int isVisible;

  StandardMapping({
    this.lid,
    this.id,
    this.student,
    this.standard,
    this.schoolDsId,
    this.gradeId,
    this.studentStatus,
    this.rollNo,
    this.isVisible
  });

  factory StandardMapping.fromJson(Map<String, dynamic> jsonObject) => StandardMapping(
    id: jsonObject['id'],
    student: jsonObject['student'] != null ? Student.fromJson(jsonObject['student']) : null,
    standard: Standard.fromJson(jsonObject['standard']),
    schoolDsId: jsonObject['schoolDs'],
    gradeId: jsonObject['gradeId'],
    studentStatus: jsonObject['studentStatus'],
    rollNo: jsonObject['rollNo'],
    isVisible: jsonObject['isVisible']
  );

  static getStandardMappingsList(jsonString) {
    if(jsonString != null){
      List<dynamic> test =  jsonDecode(jsonString);//json.decode(jsonString);
      List<StandardMapping> smList = List.generate(test.length, (i){
        StandardMapping standardMapping =  StandardMapping.fromJson(test[i]);
        return standardMapping;
      });
      print(smList);
      return smList;
    }
    return null;
  }



}