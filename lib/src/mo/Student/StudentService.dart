

import 'package:flutter_app/src/mo/Student/Student.dart';
import 'package:flutter_app/src/mo/Student/StudentDao.dart';

class StudentService{

  StudentDao _studentDao = new StudentDao();

  // this method is used to save the List of Teachers
  batchAddTeacher(List<Student> studentList){
    _studentDao.batchAddStudents(studentList);
  }

}