import 'package:flutter_app/src/mo/Parent/Parent.dart';
import 'package:flutter_app/src/mo/Parent/ParentService.dart';
import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Student/StandardMapping.dart';

class Student {
  int lid; // local database id
  int id; // server id
  String firstName;
  String lastName;
  String studentId;
  String schoolName;
  String gender;
  int standardId;
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

  Standard standard;
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
      this.standardId,
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
      this.standard,
      this.standardMappings,
      this.parentList});

  // ignore: non_constant_identifier_names
  factory Student.fromJsonServer(Map<String, dynamic> jsonObject) => Student(
        lid: jsonObject['lid'],
        id: jsonObject['id'],  // Data from Json
        firstName: jsonObject['firstName'],
        lastName: jsonObject['lastName'],
        studentId: jsonObject['studentId'],
        schoolName: jsonObject['schoolName'],
        gender: jsonObject['gender'],
        standardId: jsonObject['standard_id'],
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

  factory Student.fromJsonLocal(Map<String, dynamic> jsonObject) => Student(
    lid: jsonObject['lid'],
    id: jsonObject['studServerId'],  // Data from Json
    firstName: jsonObject['studFirstName'],
    lastName: jsonObject['studLastName'],
    studentId: jsonObject['studentId'],
    schoolName: jsonObject['schoolName'],
    gender: jsonObject['studGender'],
    standardId: jsonObject['studStandardId'],
    rollNo: jsonObject['studRollNo'],
    personId: jsonObject['studPersonId'],
    email: jsonObject['studEmailId'],
    mobileNumber: jsonObject['studMobileNo'],
    parentIds: jsonObject['studParentIds'],
    isWritable: jsonObject['studIsWritable'],
    userId: jsonObject['userId'],
    cardId: jsonObject['studCardId'],
    isCardActive: jsonObject['studIsCardActive'] != null ? int.parse(jsonObject['studIsCardActive']) : null,
    birthDate: jsonObject['studBirthDate'],
    parentList: jsonObject['parentList'],
    standard: jsonObject["studStandardId"] != null ? Standard(id: jsonObject["studStandardId"], name: jsonObject["studStandardName"]) : null
  );


  Map<String, dynamic> toJson() => {
        'lid': lid,
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'studentId': studentId,
        'schoolName': schoolName,
        'gender': gender,
        'rollNo': rollNo,
        'personId': personId,
        'email': email,
        'mobileNumber': mobileNumber,
        'parentIds': parentIds,
        'isWritable': isWritable,
        'cardId': cardId,
        'isCardActive': isCardActive,
        'birthDate': birthDate,
        'standardId': standardId
      };


}
