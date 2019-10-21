
import 'package:flutter_app/src/mo/Parent/ParentService.dart';
import 'package:flutter_app/src/mo/Standard/StandardService.dart';
import 'package:flutter_app/src/mo/Student/StudentService.dart';
import 'package:flutter_app/src/mo/Subject/SubjectService.dart';
import 'package:flutter_app/src/mo/Synchronization/SyncWebService.dart';
import 'package:flutter_app/src/mo/teacher/TeacherService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SyncService{

  SyncWebService syncWebService = new SyncWebService();
  StandardService standardService = new StandardService();
  SubjectService subjectService = new SubjectService();
  TeacherServcie teacherService = new TeacherServcie();
  StudentService studentService = new StudentService();
  ParentService parentService = new ParentService();

  List<String> getSyncParameters(){

    List<String> parameters = new List();
    parameters.add("standard_sync_time");
    parameters.add("subject_sync_time");
    parameters.add("teacher_sync_time");
    parameters.add("student_sync_time");
    parameters.add("parent_sync_time");

    return parameters;
  }

  Future<Map<String, String>> prepareSyncParameterMap(List<String> parameters) async {

    Map<String, String> syncParameterMap = new Map();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(parameters != null && parameters.length > 0){
      for(int i = 0; i < parameters.length; i++){
        String parameterKey = parameters[i];
        if(parameterKey.isNotEmpty){
          String timeStampOfParameter = sharedPreferences.getString(parameterKey);
          if(timeStampOfParameter != null && timeStampOfParameter.isNotEmpty){
            print(timeStampOfParameter);
            syncParameterMap[parameterKey] = timeStampOfParameter;
          }else{
            syncParameterMap[parameterKey] = '0';
          }
        }
      }
    }
    return syncParameterMap;
  }

  firstTimeSync(){

  }

  regularLightSync() async{
    List<String> syncParameters = getSyncParameters();
    Map<String, String> syncParameterMap = await prepareSyncParameterMap(syncParameters);

    Map<String, dynamic> syncDataResponse = await syncWebService.getSyncDataFromServer(syncParameterMap);

    if(syncDataResponse !=  null){
      if(syncDataResponse['status']){
        processForResult(syncDataResponse);
      }else{
        print("Sync is false");
      }
    }
  }

  regularMediumSync(){

  }

  regularHighSync(){

  }

  void processForResult(Map<String, dynamic> syncDataResponse) async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int todayDate = DateTime.now().millisecondsSinceEpoch;
    print(todayDate);

    if(syncDataResponse.containsKey('isStandardSync')){
      if(syncDataResponse['isStandardSync']){
        print("isStandardSync");
        await standardService.syncCallBackHandle(syncDataResponse);
        sharedPreferences.setString("standard_sync_time", todayDate.toString());
      }
    }

    if(syncDataResponse.containsKey('isSubjectSync')){
      if(syncDataResponse['isSubjectSync']){
        print("isSubjectSync");
        await subjectService.syncCallBackHandle(syncDataResponse);
        sharedPreferences.setString("subject_sync_time", todayDate.toString());
      }
    }

    if(syncDataResponse.containsKey('isTeacherSync')){
      if(syncDataResponse['isTeacherSync']){
        print("isTeacherSync");
        await teacherService.syncCallBackHandle(syncDataResponse);
        sharedPreferences.setString("teacher_sync_time", todayDate.toString());
      }
    }

    if(syncDataResponse.containsKey('isStudentSync')){
      if(syncDataResponse['isStudentSync']){
        print("isStudentSync");
        await studentService.syncCallBackHandle(syncDataResponse);
        sharedPreferences.setString("student_sync_time", todayDate.toString());
      }
    }

    if(syncDataResponse.containsKey('isParentSync')){
      if(syncDataResponse['isParentSync']){
        print("isParentSync");
        await parentService.syncCallBackHandle(syncDataResponse);
        sharedPreferences.setString("parent_sync_time", todayDate.toString());
      }
    }
  }









}