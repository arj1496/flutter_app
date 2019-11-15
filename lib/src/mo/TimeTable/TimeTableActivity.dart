
import 'package:flutter_app/src/mo/TimeTable/TimeTable.dart';
import 'package:flutter_app/src/mo/TimeTable/TimeTableService.dart';

class TimeTableActivity{

  TimeTableService timeTableService = new TimeTableService();

  Future<List<TimeTable>> getTimetableListFromLocalDb() async{
    return timeTableService.getTimetableListFromLocalDb();
  }
  
}