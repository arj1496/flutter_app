import 'package:flutter_app/src/mo/teacher/Teacher.dart';
import 'package:flutter_app/src/mo/teacher/TeacherService.dart';

class TeacherActivity{
  TeacherServcie teacherServcie = new TeacherServcie();

  List<Teacher> getAllTeacherList(){
    List<Teacher> teacherList = new List();
    for(int i = 0; i < 10; i++){
      Teacher teacher = new Teacher();
      teacher.lid = i;
      teacher.id =  i;
      teacher.firstName = "FirstName" + i.toString();
      teacher.lastName = "LastName" + i.toString();
      teacher.person = i;
      teacher.isWritable =  0;
      teacher.gender = "gender" + i.toString();
      teacher.email = "email" + i.toString();
      teacher.mobile = "9834234545" + i.toString();
      teacher.standardIds = "standardIds" + i.toString();
      teacher.subjectIds = "subjectIds" + i.toString();
      teacher.userId = i;
      teacher.role = "Teacher";
      teacherList.add(teacher);
    }
    return teacherList;
  }


}