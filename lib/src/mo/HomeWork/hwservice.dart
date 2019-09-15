import 'package:flutter_app/src/mo/HomeWork/HomeWork.dart';

class HWService{

  List<HomeWork> getAllHomeWork(){

    List<HomeWork> hwList = new List();
    for(var i = 0 ; i < 1000; i++){

      HomeWork hw = new HomeWork();

      hw.dbId = i;
      hw.serverId = i;
      hw.classId = i;
      hw.title = "Hw Title:-  " + i.toString();
      hw.className  = "Class_ " + i.toString() ;
      hw.subjectId = i;
      hw.subjectName = "Subject_ " + i.toString();
      hw.teacherId = i;
      hw.teacherName = "Teacher_" + i.toString();
      hw.startDate = DateTime.parse("2019-07-20");
      hw.endDate = DateTime.parse("2019-07-22");

      hwList.add(hw);

    }

    return hwList;


  }


}