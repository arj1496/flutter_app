import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'Event.dart';
import 'package:flutter_app/src/fr/db/DBProvider.dart' ;

class EventDAO{

  static final eventTable = "Event";

  Future<Database> getDataBaseHandler()  async {
    final dbHelper = DBProvider.single_instance;
    final db = await dbHelper.database;
    return db;
  }

  Event addEvent(Event event) {
    Database db = null;
    getDataBaseHandler().then((dataBaseInstance){
      db = dataBaseInstance;
      Future<int> futureId = db.insert(
        eventTable,
        event.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      int eventId;
      futureId.then<int>((id){
        eventId = id;
        event.lid = eventId;
      });
      return event;
    });
  }

  batchAddEvent(List<Event> eventList){
    Database db = null;
    getDataBaseHandler().then((dataBaseInstance) async{
      db = dataBaseInstance;
      Batch batch = db.batch();
      for(var i = 0; i < eventList.length; i++){
        Event event = eventList[i];
        batch.insert(
            eventTable,
            event.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace
        );
      }
      await batch.commit(noResult: true);
      print("Event Saved Successfully in to Local DB : " + eventList.length.toString());
    });
  }

 /* Future<List<Event>> getAllEventData_() async{
    getDataBaseHandler().then((dataBaseInstance){
      return getEventDataFromLocalDB(dataBaseInstance);
    }).then((maps){
      var test =  List.generate(maps.length, (i) {
        return Event.fromJson(maps[i]);
      });
      return test;
    });
  }

  Future<List<Map<String, dynamic>>> getEventDataFromLocalDB(Database db) {
    Future<List<Map<String, dynamic>>> maps = db.rawQuery("SELECT * FROM Event ");
    return maps;
  }*/

  getAllEventData() async{

    print("getAllEventData Starts ");
    Database db = await getDataBaseHandler();

    //List<Map<String, dynamic>> maps = await db.query('Teacher');
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM Event ");

    var test =  List.generate(maps.length, (i) {
      return Event.fromJson(maps[i]);
    });
    print("Event List size : ${test.length}");
    return test;
  }
}