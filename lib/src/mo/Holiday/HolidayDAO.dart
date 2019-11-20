
import 'package:flutter_app/src/fr/db/DBProvider.dart';
import 'package:flutter_app/src/mo/Holiday/Holiday.dart';
import 'package:sqflite/sqflite.dart';



class HolidayDAO {
  static final holidayTable = "Holiday";
  String slelectedField = "h.id as holidayId,h.name as holidayName,h.startDate,h.endDate,h.type as vacationType,";

  Future<Database> getDataBaseHandler() async {
    final dbHelper = DBProvider.single_instance;
    final db = await dbHelper.database;
    return db;
  }

  int addHoliday(Holiday holiday) {
    Database db = null;
    getDataBaseHandler ( ).then ( ( dataBaseInstance ) async{
      db = dataBaseInstance;
      int futureId = await db.insert (
        holidayTable ,
        holiday.toJson ( ) ,
        conflictAlgorithm: ConflictAlgorithm.replace ,
      );

      return futureId;
    } );
  }


  getDbHoliday() async{

    print("getDbHoliday Starts ");
    Database db = await getDataBaseHandler();

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM Holiday ");

    var test =  List.generate(maps.length, (i) {
      return Holiday.fromJsonLocal(maps[i]);
    });
    print("Holiday List size : ${test.length}");
    return test;
  }

  batchAddHoliday(List<Holiday> holidayList) {
    Database db = null;
    getDataBaseHandler().then((dataBaseInstance) async{
      db = dataBaseInstance;
      Batch batch = db.batch();
      for(var i = 0; i < holidayList.length; i++){
        Holiday holiday = holidayList[i];
        batch.insert(
            holidayTable,
            holiday.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace
        );
      }
      await batch.commit(noResult: true);
      print("Holiday Saved Successfully in to Local DB : " + holidayList.length.toString());
    });
  }

}