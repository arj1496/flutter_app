
import 'dart:collection';
import 'dart:convert';
import 'package:flutter_app/UrlUtils.dart';
import 'package:flutter_app/src/fr/SchoolUtils.dart';
import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:flutter_app/src/mo/Student/Student.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class StudentWebService{

  UrlUtils urlUtils = new UrlUtils();

  Future<dynamic> getData_ (HashMap<String, String> requestData, var url) async {
    Map<String, String> headers = new Map<String, String>();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print(sharedPreferences.getString("token"));
    headers['authT'] = sharedPreferences.getString("token");

    final finalurl = SchoolUtils().baseUrl + url + "?student_sync_time=0";
    var response = await http.get(finalurl , headers: headers);
    if(response.statusCode == 200){
      var str = response.body;
      final data = json.decode(response.body);
      return data;
    }
  }



  Future<Map<String, dynamic>> addStudent(GenericModel genericModel) async {
    Map<String, String> headers = new Map<String, String>();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print(sharedPreferences.getString("token"));
    headers['authT'] = sharedPreferences.getString("token");

    Map<String, String> studDetailMap = getStudentDetailMap(genericModel);

    final finalurl =  SchoolUtils().baseUrl + "rest/student/savestudent";//SchoolUtils().baseUrl;//
    var response = await http.post(finalurl, headers: headers, body: studDetailMap);
    if(response.statusCode == 200){
      var str = response.body;
      final data = json.decode(response.body);
      return data;
    }
    return null;
  }


  Future<Map<String, dynamic>> updateParentDetailOfStudent(GenericModel genericModel) async{
    Map<String, String> headers = new Map<String, String>();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print(sharedPreferences.getString("token"));
    headers['authT'] = sharedPreferences.getString("token");

    Map<String, String> studDetailMap = getStudentDetailMap(genericModel);
    final finalurl = SchoolUtils().baseUrl + "rest/student/savestudent";
    var response = await http.post(finalurl, headers: headers, body: studDetailMap);
    if(response.statusCode == 200){
      var str = response.body;
      final data = json.decode(response.body);
      return data;
    }
    return null;
  }


  Map<String, String> getStudentDetailMap(GenericModel genericmodel) {
    Map<String, String> StudentDetailMap = new Map<String, String>();
    StudentDetailMap['id'] = genericmodel.studentDBId.toString();
    StudentDetailMap['studentFirstName'] = genericmodel.firstName;
    StudentDetailMap['studMiddleName'] = genericmodel.studMiddleName;
    StudentDetailMap['studentLastName'] = genericmodel.lastName;
    StudentDetailMap['standardId'] = genericmodel.studClass.toString();//8.toString();
    StudentDetailMap['studentId'] = genericmodel.studId;
    StudentDetailMap['studRollNO'] = genericmodel.studRollNO;
    StudentDetailMap['contactNo'] = genericmodel.contactNo;
    StudentDetailMap['studentEmail'] = genericmodel.email;
    StudentDetailMap['faFirstName'] = genericmodel.fatherFirstName;
    StudentDetailMap['faLastName'] = genericmodel.fatherLastName;
    StudentDetailMap['faPhoneNumber'] = genericmodel.fatherContact;
    StudentDetailMap['faEmail'] = genericmodel.fatherEmail;
    StudentDetailMap['moFirstName'] = genericmodel.moherFirstName;
    StudentDetailMap['moLastName'] = genericmodel.motherLastName;
    StudentDetailMap['moPhoneNumber'] = genericmodel.motherContact;
    StudentDetailMap['moEmail'] = genericmodel.motherEmail;

    return StudentDetailMap;
  }

}