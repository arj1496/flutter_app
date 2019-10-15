
import 'dart:collection';
import 'dart:convert';
import 'dart:core' as prefix0;
import 'dart:core';
import 'dart:io';
import 'package:flutter_app/UrlUtils.dart';
import 'package:flutter_app/src/fr/SchoolUtils.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'Exam.dart';

class ExamWebService{
  UrlUtils urlUtils = new UrlUtils();
  Future<dynamic> addOrUpdateExam (Exam exam) async {
    print("in webservice");
     String authToken = await urlUtils.getAuthToken();

      Map<String, String> headers = new Map<String, String>();
      headers['authT'] = authToken;

    Map<String, String> examMap = getExamFrom(exam);



    final finalurl =  urlUtils.getExamAddUrl();
        Response response = await post(finalurl, headers: headers, body: examMap);
        if(response.statusCode == 200){
          var str = response.body;
          print(str);
          final data = json.decode(response.body);
          return data;
        }
        int statusCode = response.statusCode;
        print(statusCode);
  }

  Map<String, String> getExamFrom(Exam exam) {
    Map<String,String> examObjectmap = new HashMap();

    if (exam.name != null) {
      examObjectmap["name"] = exam.name;
    }

    /*if (exam.examType != null) {
      examObjectmap["examTypeId"] = exam.examType;
    }*/
    if (exam.syllabus != null) {
      examObjectmap["syllabus"] = exam.syllabus;
    }
    if(exam.totalMark != null) {
      examObjectmap["totalMark"] = exam.totalMark.toString();
    }
    if(exam.standardId != null) {
      examObjectmap["standard"] = exam.standardId.toString ( );
    }
    if(exam.subjectId != null) {
      examObjectmap["subject"] = exam.subjectId.toString();
    }
    if(exam.examDate != null) {
      examObjectmap["examDate"] = exam.examDate.toString();
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