import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/src/mo/Parent/Parent.dart';
import 'package:flutter_app/src/mo/Parent/ParentActivity.dart';
import 'package:flutter_app/src/mo/Person/Person.dart';
import 'package:flutter_app/src/mo/Standard/StandardService.dart';
import 'package:flutter_app/src/mo/Student/Student.dart';
import 'package:flutter_app/src/mo/Student/StudentActivity.dart';
import 'package:flutter_app/src/mo/teacher/Teacher.dart';
import 'package:flutter_app/src/mo/teacher/TeacherActivity.dart';

class ParticipantSelectModel extends ChangeNotifier{

  StandardService standardService = new StandardService();
   List<Teacher> _teacherList = [];
   List<Parent> _parentList = [];
   List<Student> _studentList = [];
   List<Person> _personList = [];
/*  UnmodifiableListView<Teacher> get allTeacher => UnmodifiableListView(_teacherList);
  UnmodifiableListView<Parent> get allParent => UnmodifiableListView(_parentList);
  UnmodifiableListView<Student> get allStudent => UnmodifiableListView(_studentList);*/
  UnmodifiableListView<Person> get allPerson => UnmodifiableListView(_personList);

  Future<List<Person>> getTeacher() async{
    TeacherActivity teacherActivity = new TeacherActivity();
    List<Teacher> _teachers = await teacherActivity.getJoinDbTeacher();
    _teacherList.addAll(_teachers);
    getPersonFromTeacher(_teacherList);
   // notifyListeners();
    return _personList;
  }

   getStudent() async{
    StudentActivity studentActivity = new StudentActivity();
    List<Student> _students = await studentActivity.getAllStudent();
    _studentList.addAll(_students);
    getPersonFromStudent(_studentList);
   // notifyListeners();
     return _personList;
  }

  getParent() async{
    ParentActivity parentActivity = new ParentActivity();
    List<Parent> _parents = await parentActivity.getAllParents();
    _parentList.addAll(_parents);
    getPersonFromParent(_parentList);
   // notifyListeners();
    return _personList;
  }


 List<Person> getPersonFromTeacher(List<Teacher> teachers){
   _personList.clear();
    for(Teacher teacher in teachers){
      Person person = new Person();
      person.id = teacher.person;
      person.firstName = teacher.lastName;
      person.lastName = teacher.lastName;
      person.email = teacher.email;
      _personList.add(person);
    }
    return _personList;
  }

  List<Person> getPersonFromStudent(List<Student> students){
    _personList.clear();
    for(Student student in students){
      Person person = new Person();
      person.id = student.personId;
      person.firstName = student.lastName;
      person.lastName = student.lastName;
      person.email = student.email;
      _personList.add(person);
    }
    return _personList;
  }

  List<Person> getPersonFromParent(List<Parent> Parents){
    _personList.clear();
    for(Parent parent in Parents){
      Person person = new Person();
      person.id = parent.personId;
      person.firstName = parent.lastName;
      person.lastName = parent.lastName;
      person.email = parent.email;
      _personList.add(person);
    }
    return _personList;
  }
}