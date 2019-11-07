import 'dart:collection';
import 'dart:convert';
import 'dart:core' as prefix0;
import 'dart:core';
import 'package:flutter_app/UrlUtils.dart';
import 'package:flutter_app/src/fr/SchoolUtils.dart';
import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'Exam.dart';

class ExamWebService{
  UrlUtils urlUtils = new UrlUtils();

  Future<dynamic> getData_ (HashMap<String, String> requestData, var url) async {
    Map<String, String> headers = new Map<String, String>();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print(sharedPreferences.getString("token"));
    headers['authT'] = sharedPreferences.getString("token");

    final finalurl = SchoolUtils().baseUrl + url + "?exam_sync_time=0";
    var response = await http.get(finalurl , headers: headers);
    if(response.statusCode == 200){
      var str = response.body;
      final data = json.decode(response.body);
      return data;
    }
  }


  /**
   * webservice to add exam to server
   * Generic model is class which contain generic fields of exam
   */
  Future<Map<String, dynamic>> addOrUpdateExam (GenericModel examGenericModel) async {
    print("in webservice");
    String authToken = await urlUtils.getAuthToken();

    Map<String, String> headers = new Map<String, String>();
    headers['authT'] = authToken;

    Map<String, String> examMap = getExamFrom(examGenericModel);
    final finalurl =  urlUtils.getExamAddUrl();
    Response response = await post(finalurl, headers: headers, body: examMap);
    var data;

    if(response.statusCode == 200){
      data = json.decode(response.body);
      print(data);
    }
    return data;
  }

  // Prepare exam map from generic model
  Map<String, String> getExamFrom(GenericModel exam) {
    Map<String,String> examObjectmap = new HashMap();

    if (exam.examId != null) {
      examObjectmap["id"] = exam.examId.toString();
    }
    if (exam.title != null) {
      examObjectmap["name"] = exam.title;
    }
    if (exam.examType != null) {
      examObjectmap["examTypeId"] = 1.toString();
    }
    if (exam.syllabus != null) {
      examObjectmap["syllabus"] = exam.syllabus;
    }
   //if(exam.totalMarks != null) {
      examObjectmap["totalMark"] = 23.toString();

   //}
    if(exam.classId != null) {
      examObjectmap["standard"] = exam.classId.toString ( );
    }
    if(exam.subjectId != null) {
      examObjectmap["subject"] = exam.subjectId.toString();
    }
    if(exam.date != null) {
      examObjectmap["examDate"] = exam.date.toString();
    }
    if(exam.status != null){
      examObjectmap["status"] = exam.status;
    }

    if (exam.description != null) {
      examObjectmap["description"] = exam.description;
    }
return examObjectmap;
  }

}