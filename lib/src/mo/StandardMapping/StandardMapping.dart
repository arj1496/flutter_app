
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

  factory StandardMapping.fromJson(Map<String, dynamic> json) => StandardMapping(
    id: json['id'],
    student: json['student'],
    standard: json['standard'],
    schoolDsId: json['schoolDsId'],
    gradeId: json['gradeId'],
    studentStatus: json['studentStatus'],
    rollNo: json['rollNo'],
    isVisible: json['isVisible']
  );

}