

import 'package:flutter_app/src/mo/Standard/Standard.dart';

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
    this.birthDate
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
      lid : json['lid'],
      id : json['id'],
      firstName : json['firstName'],
      lastName : json['lastName'],
      studentId : json['studentId'],
      schoolName : json['schoolName'],
      gender : json['gender'],
      standard : json['standard'],
      rollNo : json['rollNo'],
      person : json['person'],
      email : json['email'],
      mobileNumber : json['mobileNumber'],
      parentIds : json['parentIds'],
      isWritable : json['isWritable'] == true ? 1 : 0,
      userId : json['userId'],
      cardId : json['cardId'],
      iscardActive : json['iscardActive'],
      birthDate : json['birthDate']
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
    'userId' : userId,
    'cardId' : cardId,
    'iscardActive' : iscardActive,
    'birthDate' : birthDate
  };

}