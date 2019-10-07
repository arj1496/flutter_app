

import 'dart:async';

import 'package:sqflite/sqflite.dart';

import 'Teacher.dart';
import 'package:flutter_app/src/fr/db/DBProvider.dart' ;

class TeacherDAO{

  static final teacherTable = "Teacher";

  Future<Database> getDataBaseHandler()  async {
    final dbHelper = DBProvider.single_instance;
    final db = await dbHelper.database;
    return db;
  }

  Teacher addTeacher(Teacher teacher) {
    Database db = null;
    getDataBaseHandler().then((dataBaseInstance){
       db = dataBaseInstance;
       Future<int> futureId = db.insert(
         teacherTable,
         teacher.toJson(),
         conflictAlgorithm: ConflictAlgorithm.replace,
       );

       int teacherId;
       futureId.then<int>((id){
         teacherId = id;
         teacher.lid = teacherId;
       });

       return teacher;
    });
  }


  Future<List<Teacher>> getAllTeacherData_() async{

    getDataBaseHandler().then((dataBaseInstance){
      return getTeacherDataFromLocalDB(dataBaseInstance);
    }).then((maps){
      var test =  List.generate(maps.length, (i) {
        return Teacher.fromJson(maps[i]);
      });
      return test;
    });

    /*var res = await db.rawQuery("SELECT * FROM Teacher ");
    List<Teacher> list =
    res.isNotEmpty ? res.toList().map((c) => Teacher.fromJson(c)) : null;

    return Future((){
      return list;
    });*/

  }

  Future<List<Map<String, dynamic>>> getTeacherDataFromLocalDB(Database db) {
    Future<List<Map<String, dynamic>>> maps = db.rawQuery("SELECT * FROM Teacher ");
    return maps;
  }

  getAllTeacherData() async{

    print("getAllTeacherData Starts ");
    Database db = await getDataBaseHandler();

    //List<Map<String, dynamic>> maps = await db.query('Teacher');
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM Teacher ");

    var test =  List.generate(maps.length, (i) {
      return Teacher.fromJson(maps[i]);
    });
    print("Teacher List size : ${test.length}");
    return test;
  }






}