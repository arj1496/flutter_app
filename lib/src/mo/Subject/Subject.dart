

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


  factory Subject.fromJson(Map<String, dynamic> json) => Subject(

      id : json["id"],
      name : json["name"],
      standard : json["standard"],
      isAccess : json["isAccess"],
      color : json["color"],
      isOptional : json["isOptional"],
      optionalStudentIds : json["optionalStudentIds"]

  );

  Map<String, dynamic> toJson() => {

    "id" : id,
    "name" : name,
    "standard" : standard,
    "isAccess" : isAccess,
    "color" : color,
    "isOptional" : isOptional,
    "optionalStudentIds" : optionalStudentIds

  };


}