import 'dart:convert';
import 'package:flutter_app/src/fr/db/DBProvider.dart';
import 'package:flutter_app/src/mo/HomeWork/HomeWork.dart';
import 'package:flutter_app/src/mo/Student/Student.dart';
import 'package:sqflite/sqflite.dart';

class HomeworkDao{

  static final homeworkTable = "Homework";
  String selectedField = "h.id ,h.name as name,h.mark,h.startDate,h.endDate,h.owner,h.description, "
      "s.id as standardId,s.name as standardName, "
      "sub.id as subjectId,sub.name as subjectName " ;
  Future<Database> getDataBaseHandler()  async {
    final dbHelper = DBProvider.single_instance;
    final db = await dbHelper.database;
    return db;
  }

  // this method is used to save the List of Teachers
  batchAddHomework( List<HomeWork> homeworkList ) {
    getDataBaseHandler().then(( dataBaseInstance ) async {
      Database db = dataBaseInstance;
      Batch batch = db.batch();
      for (var i = 0; i < homeworkList.length; i++) {
        HomeWork homeWork = homeworkList[i];
        batch.insert(
            homeworkTable,
            homeWork.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace
        );
      }
      await batch.commit(noResult: true);
      print("Homework Saved Successfully in to Local DB : " + homeworkList.length.toString());
    });
  }

  getAllHomeworkDataFromLocalDB( ) async {
    print("getAllStudentDataFromLocalDB Starts ");
    Database db = await getDataBaseHandler();


    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT  ${selectedField}  from Homework h left join Standard s on h.standardId = s.id "
        "left join Subject sub on h.subjectId = sub.id");
  //  List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM  Homework ");

    String str = json.encode(maps);
    print("homework  data: ${str} ");
    var test = List.generate(maps.length, ( i ) {
      return HomeWork.fromJsonLocal(maps[i]);
    });
    print("homework List size : ${test.length}");
    return test;
  }


  int addHomework( HomeWork homeWork ) {
    Database db = null;
    getDataBaseHandler ( ).then ( ( dataBaseInstance ) async{
      db = dataBaseInstance;
      int futureId = await db.insert (
        homeworkTable ,
        homeWork.toJson ( ) ,
        conflictAlgorithm: ConflictAlgorithm.replace ,
      );
      return futureId;
    } );
  }


  updateHomework(HomeWork homeWork) {
    Database db = null;
    getDataBaseHandler ( ).then ( ( dataBaseInstance ) async{
      db = dataBaseInstance;

      int futureId = await db.update (
        homeworkTable ,
        homeWork.toJson ( ) ,
        where: "id= ?",
        whereArgs: [homeWork.serverId],
      );
      return futureId;
    });
  }

}