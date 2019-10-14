import 'package:flutter_app/src/fr/db/DBProvider.dart';
import 'package:flutter_app/src/mo/Student/Student.dart';
import 'package:sqflite/sqflite.dart';

class StudentDao{

  static final studentTable = "Student";

  Future<Database> getDataBaseHandler()  async {
    final dbHelper = DBProvider.single_instance;
    final db = await dbHelper.database;
    return db;
  }

  // this method is used to save the List of Teachers
  batchAddStudents(List<Student> studentList){
    getDataBaseHandler().then((dataBaseInstance) async{
      Database db = dataBaseInstance;
      Batch batch = db.batch();
      for(var i = 0; i < studentList.length; i++){
        Student student = studentList[i];
        batch.insert(
            studentTable,
            student.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace
        );
      }
      List<Student> savedStudentList = await batch.commit(noResult: true);
      print("Teacher Saved Successfully in to Local DB : " + savedStudentList.length.toString());
    });
  }

}