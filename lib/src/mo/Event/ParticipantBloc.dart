import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app/src/mo/Parent/Parent.dart';
import 'package:flutter_app/src/mo/Parent/ParentActivity.dart';
import 'package:flutter_app/src/mo/Person/Person.dart';
import 'package:flutter_app/src/mo/Student/Student.dart';
import 'package:flutter_app/src/mo/Student/StudentActivity.dart';
import 'package:flutter_app/src/mo/teacher/Teacher.dart';
import 'package:flutter_app/src/mo/teacher/TeacherActivity.dart';
import 'package:rxdart/rxdart.dart';


class ParticipantBloc implements Bloc {

  final _controller = StreamController<List<Person>>();
  int flag;
  Stream<List<Person>> get stream => _controller.stream;
  final _personList = BehaviorSubject<List<Person>>();
  final _personListControler = StreamController<List<Person>>();
  List<Person> _schools = new List();
  Stream<List<Person>> get allPersons => _personList.stream;
  Stream<List<Person>> get allPersonByStreamContoer => _personListControler.stream;

  ParticipantBloc(flag){
    this.flag = flag;
    getInitialList();
  }

  getInitialList()async{

   // final results = await teacherActivity.getAllTeacherList ( );
    final results = await teacherActivity.getJoinDbTeacher();
    List<Person> personTeacher = getPersonFromTeacher ( results );

  }
  TeacherActivity teacherActivity = new TeacherActivity();
  StudentActivity studentActivity = new StudentActivity();
  ParentActivity parentActivity = new ParentActivity();


  void submitQuery(flag) async {
    if(flag==1) {
     // final results = await teacherActivity.getAllTeacherList ( );
      final results = await teacherActivity.getJoinDbTeacher();
      List<Person> personTeacher = getPersonFromTeacher ( results );
      _controller.sink.add ( personTeacher );
    }else  if(flag==2) {
      final results = await parentActivity.getAllParents();
      List<Person> personTeacher = getPersonFromParent( results );
      _controller.sink.add ( personTeacher );

    }else{
      final results = await studentActivity.getAllStudent();
      List<Person> personTeacher = getPersonFromStudent ( results );
      _controller.sink.add ( personTeacher );

    }
  }

  void searchParticipant(String text) {


    List<Person> searchResult = List<Person>();

    if(text == null || text == '' ){
      _personList.add(_schools);
    }

    for(int i = 0; i < _schools.length; i++){

      if(_schools[i].firstName.startsWith(text)){
        searchResult.add(_schools[i]);
      }

    }

    _personList.add(searchResult);
    _personListControler.add(searchResult);
  }

  @override
  void dispose() {
  _controller.close();
  }

  List<Person> getPersonFromTeacher(List<Teacher> teachers){
    List<Person> perList =  new List();
    for(Teacher teacher in teachers){
      Person person = new Person();
      person.id = teacher.person;
      person.firstName = teacher.lastName;
      person.lastName = teacher.lastName;
      person.email = teacher.email;
      person.role = teacher.role;
      perList.add(person);
    }
    _schools.addAll(perList);
      _personList.add(perList);
  }

  List<Person> getPersonFromStudent(List<Student> students){
    List<Person> perList =  new List();
    for(Student student in students){
      Person person = new Person();
      person.id = student.id;
      person.firstName = student.lastName;
      person.lastName = student.lastName;
      person.email = student.email;
      person.role = "Student";
      perList.add(person);
    }
    _schools.addAll(perList);
     _personList.add(perList);
  }

  List<Person> getPersonFromParent(List<Parent> Parents){
    List<Person> perList =  new List();
    for(Parent parent in Parents){
      Person person = new Person();
      person.id = parent.id;
      person.firstName = parent.lastName;
      person.lastName = parent.lastName;
      person.email = parent.email;
      person.role = "Parent";
      perList.add(person);
    }
    _schools.addAll(perList);
    _personList.add(perList);
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}