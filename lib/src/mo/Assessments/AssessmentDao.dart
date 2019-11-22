import 'package:flutter_app/src/fr/db/DBProvider.dart';
import 'package:flutter_app/src/mo/Assessments/Assessment.dart';
import 'package:sqflite/sqlite_api.dart';

class AssessmentDao{

  static final assessmentTable = "Skill";

  Future<Database> getDataBaseHandler() async {
    final dbHelper = DBProvider.single_instance;
    final db = await dbHelper.database;
    return db;
  }

  batchAddAssessment(List<Assessment> assessmentList) {
    getDataBaseHandler().then((dataBaseInstance) async {
      Database db = dataBaseInstance;
      Batch batch = db.batch();
      for (var i = 0; i < assessmentList.length; i++) {
        Assessment assessment = assessmentList[i];
        batch.insert(
            assessmentTable,
            assessment.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace
        );
      }
      await batch.commit(noResult: true);
      print("Assessment Saved Successfully in to Local DB : " +
          assessmentList.length.toString());
    });
  }

  getAllAssessmentData() async{
    print("getAllAssessmentData Starts");
    Database db = await getDataBaseHandler();

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM Skill ");

    var assessmentList = List.generate(maps.length, (i){
      Assessment assessment = Assessment.fromJsonLocal(maps[i]);
      return assessment;
    });//list.generate
    return assessmentList;
  }
}