

import 'dart:async';
import 'dart:convert';

import 'package:flutter_app/src/fr/db/DBProvider.dart' ;
import 'package:flutter_app/src/mo/teacher/StandardTeacher.dart';
import 'package:sqflite/sqflite.dart';

import 'Teacher.dart';

class TeacherDAO{

  static final teacherTable = "Teacher";
  static final standardTeacherTable = "StandardTeacherTable";

  Future<Database> getDataBaseHandler()  async {
    final dbHelper = DBProvider.single_instance;
    final db = await dbHelper.database;
    return db;
  }

  Teacher addTeacher(Teacher teacher) {
    print("add teacher");
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

  // this method is used to save the List of Teachers
  batchAddTeacher(List<Teacher> teacherList){
    Database db = null;
    getDataBaseHandler().then((dataBaseInstance) async{
      db = dataBaseInstance;
      Batch batch = db.batch();
      for(var i = 0; i < teacherList.length; i++){
        Teacher teacher = teacherList[i];
        batch.insert(
          teacherTable,
          teacher.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace
        );
      }
      await batch.commit(noResult: true);
      print("Teacher Saved Successfully in to Local DB : " + teacherList.length.toString());
    });
  }

  Future<List<Map<String, dynamic>>> getTeacherDataFromLocalDB(Database db) {
    Future<List<Map<String, dynamic>>> maps = db.rawQuery("SELECT * FROM Teacher ");
    return maps;
  }

  getJoinDbTeacher() async{
    print("getAllTeacherData Starts ");
    Database db = await getDataBaseHandler();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM Teacher ");
    var test =  List.generate(maps.length, (i) {
      return Teacher.fromJsonLocal(maps[i]);
    });
    print("Teacher List size : ${test.length}");
    return test;
  }

  void deleteTeacher(int teacherId) async{
    Database db = await getDataBaseHandler();
    db.delete(teacherTable, where: 'id = ?', whereArgs: [teacherId]);
  }

  void batchDeleteTeacher(List<int> teacherIds) async{
    Database db = await getDataBaseHandler();
    Batch batch = db.batch();
    for(var i = 0; i < teacherIds.length; i++){
      batch.delete(teacherTable, where: 'id = ?', whereArgs: [teacherIds[i]]);
    }
    await batch.commit(noResult: true);
    print("Teacher Deleted Successfully in to Local DB : " + teacherIds.toString());
  }

  deleteAllStandardTeacherMapping() async{
    Database db = await getDataBaseHandler();
    /*List<Map<String, dynamic>> maps = await getAllStandardTeacherMappingsFromLocalDB();
    print(maps);*/
    await db.delete(standardTeacherTable);
    /*List<Map<String, dynamic>> afterDelete = await getAllStandardTeacherMappingsFromLocalDB();
    print(afterDelete);*/
  }

  getAllStandardTeacherMappingsFromLocalDB() async{
    Database db = await getDataBaseHandler();
    List<Map<String, dynamic>> maps = await db.rawQuery("Select * from standardTeacherTable");
    print(maps);
    return maps;
  }

  batchAddStandardTeacher(List<StandardTeacher> standardTeacherMappingList) async{
    Database db = await getDataBaseHandler();
    Batch batch = db.batch();
    for(var i = 0; i < standardTeacherMappingList.length; i++){
      StandardTeacher standardTeacher = standardTeacherMappingList[i];
      batch.insert(
          standardTeacherTable,
          standardTeacher.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace
      );
    }
    await batch.commit(noResult: true);
    print("StandardTeacher Saved Successfully in to Local DB : " + standardTeacherMappingList.length.toString());
  }

}