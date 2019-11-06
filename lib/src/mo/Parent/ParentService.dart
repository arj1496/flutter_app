
import 'dart:collection';

import 'package:flutter_app/src/mo/Parent/Parent.dart';
import 'package:flutter_app/src/mo/Parent/ParentDAO.dart';
import 'package:flutter_app/src/mo/Parent/ParentWebService.dart';

class ParentService{

  ParentDAO parentDAO = new ParentDAO();

  batchAddParents(List<Parent> parentList){
    parentDAO.batchAddParents(parentList);
  }

  Future<List<Parent>> getParentListDataFromServer() async {
    ParentWebService _parentWebService = new ParentWebService();

    HashMap inputDataMap = new HashMap<String, String>();
    inputDataMap['parent_sync_time'] = 0.toString();

    Map<String, dynamic> parentDataFromServer = await _parentWebService.getData_(inputDataMap, "rest/sync/getSyncInfo");
    List<Parent> parentList;
    if(parentDataFromServer['isParentSync']){
      print(parentDataFromServer);
      List<dynamic> parentsDynamic = parentDataFromServer['parents'];
      parentList = List.generate(parentsDynamic.length, (i){
        Parent parent = Parent.fromJsonServer(parentsDynamic[i]);
        return parent;
      });
      await batchAddParents(parentList);
    }else{
      print('Parent Sync is false');
    }
    return parentList;
  }

  Future<List<Parent>> getParentListFromLocalDB() async{
    List<Parent> parentListFromFuture = await parentDAO.getAllParentDataFromLocalDB();
    return parentListFromFuture;
  }

  // To get Parent data from parentIds
  Future<List<Parent>> getAllParentDataFromId(String parentIds) async{
    List<Parent> parentListFromFuture = await parentDAO.getAllParentDataFromId(parentIds);
    return parentListFromFuture;
  }

  syncCallBackHandle(Map<String, dynamic> syncDataResponse) async {
    List<dynamic> parentsDynamic = syncDataResponse['parents'];
    if(parentsDynamic != null && parentsDynamic.length > 0){
      List<Parent> parentList = List.generate(parentsDynamic.length, (i){
        Parent parent = Parent.fromJsonServer(parentsDynamic[i]);
        return parent;
      });
      await batchAddParents(parentList);
    }

  }



}