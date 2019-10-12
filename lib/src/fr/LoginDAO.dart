
import 'package:flutter_app/src/fr/SharedPreference.dart';
import 'package:flutter_app/src/fr/db/DBProvider.dart';
import 'package:sqflite/sqflite.dart';

class LoginDAO{
  static final sharedPreferenceTable = "SharedPreference";

  Future<Database> getDataBaseHandler()  async {
    final dbHelper = DBProvider.single_instance;
    final db = await dbHelper.database;
    return db;
  }

  batchAddSharedPreference(List<SharedPreference> sharedPrefreferenceList){
    Database db = null;
    getDataBaseHandler().then((dataBaseInstance) async{
      db = dataBaseInstance;
      Batch batch = db.batch();
      for(var i = 0; i < sharedPrefreferenceList.length; i++){
        SharedPreference sharedPreference = sharedPrefreferenceList[i];
        batch.insert(
            sharedPreferenceTable,
            sharedPreference.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace
        );
      }
      await batch.commit(noResult: true);
      print("Shared Prefreference Saved Successfully in to Local DB : " + sharedPrefreferenceList.length.toString());
    });
  }

  getAllSharedPreferenceData() async{

    print("getAllSharedPreferenceData Starts ");
    Database db = await getDataBaseHandler();

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM SharedPreference ");

    var test =  List.generate(maps.length, (i) {
      return SharedPreference.fromJson(maps[i]);
    });
    print("getAllSharedPreferenceData List size : ${test.length}");
    //print("getAllSharedPreferenceData Starts ");
    return test;
  }

}