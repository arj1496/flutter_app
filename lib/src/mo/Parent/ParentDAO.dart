import 'dart:convert';

import 'package:flutter_app/src/fr/db/DBProvider.dart';
import 'package:flutter_app/src/mo/Parent/Parent.dart';
import 'package:sqflite/sqflite.dart';

class ParentDAO {
  static final parentTable = "Parent";

  Future<Database> getDataBaseHandler() async {
    final dbHelper = DBProvider.single_instance;
    final db = await dbHelper.database;
    return db;
  }

  batchAddParents(List<Parent> parentList) {
    getDataBaseHandler().then((dataBaseInstance) async {
      Database db = dataBaseInstance;
      Batch batch = db.batch();
      for (var i = 0; i < parentList.length; i++) {
        Parent parent = parentList[i];
        batch.insert(parentTable, parent.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace);
      }
      await batch.commit(noResult: true);
      print("Parents Saved Successfully in to Local DB : " + parentList.length.toString());
    });
  }

  getAllParentDataFromLocalDB( ) async {
    print("getAllParentDataFromLocalDB Starts ");
    Database db = await getDataBaseHandler();

    String seletedField =  's.id as parentId, s.firstName as parentFirstName, s.lastName as parentLastName, p.id as personId';

    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM  ${parentTable} p ");

    var parentList = List.generate(maps.length, ( i ) {
      return Parent.fromJsonLocal(maps[i]);
    });
    print("Parent List size : ${parentList.length}");
    return parentList;
  }

  // To get Parent data from parentIds ("12,13")
  getAllParentDataFromId(String parentIds ) async {
    //print("getAllParentDataFromId Starts ");
    Database db = await getDataBaseHandler();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM  ${parentTable} p where p.id in  (${parentIds}) ");
    var parentList = List.generate(maps.length, ( i ) {
      return Parent.fromJsonLocal(maps[i]);
    });
    //print("Parent List size : ${parentList.length}");
    return parentList;
  }



}
