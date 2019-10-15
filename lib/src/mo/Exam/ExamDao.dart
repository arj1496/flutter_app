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
      } );

      return exam;
    } );
  }

  getAllExamData() async{

    print("getAllExamData Starts ");
    Database db = await getDataBaseHandler();

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM Exam ");

    var test =  List.generate(maps.length, (i) {
      return Exam.fromJson(maps[i]);
    });
    print("Exam List size : ${test.length}");
    return test;
  }

}