import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter_app/src/fr/SchoolUtils.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class LoginWebService{

  LoginWebService();

  Future<Map<String, dynamic>> doLogin(String email, password, schoolCode) async{

    Map<String, String> headers = new Map<String, String>();
    headers['userid'] = email;
    headers['password'] = password;
    headers['schoolname'] = schoolCode;
    headers['authtype'] = "mup";

    String url = SchoolUtils().baseUrl;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.get(url + "rest/auth/login", headers: headers);
    Map<String, dynamic> jsonData = null;
    if(response.statusCode == 200){
      jsonData = json.decode(response.body);
    }
    return jsonData;
  }

}