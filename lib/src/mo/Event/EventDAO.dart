import 'dart:async';

import 'package:flutter_app/src/mo/Participant/Participant.dart';
import 'package:flutter_app/src/mo/Person/Person.dart';
import 'package:flutter_app/src/mo/Person/PersonActivity.dart';
import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Standard/StandardActivity.dart';
import 'package:sqflite/sqflite.dart';
import 'Event.dart';
import 'package:flutter_app/src/fr/db/DBProvider.dart' ;

class EventDAO {

  static final eventTable = "Event";

  Future<Database> getDataBaseHandler( ) async {
    final dbHelper = DBProvider.single_instance;
    final db = await dbHelper.database;
    return db;
  }

  /* Event addEvent(Event event) {
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
  }*/

  int addEvent( Event event ) {
    Database db = null;
    getDataBaseHandler ( ).then ( ( dataBaseInstance ) async {
      db = dataBaseInstance;
      int futureId = await db.insert (
        eventTable ,
        event.toJson ( ) ,
        conflictAlgorithm: ConflictAlgorithm.replace ,
      );
      return futureId;
    } );
  }

  batchAddEvent( List<Event> eventList ) {
    Database db = null;
    getDataBaseHandler ( ).then ( ( dataBaseInstance ) async {
      db = dataBaseInstance;
      Batch batch = db.batch ( );
      for (var i = 0; i < eventList.length; i++) {
        Event event = eventList[i];
        batch.insert (
            eventTable ,
            event.toJson ( ) ,
            conflictAlgorithm: ConflictAlgorithm.replace
        );
      }
      await batch.commit ( noResult: true );
      print ( "Event Saved Successfully in to Local DB : " +
          eventList.length.toString ( ) );
    } );
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

  getAllEventData( ) async {
    print ( "getAllEventData Starts " );
    Database db = await getDataBaseHandler ( );

    //List<Map<String, dynamic>> maps = await db.query('Teacher');
    List<Map<String , dynamic>> maps = await db.rawQuery (
        "SELECT * FROM Event " );

    var test = List.generate ( maps.length , ( i ) {
      return Event.fromJson ( maps[i] );
    } );
    print ( "Event List size : ${test.length}" );
    return test;
  }

  updateEvent( Event event ) {
    Database db = null;
    getDataBaseHandler ( ).then ( ( dataBaseInstance ) async {
      db = dataBaseInstance;

      int futureId = await db.update (
        eventTable ,
        event.toJson ( ) ,
        where: "id= ?" ,
        whereArgs: [event.id] ,
      );
      return futureId;
    } );
  }

  Future<Map<int, Event>> getEventWithParticipant( ) async {
    print ( "getAllEventData Starts " );
    Database db = await getDataBaseHandler ( );
    String selectedField = "e.id as eId,e.name,e.description,e.place,e.startDate,e.endDate,e.type,e.owner,p.id as pdbId,p.participantId as partId,p.participantType,p.participantRole,p.reference,p.entityId";
    //List<Map<String, dynamic>> maps = await db.query('Teacher');
    List<Map<String , dynamic>> maps = await db.rawQuery (
        "SELECT ${selectedField} FROM Event e left join participant p on p.entityId = e.id");

    var test = List.generate ( maps.length , ( i ) {
      return Event.fromJsonForParticpant ( maps[i] );
    } );
    Map<int , Event> eventMap = await prepareEventParticipantMap ( test );
    print ( "Event List size : ${test.length}" );
    return eventMap;
  }

  Future<Map<int, Event>> prepareEventParticipantMap( List<Event> eventList ) async {
    Map<int , Event> eventMap = new Map( );

    for(Event event  in eventList) {
      if (!eventMap.containsKey(event.id)) {
        List<Participant> partListForMap = new List();
        partListForMap.add(await prepareParticipantObject(event));
        event.eventParticipant = partListForMap;
        eventMap[event.id] = event;
      } else {
        List<Participant> partListForMap_ = eventMap[event.id].eventParticipant;
        partListForMap_.add(await prepareParticipantObject(event));
        event.eventParticipant = partListForMap_;
        eventMap[event.id] = event;
      }
    }
    return eventMap;
  }

  Future<Participant> prepareParticipantObject(Event event) async {
    StandardActivity standardActivity = new StandardActivity();
    List<Standard> standards = await standardActivity.getStandardListFromLocalDB();
    Participant participant = new Participant( );
    if(event.participantType == "STANDARD_TEACHER" || event.participantType =="STANDARD_STUDENT" || event.participantType == "STANDARD_PARENT" || event.participantType == "STANDARD"){
       for(Standard standard in standards){
         if(event.participantId == standard.id){
           participant.standardName = standard.name;
         }
       }
    }
    participant.participantRole = event.participantRole;
    participant.participantType = event.participantType;
    participant.participantId = event.participantId;
    participant.id = event.pdbId;
    participant.entityId = event.id;
    participant.reference = 0;

    return participant;
  }
}
