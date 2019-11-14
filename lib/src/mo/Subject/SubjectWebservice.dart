
import 'dart:collection';
import 'dart:convert';
import 'package:flutter_app/src/fr/SchoolUtils.dart';
import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Subject/Subject.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SubjectWebService{

  Future<dynamic> getData_ (HashMap<String, String> requestData, var url) async {
    Map<String, String> headers = new Map<String, String>();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print(sharedPreferences.getString("token"));
    headers['authT'] = sharedPreferences.getString("token");

    final finalurl = SchoolUtils().baseUrl + url + "?subject_sync_time=0";
    var response = await http.get(finalurl , headers: headers);
    if(response.statusCode == 200){
      var str = response.body;
      final data = json.decode(response.body);
      return data;
    }
  }

  Future<Map<String, dynamic>> addSubjectInServer(Subject subject) async{
    Map<String, String> headers = new Map<String, String>();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print(sharedPreferences.getString("token"));
    headers['authT'] = sharedPreferences.getString("token");


    var test1 = json.encode(subject);
    Map<String, String> subDetailMap = new Map<String, String>();
    subDetailMap['subjectjsonString'] = test1;

    final finalurl = SchoolUtils().baseUrl + "rest/subject/addOrUpdateSubject";
    var response = await http.post(finalurl, headers: headers, body: subDetailMap);
    if(response.statusCode == 200){
      var str = response.body;
      //final data = json.decode(response.body);
      Map<String, dynamic> data = new Map<String, dynamic>();
      data['status'] = true;
      subject.id = 10001;
      data['subject'] = getSubjectJson(subject);
      return data;
    }
    return null;
  }



  getSubjectJson(Subject subject) {
    Map<String, dynamic> data = Map<String, dynamic>();

    data["id"] = subject.id;
      data["name"] = subject.name;
     data["standardId"] = subject.standardId;
      data["isAccess"] = subject.isAccess;
      data["color"] = subject.color;
      data["isOptional"] = subject.isOptional;
      data["optionalStudentIds"] = subject.optionalStudentIds;
      data["teacherIds"] = subject.teacherIds;
       Map<String, dynamic> standdard = Map<String, dynamic>();
       standdard['id'] = subject.standardId;
      data["standard"] = standdard;
      return data;
  }

}