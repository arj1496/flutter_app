import 'package:flutter_app/src/fr/SchoolUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UrlUtils{

  Future<String> getAuthToken() async {

    SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance ( );
    print ( sharedPreferences.getString ( "token" ) );
    String authT  = sharedPreferences.getString ( "token" );
    return authT;
  }

  String getExamAddUrl(){
    String url = SchoolUtils().baseUrl + "rest/exam/addOrUpdateExam";
    return url;
}
}
