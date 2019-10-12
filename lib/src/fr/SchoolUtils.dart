
import 'package:date_format/date_format.dart';

class SchoolUtils {

  static final SchoolUtils _schoolUtils = new SchoolUtils._internal();

  factory SchoolUtils() {
    return _schoolUtils;
  }

  //String baseUrl = "https://educloud.in";
  String baseUrl = "http://192.168.0.100:8080/soms/";

  SchoolUtils._internal(){


  }

  Future<int> initApp() async{
   final result = await Future.delayed(const Duration(milliseconds: 5000), (){
      return Future.value(1);
    });

    return result;
  }

  String getDateStringFromLongWithSchoolTimeZone(int dateLong){

    //var  todayDate = DateTime.fromMicrosecondsSinceEpoch(dateLong,isUtc: true);
    var  todayDate = DateTime.fromMillisecondsSinceEpoch(dateLong,isUtc: false);
    String dateSring = formatDate(todayDate, [dd, ' ', M , ' ', yyyy]);
    //print(dateSring);
    return dateSring;
  }

  String getTimeStringFromLongWithTimeZone (int dateLong){
    var  todayDate = DateTime.fromMillisecondsSinceEpoch(dateLong,isUtc: false);
    String dateSring = formatDate(todayDate,  [ hh, ':', nn, ':', ss, ' ', am]);
    //print(dateSring);
    return dateSring;
  }
  String getDateStringFromLongWithOutSchoolTimeZone(int dateLong){
    return null;
  }
  String getDurationBetweenTwoTimestamp (int startDateLong, int endDateLong){
    var startDate = DateTime.fromMillisecondsSinceEpoch(startDateLong,isUtc: false);
    var endDate = DateTime.fromMillisecondsSinceEpoch(endDateLong,isUtc: false);
    String fullStartDateStr = getDateStringFromLongWithSchoolTimeZone(startDateLong);
    String fullEndDateStr = getDateStringFromLongWithSchoolTimeZone(endDateLong);
    List<String> sDateSplit = fullStartDateStr.split(" ");
    List<String> eDateSplit = fullEndDateStr.split(" ");
    String sdate = sDateSplit[0];
    String edate = eDateSplit[0];
    if(sdate == edate){
      return durationToStringForSameDay(endDate.difference(startDate).inMinutes);
    }else{
      return durationToStringForDiffDay(startDate,endDate);
    }
 //   return sdate.compareTo(edate) == true ? durationToStringForSameDay(endDate.difference(startDate).inMinutes) : durationToStringForDiffDay(startDate,endDate);

  }

  String durationToStringForSameDay(int value) {
    final int hour = value ~/ 60;
    final int minutes = value % 60;
    return '${hour.toString().padLeft(2, "0")} : ${minutes.toString().padLeft(2, "0")} Hrs';
  }

  String durationToStringForDiffDay(var  sLong,var eLong){
    String days = eLong.difference(sLong).inDays.toString();
    String daysStr = days + " Day(s)";
    return daysStr;

  }
}


