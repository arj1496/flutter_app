

import 'package:sqflite/sqflite.dart';

import 'Teacher.dart';
import 'package:flutter_app/src/fr/db/DBProvider.dart' ;

class TeacherDAO{

  static final teacherTable = "teacher";

  Future<Teacher> addTeacher(Teacher teacher) async {

    final dbHelper = DBProvider.single_instance;
    final db = await dbHelper.database;

    Future<int> id = db.insert(teacherTable, teacher.toJson());

    int _id = id.then((_teacherId){
      print("Teacher Local Db Id :- " + _teacherId.toString());
      return _teacherId;
    }) as int;

    teacher.lid = _id;
    Future<List<Teacher>> getAllTeachers() async{

      final dbHelper = await DBProvider.single_instance;
      final db = await dbHelper.database;

      var res = await db.rawQuery("SELECT * FROM teacher ");
      List<Teacher> list =
      res.isNotEmpty ? res.toList().map((c) => Teacher.fromJson(c)) : null;
      return list;

    }

  }


}