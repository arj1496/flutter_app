import 'dart:collection';
import 'dart:convert';
import 'dart:core' as prefix0;
import 'dart:core';
import 'package:flutter_app/UrlUtils.dart';
import 'package:flutter_app/src/fr/SchoolUtils.dart';
import 'package:flutter_app/src/mo/HomeWork/HomeWork.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class HomeworkWebService{
  UrlUtils urlUtils = new UrlUtils();

  Future<dynamic> getData_ (HashMap<String, String> requestData, var url) async {
    Map<String, String> headers = new Map<String, String>();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print(sharedPreferences.getString("token"));
    headers['authT'] = sharedPreferences.getString("token");

    final finalurl = SchoolUtils().baseUrl + url + "?homework_sync_time=0";
    var response = await http.get(finalurl , headers: headers);
    if(response.statusCode == 200){
      var str = response.body;
      final data = json.decode(response.body);
      return data;
    }
  }


  /**
   * webservice to add homework to server
   * Generic model is class which contain generic fields of exam
   */
  Future<Map<String, dynamic>> addOrUpdateHomework (HomeWork homeWork) async {
    print("in webservice");
    String authToken = await urlUtils.getAuthToken();

    Map<String, String> headers = new Map<String, String>();
    headers['authT'] = authToken;

    Map<String, String> HWMap = getHWFrom(homeWork);
    final finalurl =  urlUtils.getAddHWUrl();
    Response response = await post(finalurl, headers: headers, body: HWMap);
    var data;

    if(response.statusCode == 200){
      data = json.decode(response.body);
      print(data);
    }
    return data;
  }

  /**
   * webservice to add homework to server
   * Generic model is class which contain generic fields of exam
   */
  Future<Map<String, dynamic>> updateHomework (HomeWork homeWork) async {
    print("in webservice");
    String authToken = await urlUtils.getAuthToken();

    Map<String, String> headers = new Map<String, String>();
    headers['authT'] = authToken;

    Map<String, String> HWMap = getHWFrom(homeWork);
    final finalurl =  urlUtils.getAddHWUrl();
    Response response = await post(finalurl, headers: headers, body: HWMap);
    var data;

    if(response.statusCode == 200){
      data = json.decode(response.body);
      print(data);
    }
    return data;
  }

  // Prepare exam map from generic model
  Map<String, String> getHWFrom(HomeWork homework) {
    Map<String,String> HWObjectmap = new HashMap();

    if (homework.serverId != null) {
      HWObjectmap["id"] = homework.serverId.toString();
    }
    if (homework.title != null) {
      HWObjectmap["name"] = homework.title;
    }
    if (homework.type != null) {
      HWObjectmap["type"] = homework.type;
    }

    if(homework.mark != null) {
    HWObjectmap["mark"] = homework.mark.toString();
    }
   /* if(homework.classId != null) {
      HWObjectmap["standard"] = homework.classId.toString ( );
     // HWObjectmap["standard"] = 1.toString ( );
    }*/
    if(homework.subIds != null) {
      String commaSeperate = SchoolUtils.getCommaSeparated(homework.subIds);
      HWObjectmap["subject"] = commaSeperate;
    }
    if(homework.startDate != null) {
      HWObjectmap["startDate"] = homework.startDate.toString();
    }
    if(homework.endDate != null) {
      HWObjectmap["submitDate"] = homework.endDate.toString();
    }
    if(homework.owner != null) {
      HWObjectmap["owner"] = homework.owner.toString();
    }
    if(homework.description != null) {
      HWObjectmap["description"] = homework.description;
    }
    return HWObjectmap;
  }


   getAccessToken () async {
    print("in webservice");
    String authToken = await urlUtils.getAuthToken();
    Map<String, String> headers = new Map<String, String>();
    headers['authT'] = authToken;
    final finalurl =  SchoolUtils().baseUrl + "rest/homework/getAccessToken";
    Response response = await get(finalurl, headers: headers);
    var data;
    if(response.statusCode == 200){
      data = json.decode(response.body);
      print(data);
    }
    return data;
  }

}