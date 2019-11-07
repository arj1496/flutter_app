import 'dart:convert';

import 'package:flutter_app/src/fr/db/DBProvider.dart';
import 'package:sqflite/sqlite_api.dart';

import 'Exam.dart';

class ExamDao{
  static final examTable = "Exam";
  String selectedField = "e.id as examId,e.name as examName,e.totalMark,e.examType,e.examDate,e.owner,e.description,e.syllabus, "
      "s.id as standardId,s.name as standardName, "
      "sub.id as subjectId,sub.name as subjectName " ;
  Future<Database> getDataBaseHandler( ) async {
    final dbHelper = DBProvider.single_instance;
    final db = await dbHelper.database;
    return db;
  }

  int addExam( Exam exam ) {
    Database db = null;
    getDataBaseHandler ( ).then ( ( dataBaseInstance ) async{
      db = dataBaseInstance;
      int futureId = await db.insert (
        examTable ,
        exam.toJson ( ) ,
        conflictAlgorithm: ConflictAlgorithm.replace ,
      );

     /* int examId;
      futureId.then<int> ( ( id ) {
        examId = id;
        exam.lid = examId;
        print("Exam Add sucessfully");
      } );*/

      return futureId;
    } );
  }

  getDbExam() async{

    print("getDbExam Starts ");
    Database db = await getDataBaseHandler();

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM Exam ");

    var test =  List.generate(maps.length, (i) {
      return Exam.fromJsonLocal(maps[i]);
    });
    print("Exam List size : ${test.length}");
    return test;
  }


  getJoinDbExam() async{

    print("getJoinDbExam Starts ");
    Database db = await getDataBaseHandler();

    /*List<Map<String, dynamic>> maps = await db.rawQuery("SELECT Exam.id,Exam.name,Exam.examDate,Standard.id,Standard.name "
        "FROM Exam left join Standard on Exam.standardId = Standard.id");*/

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT  ${selectedField}  from Exam e left join Standard s on e.standardId = s.id "
         "left join Subject sub on e.subjectId = sub.id");

    String str = json.encode(maps);
    print("str: ${str} ");
   var test =  List.generate(maps.length, (i) {
      return Exam.fromJsonLocal(maps[i]);
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

  batchAddExam(List<Exam> examList){
    Database db = null;
    getDataBaseHandler().then((dataBaseInstance) async{
      db = dataBaseInstance;
      Batch batch = db.batch();
      for(var i = 0; i < examList.length; i++){
        Exam exam = examList[i];
        batch.insert(
            examTable,
            exam.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace
        );
      }
      await batch.commit(noResult: true);
      print("Exam Saved Successfully in to Local DB : " + examList.length.toString());
    });
  }

  updateExam(Exam exam) {
    Database db = null;
    getDataBaseHandler ( ).then ( ( dataBaseInstance ) async{
      db = dataBaseInstance;

      int futureId = await db.update (
        examTable ,
        exam.toJson ( ) ,
        where: "id= ?",
        whereArgs: [exam.id],
      );
      return futureId;
  });
        }


        getFilterExam(int standardId,int subjectId,String type) async {
          print("getFilterExam Starts ");
          Database db = await getDataBaseHandler();
          bool isAndRequire = false;
          /*List<Map<String, dynamic>> maps = await db.rawQuery("SELECT Exam.id,Exam.name,Exam.examDate,Standard.id,Standard.name "
        "FROM Exam left join Standard on Exam.standardId = Standard.id");*/
          String query = "SELECT * FROM Exam e where ";
          if(standardId != null){
            query +=  "e.standardId = ${standardId} ";
            isAndRequire = true;
          }
          if(subjectId != null){
            if(isAndRequire){
              query +=  "and ";
            }
            query += "e.subjectId = ${subjectId} ";
            isAndRequire = true;
          }
          if(type != null && type != ""){
            if(isAndRequire){
              query +=  "and ";
            }
            query += "e.examType = '${type}' ";

          }

          List<Map<String, dynamic>> maps = await db.rawQuery(query);

          String str = json.encode(maps);
          print("str: ${str} ");
          var test =  List.generate(maps.length, (i) {
            return Exam.fromJsonLocal(maps[i]);
          });
          print("Exam List size in join : ${test.length}");
          return test;
        }

}