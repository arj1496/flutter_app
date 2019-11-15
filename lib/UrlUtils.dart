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
  String getEventAddUrl(){
    String url = SchoolUtils().baseUrl + "rest/event/addOrUpdate_";
    return url;
  }

  String getNewsFeedUrl(){
    String url = SchoolUtils().baseUrl + "rest/webviewpage/getwebview";
    return url;
  }

  String getStudentAddUrl(){
    String url = SchoolUtils().baseUrl + "rest/student/savestudent";
    return url;
  }

  String getAddTeacher(){
    String url = SchoolUtils().baseUrl + "rest/teacher/addOrUpdateTeacher";
    return url;

  }

  String getAddHWUrl(){
    String url = SchoolUtils().baseUrl + "rest/homework/addOrUpdateHomeWork_";
    return url;
  }
  String getUpdateHWUrl(){
    String url = SchoolUtils().baseUrl + "rest/homework/addOrUpdateHomeWork";
    return url;

  }
}
