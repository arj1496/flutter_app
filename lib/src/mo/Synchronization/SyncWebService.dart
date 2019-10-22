
import 'dart:convert';

import 'package:flutter_app/src/fr/SchoolUtils.dart';
import 'package:http/http.dart' as http;

import '../../../UrlUtils.dart';

class SyncWebService{

  UrlUtils urlUtils = new UrlUtils();

  Future<dynamic> getSyncDataFromServer(Map<String, String> syncParameterMap) async{

    String authToken = await urlUtils.getAuthToken();
    Map<String, String> headers = new Map<String, String>();
    headers['authT'] = authToken;

    final url =  SchoolUtils().baseUrl + "rest/sync/getSyncInfo";
    var response = await http.post(url, headers: headers, body: syncParameterMap);
    if(response.statusCode == 200){
      var responseJsonString = response.body;
      print(responseJsonString);
      final data = json.decode(response.body);
      return data;
    }
    return null;
  }


}