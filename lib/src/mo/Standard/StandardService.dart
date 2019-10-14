import 'dart:collection';
import 'package:flutter_app/src/mo/Standard/StandardWebService.dart';
import 'Standard.dart';
import 'StandardDao.dart';

class StandardService{

  StandardDao standardDao = new StandardDao();

  // this method is used to save the single instance  of standard
  Standard addStandard(Standard standard){
    Standard _standard = standardDao.addStandard(standard);
  }

  // this method is used to save the List of standards
  batchAddStandard(List<Standard> standardList){
    standardDao.batchAddStandard(standardList);
  }

  List<Standard> getStandardList_() {
    List<Standard> standardsList = null;
    Future<List<Standard>> standardListFromFuture = standardDao.getAllStandardData();
    standardListFromFuture.then((standards){
      standardsList =  standards;
    });
    return standardsList;
  }

  Future<List<Standard>> getStandardList() async{
    List<Standard> standardListFromFuture = await standardDao.getAllStandardData();
    return standardListFromFuture;
  }

  Future<List<Standard>> getStandardListDataFromServer() async {
    StandardWebService _standardWebService = new StandardWebService();

    HashMap map = new HashMap<String, String>();
    map['standard_sync_time'] = 0.toString();

    Map<String, dynamic> standardDataFromServer = await _standardWebService.getData_(map, "rest/sync/getSyncInfo");
    List<Standard> standardList = null;
    if(standardDataFromServer['isStandardSync']){
      print(standardDataFromServer);
      List<dynamic> standardsDynamic = standardDataFromServer['standards'];
      standardList = List.generate(standardsDynamic.length, (i){
        Standard standard = Standard.fromJson(standardsDynamic[i]);
        return standard;
      });
      await batchAddStandard(standardList);
    }else{
      print('Standards Sync is false');
    }
    return standardList;
  }
}