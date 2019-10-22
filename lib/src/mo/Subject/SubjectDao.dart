import 'package:flutter_app/src/fr/db/DBProvider.dart';
import 'package:flutter_app/src/mo/Subject/Subject.dart';
import 'package:sqflite/sqlite_api.dart';

class SubjectDao {

  static final subjectTable = "Subject";

  Future<Database> getDataBaseHandler( ) async {
    final dbHelper = DBProvider.single_instance;
    final db = await dbHelper.database;
    return db;
  }

  Subject addSubject( Subject subject ) {
    Database db = null;
    getDataBaseHandler ( ).then ( ( dataBaseInstance ) {
      db = dataBaseInstance;
      Future<int> futureId = db.insert (
        subjectTable ,
        subject.toJson ( ) ,
        conflictAlgorithm: ConflictAlgorithm.replace ,
      );

      int subjectId;
      futureId.then<int> ( ( id ) {
        subjectId = id;
        subject.lid = subjectId;
      } );

      return subject;
    } );
  }

  // this method is used to save the List of Subjects
  batchAddSubject( List<Subject> subjectList ) {
    Database db = null;
    getDataBaseHandler ( ).then ( ( dataBaseInstance ) async {
      db = dataBaseInstance;
      Batch batch = db.batch ( );
      for (var i = 0; i < subjectList.length; i++) {
        Subject subject = subjectList[i];
        batch.insert (
            subjectTable ,
            subject.toJson ( ) ,
            conflictAlgorithm: ConflictAlgorithm.replace
        );
      }
      await batch.commit ( noResult: true );
      print ( "Subject Saved Successfully in to Local DB : " +
          subjectList.length.toString ( ) );
    } );
  }

  Future<List<Subject>> getAllSubjectData_( ) async {
    getDataBaseHandler ( ).then ( ( dataBaseInstance ) {
      return getSubjectDataFromLocalDB ( dataBaseInstance );
    } ).then ( ( maps ) {
      var test = List.generate ( maps.length , ( i ) {
        return Subject.fromJsonLocal( maps[i] );
      } );
      return test;
    } );
  }

  Future<List<Map<String, dynamic>>> getSubjectDataFromLocalDB(Database db) {
    Future<List<Map<String, dynamic>>> maps = db.rawQuery("SELECT * FROM Subject ");
    return maps;
  }

  getAllSubjectData() async{

    print("getAllSubjectData Starts ");
    Database db = await getDataBaseHandler();

    //List<Map<String, dynamic>> maps = await db.query('Subject');
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM Subject ");

    var test =  List.generate(maps.length, (i) {
      return Subject.fromJsonLocal(maps[i]);
    });
    print("Subject List size : ${test.length}");
    return test;
  }

  getSubjectByStandardId(int standardId) async{


    Database db = await getDataBaseHandler();

    //List<Map<String, dynamic>> maps = await db.query('Subject');
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM Subject where standard=${standardId}");

    var test =  List.generate(maps.length, (i) {
      return Subject.fromJsonLocal(maps[i]);
    });
    print("Subject List size : ${test.length}");
    return test;
  }
}