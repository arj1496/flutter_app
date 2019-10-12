import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter_app/src/fr/SchoolUtils.dart';
import 'package:http/http.dart' as http;

class LoginWebService{

  LoginWebService();

  Future<Map<String, dynamic>> doLogin(Map<String, String> headers) async{

    String url = SchoolUtils().baseUrl;
    var response = await http.get(url + "rest/auth/login", headers: headers);
    Map<String, dynamic> jsonData = null;
    if(response.statusCode == 200){
      jsonData = json.decode(response.body);
    }
    return jsonData;
  }

}