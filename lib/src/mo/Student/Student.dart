

import 'package:flutter_app/src/mo/Standard/Standard.dart';

class Student{

  int lid ;  // local database id
   int id;             // local database id which is same as server id
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
    this.id
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(

  );

  Map<String, dynamic> toJson() => {

  };

}