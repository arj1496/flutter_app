
import 'package:flutter_app/src/mo/TimeTable/TimeTable.dart';
import 'package:flutter_app/src/mo/TimeTable/TimeTableDao.dart';

class TimeTableService{

  TimeTableDao timeTableDao = new TimeTableDao();

  List<TimeTable> getTimeTablesObjectFromResponseDynamic(List<dynamic> timeTablesDynamic) {
    List<TimeTable> timeTableList = List.generate(timeTablesDynamic.length, (i){
      TimeTable timeTable = TimeTable.fromJsonServer(timeTablesDynamic[i]);
      return timeTable;
    });
    return timeTableList;
  }

  batchAddTimeTables(List<TimeTable> addTimeTableList) async{
    await timeTableDao.batchAddTimeTables(addTimeTableList);
  }

  batchDeleteTimeTables(List<TimeTable> deletedTimeTableList) async{
    await timeTableDao.batchDeleteTimeTables(deletedTimeTableList);
  }

  syncCallBackHandle(Map<String, dynamic> syncDataResponse) async {
    List<dynamic> timeTablesDynamic = syncDataResponse['timeTables'];
    if(timeTablesDynamic != null && timeTablesDynamic.length > 0){
      List<TimeTable> addTimeTableList = getTimeTablesObjectFromResponseDynamic(timeTablesDynamic);
      if(addTimeTableList != null && addTimeTableList.length > 0){
        await batchAddTimeTables(addTimeTableList);
      }
    }
    List<dynamic> deletedTimeTablesDynamic = syncDataResponse['deletedTimeTables'];
    if(deletedTimeTablesDynamic != null && deletedTimeTablesDynamic.length > 0){
      List<TimeTable> deletedTimeTableList = getTimeTablesObjectFromResponseDynamic(deletedTimeTablesDynamic);
      if(deletedTimeTableList != null && deletedTimeTableList.length > 0){
        await batchDeleteTimeTables(deletedTimeTableList);
      }
    }
  }

}