import 'package:flutter_app/src/mo/HomeWork/HomeWork.dart';
import 'package:flutter_app/src/mo/HomeWork/HomeworkDao.dart';
import 'package:flutter_app/src/mo/HomeWork/HomeworkService.dart';

class HomeworkActivity{

  HomeworkService homeworkService = new HomeworkService();
  Future<List<HomeWork>> getLocalDbHomework() async{
    List<HomeWork> HWListFromFuture = await homeworkService.getLocalDbHomework();
    return HWListFromFuture;
  }

  addHomeworkToServer_( HomeWork homework,callBack) async{
    print("in hwactivity");
    homeworkService.addOrUpdateHW(homework).then((value){
      callBack();
    });
    /* int examObject = await examService.addOrUpdateExam(genericModel);
    return examObject;*/
  }


  updateHomeworkToServer_( HomeWork homework,callBack) async{
    print("in hwactivity");
    homeworkService.updateHW(homework).then((value){
      callBack();
    });
    /* int examObject = await examService.addOrUpdateExam(genericModel);
    return examObject;*/
  }
}
