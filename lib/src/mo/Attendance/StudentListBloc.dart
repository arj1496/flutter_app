import 'package:flutter_app/src/mo/Student/Student.dart';
import 'package:flutter_app/src/mo/Student/StudentService.dart';
import 'package:rxdart/rxdart.dart';

class StudentListBloc
{
  Stream<List<Student>> get allStudent => _studentlist.stream;

  final _studentlist = BehaviorSubject<List<Student>>( );

  StudentService studentService=new StudentService();

  List<Student> student;



  getStudentList() {
    Future<List<Student>> studentListFromFuture = studentService.getStudentListFromLocalDB();
    //List<Holiday> holydasys;
    studentListFromFuture.then( (value) {
      student = value;
      _studentlist.add(student);
    } );
  }


  StudentListBloc() {

    getStudentList( );
  }


}