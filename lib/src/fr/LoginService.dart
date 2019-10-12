import 'package:flutter_app/src/fr/LoginDAO.dart';
import 'package:flutter_app/src/fr/LoginWebService.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'SharedPreference.dart';

class LoginService {

  Future<Map<String, dynamic>> doLoginWithOTP() async{
    return null;
  }

  Future<Map<String, dynamic>> doLoginWithGoogle() async{
    return null;
  }

  Future<Map<String, dynamic>> doLoginWithUserPassword(Map<String, String> headers) async{

    LoginWebService loginWebService = new LoginWebService();
    LoginDAO loginDAO = new LoginDAO();
    Map<String, dynamic> jsonData = await loginWebService.doLogin(headers);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(jsonData['status']){
      sharedPreferences.setString("token", jsonData['authT']);
      List<SharedPreference> sharedPrefreferenceList = new List();
      jsonData.forEach((key, value){
        print("Key : ${key} || Value : ${value}");
        SharedPreference sharedPreference = SharedPreference.fromJson_(key, value);
        sharedPrefreferenceList.add(sharedPreference);
      });
      print(sharedPrefreferenceList.length);
      loginDAO.batchAddSharedPreference(sharedPrefreferenceList);
    }else{
      var error = jsonData['errorMessage'];
      print(error);
    }
    return jsonData;
  }

  Future<List<SharedPreference>> getSharedPrefrerenceData() async{
    LoginDAO loginDAO = new LoginDAO();
    List<SharedPreference> sharedPreferenceListFuture = await loginDAO.getAllSharedPreferenceData();
    return sharedPreferenceListFuture;
  }



}