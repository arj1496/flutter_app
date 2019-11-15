
import 'dart:convert';

import 'package:flutter_app/src/fr/db/DBProvider.dart';
import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Standard/StandardService.dart';
import 'package:flutter_app/src/mo/Subject/Subject.dart';
import 'package:flutter_app/src/mo/Subject/SubjectService.dart';
import 'package:flutter_app/src/mo/TimeTable/TimeTable.dart';
import 'package:sqflite/sqflite.dart';

class TimeTableDao{

  StandardService standardService = new StandardService();
  SubjectService subjectService = new SubjectService();

  static final timeTable_Table = "TimeTable";
  static final standardTable = "Standard";
  static final subjectTable = "Subject";

  Future<Database> getDataBaseHandler()  async {
    final dbHelper = DBProvider.single_instance;
    final db = await dbHelper.database;
    return db;
  }

  batchAddTimeTables(List<TimeTable> addTimeTableList) async{
    Database db = await getDataBaseHandler();
    Batch batch = db.batch();
    for(var i = 0; i < addTimeTableList.length; i++){
      TimeTable timeTable = addTimeTableList[i];
      batch.insert(
          timeTable_Table,
          timeTable.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace
      );
    }
    await batch.commit(noResult: true);
    print("TimeTable Saved Successfully in to Local DB : ${addTimeTableList.length}");

  }

  batchDeleteTimeTables(List<TimeTable> deletedTimeTableList) async{
    Database db = await getDataBaseHandler();
    Batch batch = db.batch();
    for(var i = 0; i < deletedTimeTableList.length; i++){
      batch.delete(timeTable_Table, where: 'id = ?', whereArgs: [deletedTimeTableList[i]]);
    }
    await batch.commit(noResult: true);
    print("TimeTable Deleted Successfully in to Local DB : ${deletedTimeTableList.length}");
  }

  getTimetableListFromLocalDb() async{
    print("getAllTimeTabletDataFromLocalDB Starts ");
    Database db = await getDataBaseHandler();
    String selectedFields = "t.id as timeTableId, t.title as timeTableTitle, t.date as timeTableDate, t.time as timeTableTime, t.day as timeTableDay, "
        "t.isWritable as timeTableisWritable, t.personId as timeTablePersonId, t.owner as timeTableOwner, t.operation as timeTableOperation, "
        "t.infraStructure as timeTableInfraStructure, std.id as standardId, std.name as standardName, sub.id as subjectId, sub.name as subjectName ";

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT $selectedFields FROM  $timeTable_Table t left join $standardTable std on t.standardId = std.id left join "
        "$subjectTable sub on t.subjectId = sub.id");
    List<TimeTable> timeTableList = new List();
    List.generate(maps.length, (i) async{
      TimeTable timeTable = TimeTable.fromJsonLocal(maps[i]);
      timeTableList.add(timeTable);
    });





    print("TimeTable List size : ${timeTableList.length}");
    return timeTableList;

  }

}