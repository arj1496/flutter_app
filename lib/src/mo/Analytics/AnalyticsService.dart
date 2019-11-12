import 'dart:convert';

import 'package:flutter_app/src/fr/SchoolUtils.dart';
import 'package:flutter_app/src/mo/Analytics/AnalyticsDao.dart';
import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AnalyticsService{

  AnalyticsDao analyticsDao = new AnalyticsDao();


  Future<Map<String, dynamic>> getAnalytics() async {

    Map<String, String> requestParameterMap = new Map<String, String>();
    requestParameterMap["entity"] = "Student_Count";
    Map<String, dynamic> analyticsDataFuture = await getAnalyticsFromServer(requestParameterMap);
    var dataDump;
    Map<String, dynamic> DataMap = new Map();
    if(analyticsDataFuture['status']){
      print(analyticsDataFuture);
      List<dynamic> analyticsDataList = analyticsDataFuture['studentCountData'];
      for(int i = 0; i < analyticsDataList.length; i++){
        var test = analyticsDataList[i]['dataDump'];
        dataDump = json.decode(test);
        print(dataDump);
      }
      DataMap['dataDumpMap'] = dataDump;

      List<dynamic> standardsList = analyticsDataFuture['standards'];
      var divisionGradeClassListMap = getDivisionGradeClassListMap(standardsList);
      DataMap['divisionGradeClassListMap'] = divisionGradeClassListMap;

      var divisionClassListMap = getDivisionClassListMap(standardsList);
      DataMap['divisionClassListMap'] = divisionClassListMap;

      List<dynamic> divisionList = analyticsDataFuture['divisions'];
      DataMap['divisionList'] = divisionList;
    }
    return DataMap;

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

  Map<int, Map<int, List<int>>> getDivisionGradeClassListMap(List standardsList) {
    Map<int, Map<int, List<int>>> divisionGradeClassListMap;
    if(standardsList != null && standardsList.length > 0){
      divisionGradeClassListMap = new Map();
      for(int i = 0; i < standardsList.length; i++){
        if(standardsList[i]['divisionId'] != null){
          Map<int, List<int>> gradeClassListMap = divisionGradeClassListMap[standardsList[i]['divisionId']];
          if(gradeClassListMap == null){
            gradeClassListMap = new Map();
            divisionGradeClassListMap[standardsList[i]['divisionId']] = gradeClassListMap;
          }
          if(standardsList[i]['gradeId'] != null){
            List<int> classList = gradeClassListMap[standardsList[i]['gradeId']];
            if(classList == null){
              classList = new List();
              gradeClassListMap[standardsList[i]['gradeId']] = classList;
            }
            classList.add(standardsList[i]['id']);
          }
        }
      }
    }
    return divisionGradeClassListMap;
  }

  Map<int, List<int>> getDivisionClassListMap(List standardsList) {
    Map<int, List<int>> divisionClassListMap;
    if(standardsList != null && standardsList.length > 0) {
      divisionClassListMap = new Map();
      for (int i = 0; i < standardsList.length; i++) {
        if (standardsList[i]['divisionId'] != null && standardsList[i]['gradeId'] == null) {
          List<int> classList = divisionClassListMap[standardsList[i]['divisionId']];
          if (classList == null) {
            classList = new List();
            divisionClassListMap[standardsList[i]['divisionId']] = classList;
          }
          classList.add(standardsList[i]['id']);
        }
      }
    }
    return divisionClassListMap;
  }

}