import 'package:flutter_app/src/fr/db/DBProvider.dart';
import 'package:flutter_app/src/mo/Attendance/Attendance.dart';
import 'package:sqflite/sqlite_api.dart';

class AttendanceDao
{
  static final attendanceTable = "Attendance";
  String slelectedField = "a.id as attendanceId,a.date,a.owner,a.standard,a.subject,a.type,a.isWitabel,a.commaseperatedAbsent,a.status,a.message,a.recordId,a.syncTime,a.timetableId,";

  Future<Database> getDataBaseHandler() async {
    final dbHelper = DBProvider.single_instance;
    final db = await dbHelper.database;
    return db;
  }

  int addAttendance(Attendance attendance) {
    Database db = null;
    getDataBaseHandler ( ).then ( ( dataBaseInstance ) async{
      db = dataBaseInstance;
      int futureId = await db.insert (
        attendanceTable ,
        attendance.toJson ( ) ,
        conflictAlgorithm: ConflictAlgorithm.replace ,
      );

      return futureId;
    } );
  }


  getDbAttendance() async{

    print("getDbattendance Starts ");
    Database db = await getDataBaseHandler();

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM Attendance ");

    var test =  List.generate(maps.length, (i) {
      return Attendance.fromJsonLocal(maps[i]);
    });
    print("Attendance List size : ${test.length}");
    return test;
  }


  batchAddAttendance(List<Attendance> AttendanceList) {
    Database db = null;
    getDataBaseHandler().then((dataBaseInstance) async{
      db = dataBaseInstance;
      Batch batch = db.batch();
      for(var i = 0; i < AttendanceList.length; i++){
        Attendance attendance = AttendanceList[i];
        batch.insert(
            attendanceTable,
            attendance.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace
        );
      }
      await batch.commit(noResult: true);
      print("Attendance Saved Successfully in to Local DB : " + AttendanceList.length.toString());
    });
  }
}