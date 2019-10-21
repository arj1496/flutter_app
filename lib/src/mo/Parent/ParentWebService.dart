
import 'dart:collection';
import 'dart:convert';

import 'package:flutter_app/src/fr/SchoolUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ParentWebService{

  Future<dynamic> getData_ (HashMap<String, String> requestData, var url) async {
    Map<String, String> headers = new Map<String, String>();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print(sharedPreferences.getString("token"));
    headers['authT'] = sharedPreferences.getString("token");

    final finalurl = SchoolUtils().baseUrl + url + "?parent_sync_time=0";
    var response = await http.get(finalurl , headers: headers);
    if(response.statusCode == 200){
      var str = response.body;
      final data = json.decode(response.body);
      return data;
    }
  }

}