import 'dart:convert';
import 'package:flutter_app/src/mo/Standard/Standard.dart';

class Subject{
  int lid = 1;     //local database id
  int id;           // server id
  String name;
  int standardId;
  Standard standard;
  int isAccess = 1;
  int color;
  int isOptional = 0;
  String optionalStudentIds;

  Subject( {
    this.id,
    this.name,
    this.standardId,
    this.standard,
    this.isAccess,
    this.color,
    this.isOptional,
    this.optionalStudentIds
  });


  factory Subject.fromJsonServer(Map<String, dynamic> jsonObject) => Subject(

      id : jsonObject["id"],
      name : jsonObject["name"],
      standardId: jsonObject["standard"]["id"],
      standard : Standard.fromJsonServer(jsonObject["standard"]),
      isAccess : jsonObject["isAccess"],
      color : jsonObject["color"],
      isOptional : jsonObject["isOptional"] == true ? 1 : 0,
      optionalStudentIds : jsonObject["optionalStudentIds"]
  );

  factory Subject.fromJsonLocal(Map<String, dynamic> jsonObject) => Subject(

      id : jsonObject["id"],
      name : jsonObject["name"],
      standardId: jsonObject["standardId"],
      isAccess : jsonObject["isAccess"],
      color : jsonObject["color"],
      isOptional : jsonObject["isOptional"],
      optionalStudentIds : jsonObject["optionalStudentIds"]

  );

  factory Subject.fromJsonLocal_(Map<String, dynamic> jsonObject) => Subject(

      id : jsonObject["id"],
      name : jsonObject["name"],
      standard : Standard(id: jsonObject["standard"]),
      isAccess : jsonObject["isAccess"],
      color : jsonObject["color"],
      isOptional : jsonObject["isOptional"],
      optionalStudentIds : jsonObject["optionalStudentIds"]
  );

  factory Subject.fromJsonLocalWithStandard(Map<String, dynamic> jsonObject) => Subject(

      id : jsonObject["subjectId"],
      name : jsonObject["subjectName"],
      standardId: jsonObject["subStandardId"],
      standard : Standard(
        id: jsonObject["standardId"],
        name: jsonObject["standardName"],
        isAccess: jsonObject["stdAccessible"]
      ),
      isAccess : jsonObject["isAccessibleSubject"],
      color : jsonObject["subjectColor"],
      isOptional : jsonObject["subOptional"],
      optionalStudentIds : jsonObject["subOptionalStudentIds"]
  );

  Map<String, dynamic> toJson() => {

    "id" : id,
    "name" : name,
    "standardId": standardId,
    "isAccess" : isAccess,
    "color" : color,
    "isOptional" : isOptional,
    "optionalStudentIds" : optionalStudentIds

  };


}