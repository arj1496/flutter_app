import 'package:flutter_app/src/mo/teacher/Teacher.dart';
import 'package:flutter_app/src/mo/teacher/TeacherService.dart';

class TeacherActivity{
  TeacherServcie teacherServcie = new TeacherServcie();

  List<Teacher> getAllTeacherList(){
    for(int i = 0; i < 10; i++){
      Teacher teacher = new Teacher();
      teacher.lid = i;
    teacher.id =  i;
    teacher.firstName = "firstName" + i.toString();
    teacher.lastName = "lastName" + i.toString();
    teacher.person = i;
    teacher.isWritable =  0;
    teacher.gender = "gender" + i.toString();
    teacher.email = "email" + i.toString();
    teacher.standardIds = "standardIds" + i.toString();
    teacher.subjectIds = "subjectIds" + i.toString();
    teacher.userId = i;
    teacher.role = "Teacher";
    }

  }
}