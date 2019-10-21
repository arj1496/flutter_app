import 'package:flutter_app/src/fr/db/DBProvider.dart';
import 'package:sqflite/sqlite_api.dart';

import 'Standard.dart';

class StandardDao{
  static final standardTable = "Standard";

  Future<Database> getDataBaseHandler()  async {
    final dbHelper = DBProvider.single_instance;
    final db = await dbHelper.database;
    return db;
  }

  //this method is used to add single standard
  Standard addStandard(Standard standard) {
    Database db = null;
    getDataBaseHandler().then((dataBaseInstance){
      db = dataBaseInstance;
      Future<int> futureId = db.insert(
        standardTable,
        standard.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      int standardId;
      futureId.then<int>((id){
        standardId = id;
        standard.lid = standardId;
      });

      return standard;
    });
  }

  batchAddStandard(List<Standard> standardList){
    Database db = null;
    getDataBaseHandler().then((dataBaseInstance) async{
      db = dataBaseInstance;
      Batch batch = db.batch();
      for(var i = 0; i < standardList.length; i++){
        Standard standard = standardList[i];
        batch.insert(
            standardTable,
            standard.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace
        );
      }
      await batch.commit(noResult: true);
      print("Standard Saved Successfully in to Local DB : " + standardList.length.toString());
    });
  }

  Future<List<Standard>> getAllStanadardData_() async{

    getDataBaseHandler().then((dataBaseInstance){
      return getStandardDataFromLocalDB(dataBaseInstance);
    }).then((maps){
      var test =  List.generate(maps.length, (i) {
        return Standard.fromJsonLocal(maps[i]);
      });
      return test;
    });
  }

  Future<List<Map<String, dynamic>>> getStandardDataFromLocalDB(Database db) {
    Future<List<Map<String, dynamic>>> maps = db.rawQuery("SELECT * FROM Standard ");
    return maps;
  }

  getAllStandardData() async{

    print("getAllStandardData Starts ");
    Database db = await getDataBaseHandler();

    //List<Map<String, dynamic>> maps = await db.query('Standard');
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM Standard ");

    var test =  List.generate(maps.length, (i) {
      return Standard.fromJsonLocal(maps[i]);
    });
    print("Standard List size : ${test.length}");
    return test;
  }
}