import 'dart:collection';
import 'dart:convert';

import 'package:flutter_app/UrlUtils.dart';
import 'package:flutter_app/src/fr/SchoolUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class WebViewActivity {

  UrlUtils urlUtils = new UrlUtils();

  Future<dynamic> getData(HashMap<String, String> requestData, var url) async {
    Map<String, String> headers = new Map<String, String>();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print(sharedPreferences.getString("token"));
    headers['authT'] = sharedPreferences.getString("token");

    var response = await http.get(url , headers: headers);
    if(response.statusCode == 200){
      var str = response.body;
      final  data= json.decode(response.body);
      return data;
    }
  }


}