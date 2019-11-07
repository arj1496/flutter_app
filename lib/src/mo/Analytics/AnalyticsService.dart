import 'dart:convert';

import 'package:flutter_app/src/fr/SchoolUtils.dart';
import 'package:flutter_app/src/mo/Analytics/AnalyticsDao.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AnalyticsService{

  AnalyticsDao analyticsDao = new AnalyticsDao();


  Future<Map<String, dynamic>> getAnalytics() async {

    Map<String, String> requestParameterMap = new Map<String, String>();
    requestParameterMap["entity"] = "Student_Count";
    Map<String, dynamic> analyticsDataFuture = await getAnalyticsFromServer(requestParameterMap);
    var dataDump;
    if(analyticsDataFuture['status']){
      print(analyticsDataFuture);
      List<dynamic> analyticsDataList = analyticsDataFuture['studentCountData'];
      for(int i = 0; i < analyticsDataList.length; i++){
        var test = analyticsDataList[i]['dataDump'];
        dataDump = json.decode(test);
        print(dataDump);
      }
    }
    return dataDump;
  }

  Future<dynamic> getAnalyticsFromServer(Map<String, String> requestParameterMap) async{
    Map<String, String> headers = new Map<String, String>();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print(sharedPreferences.getString("token"));
    headers['authT'] = sharedPreferences.getString("token");

    final finalurl = SchoolUtils().baseUrl  + "rest/sync/getAnalyticsSyncInfo";
    var response = await http.post(finalurl, headers: headers, body: requestParameterMap);
    if(response.statusCode == 200){
      var responseJsonString = response.body;
      print(responseJsonString);
      final data = json.decode(response.body);
      return data;
    }
    return null;
  }

}