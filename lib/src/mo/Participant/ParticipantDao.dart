import 'package:flutter_app/src/fr/db/DBProvider.dart';
import 'package:flutter_app/src/mo/Participant/Event_Participant.dart';
import 'package:flutter_app/src/mo/Participant/Holiday_Participant.dart';
import 'package:flutter_app/src/mo/Participant/Participant.dart';
import 'package:sqflite/sqlite_api.dart';

class ParticipantDao{
  static final particpantTable = "Participant";
  static final eventParticipantTable = "EventParticipant";
  static final holidayParticipantTable="HolidayParticipant";

  Future<Database> getDataBaseHandler()  async {
    final dbHelper = DBProvider.single_instance;
    final db = await dbHelper.database;
    return db;
  }



  int addParticipant( Participant participant ) {
    Database db = null;
    getDataBaseHandler ( ).then ( ( dataBaseInstance ) async{
      db = dataBaseInstance;
      int futureId = await db.insert (
        particpantTable ,
        participant.toJson ( ) ,
        conflictAlgorithm: ConflictAlgorithm.replace ,
      );
      return futureId;
    } );
  }

  batchAddParticipant(List<Participant> participantList){
    Database db = null;
    getDataBaseHandler().then((dataBaseInstance) async{
      db = dataBaseInstance;
      Batch batch = db.batch();
      for(var i = 0; i < participantList.length; i++){
        Participant participant = participantList[i];
        batch.insert(
            particpantTable,
            participant.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace
        );
      }
      await batch.commit(noResult: true);
      print("Participant Saved Successfully in to Local DB : " + participantList.length.toString());
    });
  }

  batchAddEventParticipant(List<Event_Participant> eventParticipantList){
    Database db = null;
    getDataBaseHandler().then((dataBaseInstance) async{
      db = dataBaseInstance;
      Batch batch = db.batch();
      for(var i = 0; i < eventParticipantList.length; i++){
        Event_Participant event_participant = eventParticipantList[i];
        batch.insert(
            eventParticipantTable,
            event_participant.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace
        );
      }
      await batch.commit(noResult: true);
      print("Event_ParticipantList Saved Successfully in to Local DB : " + eventParticipantList.length.toString());
    });
  }


  batchAddHolidayParticipant(List<Holiday_Participant> holidayParticipantList){
    Database db = null;
    getDataBaseHandler().then((dataBaseInstance) async{
      db = dataBaseInstance;
      Batch batch = db.batch();
      for(var i = 0; i < holidayParticipantList.length; i++){
        Holiday_Participant holiday_participant = holidayParticipantList[i];
        batch.insert(
            eventParticipantTable,
            holiday_participant.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace
        );
      }
      await batch.commit(noResult: true);
      print("Holiday_ParticipantList Saved Successfully in to Local DB : " + holidayParticipantList.length.toString());
    });
  }

  getAllParticipantData() async{
    print("getAllParticipantData Starts ");
    Database db = await getDataBaseHandler();
    //List<Map<String, dynamic>> maps = await db.query('Teacher');
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM Participant ");

    var test =  List.generate(maps.length, (i) {
      return Participant.fromJson(maps[i]);
    });
    print("Participant List size : ${test.length}");
    return test;
  }

/*  updateEvent(Event event) {
    Database db = null;
    getDataBaseHandler ( ).then ( ( dataBaseInstance ) async{
      db = dataBaseInstance;

      int futureId = await db.update (
        eventTable ,
        event.toJson ( ) ,
        where: "id= ?",
        whereArgs: [event.id],
      );
      return futureId;
    });
  }*/


}