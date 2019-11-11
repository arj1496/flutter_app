
import 'package:flutter_app/src/fr/db/DBProvider.dart';
import 'package:flutter_app/src/mo/TimeTable/TimeTable.dart';
import 'package:sqflite/sqflite.dart';

class TimeTableDao{

  static final timeTable_Table = "TimeTable";

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

}