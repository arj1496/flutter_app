
import 'package:flutter_app/src/mo/Attendance/Attendance.dart';
import 'package:flutter_app/src/mo/Attendance/AttendanceService.dart';
import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Standard/StandardService.dart';

class AttendanceActivity
{
  StandardService standardService = new StandardService();
  Future<List<Standard>> getStandardListFromLocalDB() async{
    List<Standard> standardListFromFuture = await standardService.getStandardListFromLocalDB();
    return standardListFromFuture;
  }

}