import 'package:flutter_app/src/mo/Parent/Parent.dart';
import 'package:flutter_app/src/mo/Parent/ParentService.dart';
import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/StandardMapping/StandardMapping.dart';

class Student {
  int lid; // local database id
  int id; // server id
  String firstName;
  String lastName;
  String studentId;
  String schoolName;
  String gender;
  Standard standard;
  String rollNo;
  int personId;
  String email;
  String mobileNumber;
  String parentIds;
  int isWritable = 0;
  int userId;
  String cardId;
  int isCardActive = 0; // 0 = inactive, 1 = active
  int birthDate;

  List<StandardMapping> standardMappings;
  List<Parent> parentList;

  Student(
      {this.lid,
      this.id,
      this.firstName,
      this.lastName,
      this.studentId,
      this.schoolName,
      this.gender,
      this.standard,
      this.rollNo,
      this.personId,
      this.email,
      this.mobileNumber,
      this.parentIds,
      this.isWritable,
      this.userId,
      this.cardId,
      this.isCardActive,
      this.birthDate,
      this.standardMappings,
      this.parentList});

  factory Student.fromJson_server(Map<String, dynamic> jsonObject) => Student(
        lid: jsonObject['lid'],
        id: jsonObject['id'],  // Data from Json
        firstName: jsonObject['firstName'],
        lastName: jsonObject['lastName'],
        studentId: jsonObject['studentId'],
        schoolName: jsonObject['schoolName'],
        gender: jsonObject['gender'],
        standard: jsonObject['standard'],
        rollNo: jsonObject['rollNo'],
        personId: jsonObject['personId'],
        email: jsonObject['email'],
        mobileNumber: jsonObject['mobileNumber'],
        parentIds: jsonObject['parentIds'],
        isWritable: jsonObject['isWritable'] == true ? 1 : 0,
        userId: jsonObject['userId'],
        cardId: jsonObject['cardId'],
        isCardActive: jsonObject['isCardActive'],
        birthDate: jsonObject['birthDate'],
      );

  factory Student.fromJson_local(Map<String, dynamic> jsonObject) => Student(
    lid: jsonObject['lid'],
    id: jsonObject['studId'],  // Data from Json
    firstName: jsonObject['studFirstName'],
    lastName: jsonObject['studLastName'],
    studentId: jsonObject['studentId'],
    schoolName: jsonObject['schoolName'],
    gender: jsonObject['gender'],
    standard: jsonObject['standard'],
    rollNo: jsonObject['rollNo'],
    personId: jsonObject['personId'],
    email: jsonObject['email'],
    mobileNumber: jsonObject['mobileNumber'],
    parentIds: jsonObject['parentIds'],
    isWritable: jsonObject['isWritable'] == true ? 1 : 0,
    userId: jsonObject['userId'],
    cardId: jsonObject['cardId'],
    isCardActive: jsonObject['isCardActive'],
    birthDate: jsonObject['birthDate'],
    standardMappings: StandardMapping.getStandardMappingsList(jsonObject['standardMappings']),
    parentList: jsonObject['parentList'],
  );


  Map<String, dynamic> toJson() => {
        'lid': lid,
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'studentId': studentId,
        'schoolName': schoolName,
        'gender': gender,
        //'standard' : standard,
        'rollNo': rollNo,
        'personId': personId,
        'email': email,
        'mobileNumber': mobileNumber,
        'parentIds': parentIds,
        'isWritable': isWritable,
        //'userId' : userId,
        'cardId': cardId,
        'isCardActive': isCardActive,
        'birthDate': birthDate
      };


}
