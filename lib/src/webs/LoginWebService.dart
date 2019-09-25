
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/fr/SchoolUtils.dart';
import 'package:http/http.dart' as http;

class LoginWebService{


  void doLogin() async {

    var loginUrl = SchoolUtils().baseUrl + "/rest/auth/login";

    Map<String, String> headers = new Map<String, String>();

    headers['email'] = "dp.dev3@gmail.com";
    headers['pass'] = "demo@kkpp";
    headers['scode'] = "demo";
    headers['authT'] = "mobileapp";

     var response = await http.post(loginUrl, headers:headers);

     if(response.statusCode == 200){
       Map<String, dynamic> loginData = jsonDecode(response.body);
     }




  }


}