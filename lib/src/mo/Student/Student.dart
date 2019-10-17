

import 'dart:convert';

import 'package:flutter_app/src/mo/Parent/Parent.dart';
import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/StandardMapping/StandardMapping.dart';

class Student{

  int lid ;  // local database id
  int id;   // server id
  String firstName;
  String lastName;
  String studentId;
  String schoolName;
  String gender;
  Standard standard;
  String rollNo;
  int person;
  String email;
  String mobileNumber;
  String parentIds;
  int isWritable = 0;
  int userId;
  String cardId;
  int iscardActive = 0; // 0 = inactive, 1 = active
  int birthDate;

  List<StandardMapping> standardMappings;
  List<Parent> parentList;

  Student({
    this.lid,
    this.id,
    this.firstName,
    this.lastName,
    this.studentId,
    this.schoolName,
    this.gender,
    this.standard,
    this.rollNo,
    this.person,
    this.email,
    this.mobileNumber,
    this.parentIds,
    this.isWritable,
    this.userId,
    this.cardId,
    this.iscardActive,
    this.birthDate,
    this.standardMappings,
    this.parentList
  });

  factory Student.fromJson(Map<String, dynamic> jsonObject) => Student(
    lid : jsonObject['lid'],
    id : jsonObject['id'],
    firstName : jsonObject['firstName'],
    lastName : jsonObject['lastName'],
    studentId : jsonObject['studentId'],
    schoolName : jsonObject['schoolName'],
    gender : jsonObject['gender'],
    standard : jsonObject['standard'],
    rollNo : jsonObject['rollNo'],
    person : jsonObject['person'],
    email : jsonObject['email'],
    mobileNumber : jsonObject['mobileNumber'],
    parentIds : jsonObject['parentIds'],
    isWritable : jsonObject['isWritable'] == true ? 1 : 0,
    userId : jsonObject['userId'],
    cardId : jsonObject['cardId'],
    iscardActive : jsonObject['iscardActive'],
    birthDate : jsonObject['birthDate'],
    standardMappings : StandardMapping.getStandardMappingsList(jsonObject['standardMappings']),
    parentList: Parent.getParentList(jsonObject['parents']),
  );

  Map<String, dynamic> toJson() => {
    'lid' : lid,
    'id' : id,
    'firstName' : firstName,
    'lastName' : lastName,
    'studentId' : studentId,
    'schoolName' : schoolName,
    'gender' : gender,
    //'standard' : standard,
    'rollNo' : rollNo,
    'person' : person,
    'email' : email,
    'mobileNumber' : mobileNumber,
    'parentIds' : parentIds,
    'isWritable' : isWritable,
    //'userId' : userId,
    'cardId' : cardId,
    'iscardActive' : iscardActive,
    'birthDate' : birthDate
  };


}