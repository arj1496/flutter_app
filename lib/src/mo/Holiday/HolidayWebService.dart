import 'dart:collection';
import 'dart:convert';

import 'package:flutter_app/src/fr/SchoolUtils.dart';
import 'package:flutter_app/src/mo/Holiday/Holiday.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../UrlUtils.dart';

class HolidayWebService
{
  UrlUtils urlUtils = new UrlUtils();

  Future<dynamic> getData_ (HashMap<String, String> requestData, var url) async {
    Map<String, String> headers = new Map<String, String>();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print(sharedPreferences.getString("token"));
    headers['authT'] = sharedPreferences.getString("token");

    final finalurl = SchoolUtils().baseUrl + url + "?holiday_sync_time=0";
    var response = await http.get(finalurl , headers: headers);
    if(response.statusCode == 200){
      var str = response.body;
      final data = json.decode(response.body);
      return data;
    }
  }

  Future<Map<String, dynamic>> addOrUpdateHoliday (Holiday holiday) async {
    print("in webservice");
    String authToken = await urlUtils.getAuthToken();

    Map<String, String> headers = new Map<String, String>();
    headers['authT'] = authToken;

    Map<String, String> HDMap = getHDFrom(holiday);
    final finalurl =  urlUtils.getAddHolidayUrl();
    Response response = await post(finalurl, headers: headers, body: HDMap);
    var data;

    if(response.statusCode == 200){
      data = json.decode(response.body);
      print(data);
    }
    return data;
  }

  Map<String, String> getHDFrom(Holiday holiday) {
    Map<String,String> HDObjectmap = new HashMap();

    if (holiday.serverId != null) {
      HDObjectmap["id"] = holiday.serverId.toString();
    }
    if (holiday.name != null) {
      HDObjectmap["name"] = holiday.name;
    }
    if (holiday.type != null) {
      HDObjectmap["type"] = holiday.type;
    }

    if(holiday.startDate != null) {
      HDObjectmap["startDate"] = holiday.startDate.toString();
    }
    if(holiday.endDate != null) {
      HDObjectmap["submitDate"] = holiday.endDate.toString();
    }

    return HDObjectmap;
  }



}