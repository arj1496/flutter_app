import 'package:flutter_app/src/mo/HomeWork/HWList.dart' as prefix0;
import 'package:flutter_app/src/mo/HomeWork/HomeWork.dart';
import 'package:flutter_app/src/mo/HomeWork/HomeworkDao.dart';
import 'package:flutter_app/src/mo/HomeWork/HomeworkWebservice.dart';
import 'package:flutter_app/src/mo/Subject/Subject.dart';
import 'package:flutter_app/src/mo/Subject/SubjectDao.dart';
import 'package:flutter_app/src/mo/Subject/SubjectService.dart';

class HomeworkService{

  HomeworkDao homeworkDao = new HomeworkDao();
  SubjectService subjectService = new SubjectService();
  HomeworkWebService homeworkWebService = new HomeworkWebService();
  List<HomeWork> getAllHomeWork(){

    List<HomeWork> hwList = new List();
    for(var i = 1 ; i < 10; i++){

      HomeWork hw = new HomeWork();

      hw.dbId = i;
      hw.serverId = i;
      hw.classId = i;
      hw.title = "Hw Title:-  " + i.toString();
      hw.className  = "Class_ " + i.toString() ;
      hw.subjectId = i;
      hw.subjectName = "Subject_ " + i.toString();
      hw.teacherId = i;
      hw.owner = "Teacher_" + i.toString();
      hw.startDate = 1572875466;
      hw.endDate = 1572875466;

      hwList.add(hw);

    }
    return hwList;
  }
  syncCallBackHandle(Map<String, dynamic> syncDataResponse) async {
    List<dynamic> HWDynamic = syncDataResponse['homeworks'];
    if(HWDynamic != null && HWDynamic.length > 0){
      List<HomeWork> HWList = List.generate(HWDynamic.length, (i){
        HomeWork homeWork = HomeWork.fromJson(HWDynamic[i]);
        return homeWork;
      });
      await batchAddHW(HWList);
    }

  }

  batchAddHW(List<HomeWork> HWList){
    homeworkDao.batchAddHomework(HWList);
  }

  Future<List<HomeWork>>  getLocalDbHomework() async{
    List<HomeWork> HWListFromFuture = await homeworkDao.getAllHomeworkDataFromLocalDB();
    return HWListFromFuture;
  }

  Future<List<Subject>>  getAccesibleSubjectList() async{
    List<Subject> subjectList = await subjectService.getAccesibleSubjectList();
    return subjectList;
  }

  // call webservice to add exam to server.
  Future<int> addOrUpdateHW(HomeWork homeWork) async{
    Map<String, dynamic> HWData = await homeworkWebService.addOrUpdateHomework(homeWork);
    // if the response is true and the examId is present allredy update that exam otherwise add that exam to local database
    if(HWData['status']){
      List<dynamic> HWDynamic = HWData['homework'];
      if(HWDynamic != null && HWDynamic.length > 0){
        List<HomeWork> HWList = List.generate(HWDynamic.length, (i){
          HomeWork homeWork = HomeWork.fromJson(HWDynamic[i]);
          return homeWork;
        });
        await batchAddHW(HWList);
      }
    }else{
      print('Homework Add False');
    }
    return null;
  }

  Future<int> updateHW(HomeWork homeWork) async{
    Map<String, dynamic> HWData = await homeworkWebService.updateHomework(homeWork);
    // if the response is true and the examId is present allredy update that exam otherwise add that exam to local database
    if(HWData['status']){
      List<dynamic> HWDynamic = HWData['homework'];
      if(HWDynamic != null && HWDynamic.length > 0){
        List<HomeWork> HWList = List.generate(HWDynamic.length, (i){
          HomeWork homeWork = HomeWork.fromJson(HWDynamic[i]);
          return homeWork;
        });
        await homeworkDao.updateHomework(HWList[0]);
      }

    }else{
      print('Homework Add False');
    }
    return null;
  }
}