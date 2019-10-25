 import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Student/Student.dart';
import 'package:flutter_app/src/mo/Subject/Subject.dart';

class User {
   String school = null;
   String userEmail = null;
   String firstName = null;
   String lastName = null;
   int person = 0;
   String role = null;
   String authToken = null;

   List<Standard> standards;
   List<Subject> subjects;
   List<Student> students;
   Map<int, List<Subject>> standardSubjectMap;

  String schoolStartTime = "7:00 AM";
  String schoolEndTime = "5:00 PM";

}