

import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';


class  DBProvider {

  static final _databaseName = "ecdb.db";
  static final _databaseVersion = 1;

  // make this a singleton class
  DBProvider._();

  static final DBProvider single_instance = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null)
      return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    // _database = await _initDatabase();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute(cretaeTeacherTable());
      await db.execute(createEventTable());
    });
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);

    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {

    await db.execute(
        cretaeStudentTable()
            + cretaeStudentTable()
    );

  }

  String cretaeTeacherTable() {

    return " CREATE TABLE Teacher ("
        "lid INTEGER,"
        "id INTEGER PRIMARY KEY,"
        "firstName TEXT,"
        "lastName TEXT,"
        "person INTEGER,"
        "isWritable INTEGER,"
        "gender TEXT,"
        "email TEXT,"
        "standardIds TEXT,"
        "userId INTEGER,"
        "role TEXT"
        ")" ;
  }

  String cretaeStudentTable() {

    return " CREATE TABLE Student ("
        "lid INTEGER ,"
        "id INTEGER PRIMARY KEY,"
        "firstName TEXT,"
        "lastName TEXT,"
        "person INTEGER,"
        "isWritable INTEGER,"
        "gender TEXT,"
        "email TEXT,"
        "standardIds TEXT,"
        "userId TEXT "
        ")" ;
  }
  String createEventTable(){
    return "CREATE TABLE Event ( "
    " lid INTEGER , "
    " id INTEGER PRIMARY KEY, "
    " name  TEXT, "
    " description TEXT,"
    " place TEXT,"
    " startDate INTEGER, "
    " endDate INTEGER,"
    " status INTEGER, "
    " type TEXT, "
    " owner TEXT, "
    " person INTEGER, "
    " allDay INTEGER,"
    " isWritable INTEGER,"
    " attachment TEXT,"
    "attechmentJson TEXT "
    ")";
     /*
  List<Participant> eventParticipant = new List<Participant>();
  //Map<Integer, Set<Long>> personalParticipant = new Map<Integer, Set<Long>>(1);
  List<Attachment> attachments;
      */

  }






}