import 'package:flutter_app/TeacherDropDown.dart';
import 'package:flutter_app/src/fr/db/DBProvider.dart';
import 'package:flutter_app/src/mo/Subject/Subject.dart';
import 'package:flutter_app/src/mo/teacher/StandardTeacher.dart';
import 'package:flutter_app/src/mo/teacher/Teacher.dart';
import 'package:flutter_app/src/mo/teacher/TeacherService.dart';
import 'package:sqflite/sqlite_api.dart';

class SubjectDao {

  static final subjectTable = "Subject";

  Future<Database> getDataBaseHandler() async {
    final dbHelper = DBProvider.single_instance;
    final db = await dbHelper.database;
    return db;
  }

  Subject addSubject(Subject subject) {
    Database db = null;
    getDataBaseHandler().then((dataBaseInstance) {
      db = dataBaseInstance;
      Future<int> futureId = db.insert(
        subjectTable,
        subject.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      int subjectId;
      futureId.then<int>((id) {
        subjectId = id;
        subject.lid = subjectId;
      });

      return subject;
    });
  }

  // this method is used to save the List of Subjects
  batchAddSubject(List<Subject> subjectList) {
    Database db = null;
    getDataBaseHandler().then((dataBaseInstance) async {
      db = dataBaseInstance;
      Batch batch = db.batch();
      for (var i = 0; i < subjectList.length; i++) {
        Subject subject = subjectList[i];
        batch.insert(
            subjectTable,
            subject.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace
        );
      }
      await batch.commit(noResult: true);
      print("Subject Saved Successfully in to Local DB : " +
          subjectList.length.toString());
    });
  }

  Future<List<Subject>> getAllSubjectData_() async {
    getDataBaseHandler().then((dataBaseInstance) {
      return getSubjectDataFromLocalDB(dataBaseInstance);
    }).then((maps) {
      var test = List.generate(maps.length, (i) {
        return Subject.fromJsonLocal(maps[i]);
      });
      return test;
    });
  }

  Future<List<Map<String, dynamic>>> getSubjectDataFromLocalDB(Database db) {
    Future<List<Map<String, dynamic>>> maps = db.rawQuery(
        "SELECT * FROM Subject ");
    return maps;
  }

  getAllSubjectData() async {
    try{
      print("getAllSubjectData Starts ");
      Database db = await getDataBaseHandler();

      List<Map<String, dynamic>> maps = await db.rawQuery(
          "SELECT * FROM Subject ");
      Map<int, List<Teacher>> subjectIdTeacherList = await getSubjectIdTeacherList();

      List<Subject> subjectList = List.generate(maps.length, (i) {
        Subject subject = Subject.fromJsonLocal(maps[i]);
        subject.teacherList = subjectIdTeacherList[subject.id];
        return subject;
      });
      print("Subject List size : ${subjectList.length}");
      return subjectList;
    }catch (e){
      print(e.toString());
    }
    return null;
  }


  getSubjectByStandardId(int standardId) async {
    Database db = await getDataBaseHandler();

    //List<Map<String, dynamic>> maps = await db.query('Subject');
    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM Subject where standard=${standardId}");

    var test = List.generate(maps.length, (i) {
      return Subject.fromJsonLocal_(maps[i]);
    });
    print("Subject List size : ${test.length}");
    return test;
  }

  Future<Subject> getSubjectBySubjectId(int subjectId) async {
    Database db = await getDataBaseHandler();
    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM Subject where id = $subjectId");
    List<Subject> subjectList = List.generate(maps.length, (i) {
      return Subject.fromJsonLocal(maps[i]);
    });
    return subjectList[0];
  }

  getSubjectIdTeacherList() async{
    Map<int, List<Teacher>> subjectTeacherListMap = new Map();
    TeacherServcie teacherServcie = new TeacherServcie();
    List<StandardTeacher> standardTeacherList =  await teacherServcie.getSubjectTeacherMapping();
    Map<int, List<int>> subjectIdTeacherIdsListMap = getSubjectIdTeacherListMap(standardTeacherList);
    List<int> teacherIds = new List();
    for(int subjectId in subjectIdTeacherIdsListMap.keys){
      teacherIds.addAll(subjectIdTeacherIdsListMap[subjectId]);
    }

    List<Teacher> teacherList = await teacherServcie.getTeachersById(teacherIds);
    Map<int, Teacher> teacherMap = getTeacherMap(teacherList);

    for(int subjectId in subjectIdTeacherIdsListMap.keys){
      List<Teacher> teacherList = subjectTeacherListMap[subjectId];
      List<int> teacherIds = subjectIdTeacherIdsListMap[subjectId];
      if(teacherList == null){
        teacherList = new List();
        subjectTeacherListMap[subjectId] = teacherList;
      }
      for(int i = 0; i< teacherIds.length; i++){

        int teacherId = teacherIds[i];
        Teacher teacher = teacherMap[teacherId];
        teacherList.add(teacher);
      }
    }
    return subjectTeacherListMap;
  }

  Map<int, List<int>> getSubjectIdTeacherListMap(List standardTeacherList) {
    Map<int, List<int>> subjectIdTeacherListMap;
    if (standardTeacherList != null && standardTeacherList.length > 0) {
      subjectIdTeacherListMap = new Map();
      for (int i = 0; i < standardTeacherList.length; i++) {
        StandardTeacher standardTeacher = standardTeacherList[i];
        List<int> subjectIdTeacherList = subjectIdTeacherListMap[standardTeacher.subjectId];
         if (subjectIdTeacherList == null){
           subjectIdTeacherList = new List();
           subjectIdTeacherListMap[standardTeacher.subjectId] = subjectIdTeacherList;
         }
         subjectIdTeacherList.add(standardTeacher.teacherId);
      }
    }
    return subjectIdTeacherListMap;
  }

  Map<int, Teacher> getTeacherMap(List<Teacher> teacherList) {
    Map<int, Teacher> teacherMap = new Map();
    if(teacherList != null && teacherList.length > 0){
      for(int i = 0; i < teacherList.length; i++){
        teacherMap[teacherList[i].id] = teacherList[i];
      }
    }
    return teacherMap;

  }
}