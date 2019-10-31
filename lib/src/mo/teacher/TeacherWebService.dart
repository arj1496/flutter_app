
import 'dart:collection';
import 'dart:convert';

import 'package:flutter_app/src/fr/SchoolUtils.dart';
import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:flutter_app/src/mo/teacher/Teacher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../UrlUtils.dart';

class TeacherWebService{
  UrlUtils urlUtils = new UrlUtils();

  Future<dynamic> getData_ (HashMap<String, String> requestData, var url) async {
    Map<String, String> headers = new Map<String, String>();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print(sharedPreferences.getString("token"));
    headers['authT'] = sharedPreferences.getString("token");

    final finalurl = SchoolUtils().baseUrl + url + "?teacher_sync_time=0";
    var response = await http.get(finalurl , headers: headers);
    if(response.statusCode == 200){
      var str = response.body;
      final data = json.decode(response.body);
      return data;
    }
  }

  Future<Map<String, dynamic>> addOrUpdateTeacher (GenericModel genericModel) async {
    print("in webservice");
    String authToken = await urlUtils.getAuthToken();

    Map<String, String> headers = new Map<String, String>();
    headers['authT'] = authToken;

    Map<String, String> teacherMap = getTeacherForm(genericModel);
    final finalurl =  urlUtils.getAddTeacher();
    http.Response response = await http.post(finalurl, headers: headers, body: teacherMap);
    //var json = json.decode();
    print("teacher =${response}");
    var data;
    if(response.statusCode == 200){
      data = json.decode(response.body);
      print(data);
    }
    return data;
  }

  Map<String, String> getTeacherForm(GenericModel genericModel) {
    Map<String,String> teacherObjectmap = new HashMap();
    if(genericModel.firstName != null) {
      teacherObjectmap["firstName"]=genericModel.firstName;
      }
    if(genericModel.lastName != null) {
      teacherObjectmap["lastName"]=genericModel.lastName;
    }
    if(genericModel.email != null) {
      teacherObjectmap["email"]=genericModel.email;
    }
    if(genericModel.mobileNumber != null) {
      teacherObjectmap["mobileNumber"]=genericModel.mobileNumber;
    }
    if(genericModel.gender != null) {
      teacherObjectmap["gender"]=genericModel.gender;

    }
    if(genericModel.academicType != null) {
      teacherObjectmap["type"]=genericModel.academicType.toString();
    }

    return teacherObjectmap;

  }


}