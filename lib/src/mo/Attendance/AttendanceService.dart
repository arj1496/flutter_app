
import 'package:flutter_app/src/mo/Attendance/Attendance.dart';
import 'package:flutter_app/src/mo/Attendance/AttendanceDao.dart';

class AttendanceService
{

  AttendanceDao attendanceDao=new AttendanceDao();


  Future<List<Attendance>> getDbAttendance() async{
    List<Attendance> attendanceListFromFuture = await attendanceDao.getDbAttendance();
    return attendanceListFromFuture;
  }



  syncCallBackHandle(Map<String, dynamic> syncDataResponse) async {
    List<dynamic> attendanceDynamic = syncDataResponse['Attendance'];
    if(attendanceDynamic != null && attendanceDynamic.length > 0){
      List<Attendance> AttendanceList = List.generate(attendanceDynamic.length, (i){
        Attendance attendance = Attendance.fromJson(attendanceDynamic[i]);
        return attendance;
      });
      await attendanceDao.batchAddAttendance(AttendanceList);
    }

  }

}