import 'dart:convert';

import 'package:flutter_app/src/fr/db/DBProvider.dart';
import 'package:flutter_app/src/mo/Student/StandardMapping.dart';
import 'package:flutter_app/src/mo/Student/Student.dart';
import 'package:sqflite/sqflite.dart';

class StudentDao{

  static final studentTable = "Student";
  static final standardMappingTable = "StandardMappingTable";

  Future<Database> getDataBaseHandler()  async {
    final dbHelper = DBProvider.single_instance;
    final db = await dbHelper.database;
    return db;
  }

  // this method is used to save the List of Students
  batchAddStudents( List<Student> studentList ) {
    getDataBaseHandler().then(( dataBaseInstance ) async {
      Database db = dataBaseInstance;
      Batch batch = db.batch();
      for (var i = 0; i < studentList.length; i++) {
        Student student = studentList[i];
        batch.insert(
            studentTable,
            student.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace
        );
      }
      await batch.commit(noResult: true);
      print("Students Saved Successfully in to Local DB : " + studentList.length.toString());
    });
  }

  // this method is used to save the List of Students StandardMappings
  batchAddStudentStandardMapping(List<StandardMapping> standardMappingList) async{
    Database db = await getDataBaseHandler();
    Batch batch = db.batch();
    for (var i = 0; i < standardMappingList.length; i++) {
      StandardMapping standardMapping = standardMappingList[i];
      batch.insert(
          standardMappingTable,
          standardMapping.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace
      );
    }
    await batch.commit(noResult: true);
    print("standardMapping Saved Successfully in to Local DB : " + standardMappingList.length.toString());
  }

  getAllStudentDataFromLocalDB( ) async {
    print("getAllStudentDataFromLocalDB Starts ");
    Database db = await getDataBaseHandler();

    String selectedField =  's.id as studServerId, s.firstName as studFirstName, s.lastName as studLastName , s.parentIds as studParentIds';

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT $selectedField FROM  $studentTable s");

    String str = json.encode(maps);
    print("student left join data: $str ");
    var test = List.generate(maps.length, ( i ) {
      Student student = Student.fromJsonLocal(maps[i]);
      return student;
    });
    print("Student List size : ${test.length}");
    return test;
  }

  getStudentStandardMapping(int studentId) async{
    Database db = await getDataBaseHandler();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM StandardMappingTable sm where sm.studentId = $studentId ");
    var standardMappingList = List.generate(maps.length, ( i ) {
      return StandardMapping.fromJsonLocal(maps[i]);
    });
    print("StandardMapping List size : ${standardMappingList.length}");
    return standardMappingList;
  }

  Future<List<Student>> getAllStudentsByClassIdFromLocalDB(int classId) async{

    Database db = await getDataBaseHandler();
    String selectedField = 's.id as studServerId, s.firstName as studFirstName, s.lastName as studLastName, s.studentId as studentId, '
        's.gender as studGender, sm.rollNo as studRollNo, s.personId as studPersonId, s.email as studEmailId, s.mobileNumber as studMobileNo, '
        's.parentIds as studParentIds, s.isWritable as studIsWritable, s.cardId as studCardId, s.isCardActive as studIsCardActive, s.birthDate as studBirthDate, '
        'std.id as studStandardId, std.name as studStandardName ';

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT $selectedField FROM  $studentTable s "
        "left join StandardMappingTable sm on s.id = sm.studentId "
        "left join Standard std on s.standardId = std.id "
        "where sm.standardId = $classId");
    List<Student> studentList = List.generate(maps.length, ( i ) {
      return Student.fromJsonLocal(maps[i]);
    });
    print("Student List size : ${studentList.length}");
    return studentList;
  }





}