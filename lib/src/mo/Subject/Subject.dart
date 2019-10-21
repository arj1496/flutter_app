import 'dart:convert';
import 'package:flutter_app/src/mo/Standard/Standard.dart';

class Subject{
  int lid = 1;     //local database id
  int id;           // server id
  String name;
  Standard standard;
  int isAccess = 1;
  int color;
  int isOptional = 0;
  String optionalStudentIds;

  Subject( {
    this.id,
    this.name,
    this.standard,
    this.isAccess,
    this.color,
    this.isOptional,
    this.optionalStudentIds
  });


  factory Subject.fromJsonServer(Map<String, dynamic> jsonObject) => Subject(

      id : jsonObject["id"],
      name : jsonObject["name"],
      standard : Standard.fromJsonLocal(jsonObject["standard"]),
      isAccess : jsonObject["isAccess"],
      color : jsonObject["color"],
      isOptional : jsonObject["isOptional"] == true ? 1 : 0,
      optionalStudentIds : jsonObject["optionalStudentIds"]
  );

  factory Subject.fromJsonLocal(Map<String, dynamic> jsonObject) => Subject(

      id : jsonObject["id"],
      name : jsonObject["name"],
      standard : Standard(id: jsonObject["standard"]),
      isAccess : jsonObject["isAccess"],
      color : jsonObject["color"],
      isOptional : jsonObject["isOptional"] == true ? 1 : 0,
      optionalStudentIds : jsonObject["optionalStudentIds"]

  );

  Map<String, dynamic> toJson() => {

    "id" : id,
    "name" : name,
    "standard" : standard.id,
    "isAccess" : isAccess,
    "color" : color,
    "isOptional" : isOptional,
    "optionalStudentIds" : optionalStudentIds

  };


}