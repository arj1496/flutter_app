import 'dart:convert';

import 'package:flutter_app/src/fr/db/DBProvider.dart';
import 'package:sqflite/sqlite_api.dart';

import 'Exam.dart';

class ExamDao{
  static final examTable = "Exam";

  Future<Database> getDataBaseHandler( ) async {
    final dbHelper = DBProvider.single_instance;
    final db = await dbHelper.database;
    return db;
  }

  Exam addExam( Exam exam ) {
    Database db = null;
    getDataBaseHandler ( ).then ( ( dataBaseInstance ) {
      db = dataBaseInstance;
      Future<int> futureId = db.insert (
        examTable ,
        exam.toJson ( ) ,
        conflictAlgorithm: ConflictAlgorithm.replace ,
      );
      int examId;
      futureId.then<int> ( ( id ) {
        examId = id;
        exam.lid = examId;
        print("Exam Add sucessfully");
      } );

      return exam;
    } );
  }

  getDbExam() async{

    print("getAllExamData Starts ");
    Database db = await getDataBaseHandler();

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM Exam ");

    var test =  List.generate(maps.length, (i) {
      return Exam.fromJson(maps[i]);
    });
    print("Exam List size : ${test.length}");
    return test;
  }


  getJoinDbExam() async{

    print("getJoinDbExam Starts ");
    Database db = await getDataBaseHandler();

    /*List<Map<String, dynamic>> maps = await db.rawQuery("SELECT Exam.id,Exam.name,Exam.examDate,Standard.id,Standard.name "
        "FROM Exam left join Standard on Exam.standardId = Standard.id");*/

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT e.id as examId,e.name as examName,"
        "s.id as standardId,s.name as standardName "
        "FROM Exam e left join Standard s on e.standardId = s.id");

    String str = json.encode(maps);
    print("str: ${str} ");
   var test =  List.generate(maps.length, (i) {
      return Exam.fromJson(maps[i]);
    });
    print("Exam List size in join : ${test.length}");
    return test;
  }

  getSubJoinDbExam() async{

    print("getJoinDbExam Starts ");
    Database db = await getDataBaseHandler();

    /*List<Map<String, dynamic>> maps = await db.rawQuery("SELECT Exam.id,Exam.name,Exam.examDate,Standard.id,Standard.name "
        "FROM Exam left join Standard on Exam.standardId = Standard.id");*/

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT e.id as examId,e.name as examName,s.id as subId,s.name as subName "
        "FROM Exam e left join Subject s on e.subjectId = s.id");

    String str = json.encode(maps);
    print("str: ${str} ");
    var test =  List.generate(maps.length, (i) {
      return Exam.fromJson(maps[i]);
    });
    print("Exam List size in join : ${test.length}");
    return test;
  }
}