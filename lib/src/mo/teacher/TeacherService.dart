
import 'package:flutter_app/src/mo/teacher/TeacherDAO.dart';

import 'Teacher.dart';

class TeacherServcie{

  TeacherDAO teacherDAO = new TeacherDAO();

  Teacher addTeacher(Teacher teacher){

    Future<Teacher> teacherF = teacherDAO.addTeacher(teacher);
    teacherF.then((_teacher){
      print("Teacher Local Db Id :- " + _teacher.lid.toString());
    });


  }

}