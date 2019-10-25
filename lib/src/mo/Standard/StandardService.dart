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

  Future<List<Standard>> getStandardListDataFromServer() async {
    StandardWebService _standardWebService = new StandardWebService();

    HashMap map = new HashMap<String, String>();
    map['standard_sync_time'] = 0.toString();

    Map<String, dynamic> standardDataFromServer = await _standardWebService.getData_(map, "rest/sync/getSyncInfo");
    List<Standard> standardList;
    if(standardDataFromServer['isStandardSync']){
      print(standardDataFromServer);
      List<dynamic> standardsDynamic = standardDataFromServer['standards'];
      standardList = List.generate(standardsDynamic.length, (i){
        Standard standard = Standard.fromJsonServer(standardsDynamic[i]);
        return standard;
      });
      await batchAddStandard(standardList);
    }else{
      print('Standards Sync is false');
    }
    return standardList;
  }

  Future<List<Standard>> getStandardListFromLocalDB() async{
    List<Standard> standardListFromFuture = await standardDao.getAllStandardData();
    return standardListFromFuture;
  }

  syncCallBackHandle(Map<String, dynamic> syncDataResponse) async{
    List<dynamic> standardsDynamic = syncDataResponse['standards'];
    if(standardsDynamic != null && standardsDynamic.length > 0) {
      List<Standard> standardList = List.generate(standardsDynamic.length, (i){
        Standard standard = Standard.fromJsonServer(standardsDynamic[i]);
        return standard;
      });
      await batchAddStandard(standardList);
    }

  }


  List<Standard> getAllStandard(){
    List<Standard> standardList = new List();
    for(var i = 1 ; i < 3; i++){
      Standard standard = new Standard();
      standard.id = i;
      standard.name = 'Matematics' + i.toString();
      standard.startDate = 1572021449+i ;
      standard.endDate = 1572021449+i;
      standard.startTime = "2" + i.toString();
      standard.endTime = "2" + i.toString();
      standardList.add(standard);
    }
    return standardList;
  }


}