

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




  Subject({
    this.id
  });


  factory Subject.fromJson(Map<String, dynamic> json) => Subject(

  );

  Map<String, dynamic> toJson() => {

  };


}