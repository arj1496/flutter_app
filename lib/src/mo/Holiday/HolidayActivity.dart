import 'dart:async';

import 'package:flutter_app/src/mo/Holiday/Holiday.dart';
import 'package:flutter_app/src/mo/Holiday/HolidayService.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';

enum HolydaySelectionType {
  school,
  teacher,
  importantDays,
}


class HolidayActivity {
  HolidayService holidayService = new HolidayService();

  Stream<Map<String, List<Holiday>>> get allHoliday => _holidaylist.stream;
  Map<String, List<Holiday>> _holiday;
  //List<Holiday> holydays;

  Sink<HolydaySelectionType> get holydayselectiontype =>
      _holydaySelectiontypeController.sink;

  final _holydaySelectiontypeController =
      StreamController<HolydaySelectionType>();

  HolidayActivity() {
    // _holiday = getDbHoliday();
    //_holidaylist.add(_holiday);

    getHolidaysMainList();
  //getHolidaysPastList();

    _holydaySelectiontypeController.stream.listen((holydayselectiontype) {
      if (holydayselectiontype == HolydaySelectionType.school) {
        _holidaylist.add(getschool());
      } else if (holydayselectiontype == HolydaySelectionType.teacher) {
        _holidaylist.add(getteacher());
      } else {
        _holidaylist.add(Importantdays());
      }
    });
  }

  Future<Map<String, List<Holiday>>> getHolidaysMainList() {
    Future<List<Holiday>> holidayListFromFuture = holidayService.getDbHolyday();
    //List<Holiday> holydasys;
    holidayListFromFuture.then((value) async {
      List<Holiday> holidayListFromFuture1 =
          await holidayService.getDbHolyday();

      Map<String, List<Holiday>> seperatedMap = sepratedHoliday(holidayListFromFuture1);
      _holidaylist.add(seperatedMap);
      // sepretedMap[monthKey] = _holidaylist as List<Holiday>;



      return seperatedMap;
    });
  }


  final _holidaylist = BehaviorSubject<Map<String, List<Holiday>>>();

// HolidayService holidayService = new HolidayService( );

/*Future<Map<String, List<Holiday>>> getDbHoliday() async {
    List<Holiday> holidayListFromFuture = await holidayService.getDbHolyday( );
    // holidayListFromFuture.sort( (a, b) =>
    // b.startDate.compareTo( a.startDate ) );
    Map<String, List<Holiday>> seperatedMap = sepratedHoliday(
        holidayListFromFuture );
    return seperatedMap;
  }*/


  Map<String, List<Holiday>> sepratedHoliday(List<Holiday> holyDays) {
    Map<String, List<Holiday>> sepretedMap = new Map();
    String upcoming="Upcoming Holydays";
    String past="Past Holydays";
    for (Holiday holyday in holyDays) {
      DateTime month = DateTime.fromMillisecondsSinceEpoch(holyday.startDate);
      DateFormat month_date = new DateFormat("MMMM");
      var currentmonth = DateTime.now();
      String month_name = month_date.format(month);
      String monthKey = month_name + " " + month.year.toString();

      // var currnt=int.parse(currentmonth.toString());
      // var month1=int.parse(month.toString());

      if (month.compareTo(currentmonth) >= 0) {
        //int homeworkTime = holyday.startDate;
        if (sepretedMap[upcoming] == null) {
          List<Holiday> newHD = new List();
          newHD.add(holyday);
          sepretedMap[upcoming] = newHD;
        } else {
          List<Holiday> newHD1 = sepretedMap[upcoming];
          newHD1.add(holyday);
          sepretedMap[upcoming] = newHD1;
        }
      }

      if (month.compareTo(currentmonth) <= 0) {
        //int homeworkTime = holyday.startDate;
        if (sepretedMap[past] == null) {
          List<Holiday> newHD = new List();
          newHD.add(holyday);
          sepretedMap[past] = newHD;
        } else {
          List<Holiday> newHD1 = sepretedMap[past];
          newHD1.add(holyday);
          sepretedMap[past] = newHD1;
        }
      }

    }


    return sepretedMap;
  }

  addHolidayToServer( Holiday holiday , callBack ) async {
    print ( "in hwactivity" );
    holidayService.addHD ( holiday ).then ( ( value ) {
      callBack ( );
    } );
    /* int examObject = await examService.addOrUpdateExam(genericModel);
    return examObject;*/
  }
}

Map<String, List<Holiday>> getschool()
{
  Map<String, List<Holiday>> sepretedMap = new Map();
  String holydaykey = HolydaySelectionType.school.toString();

    List<Holiday> list = new List();
    Holiday holiday1 = new Holiday();
    holiday1.name = "15 August";
    holiday1.startDate = 1574241975;
    holiday1.endDate = 1574241975;
    holiday1.type = "Vacation";
  //  sepretedMap[holydaykey] = list;

   // List<Holiday> list = new List();
    Holiday holiday2 = new Holiday();
    holiday2.name = "holi";
    holiday2.startDate = 1574241975;
    holiday2.endDate = 1574241975;
    holiday2.type = "Vacation";
    list.add(holiday1);
    list.add(holiday2) ;
    sepretedMap[holydaykey] = list;

  return sepretedMap;
}

Map<String, List<Holiday>> getteacher() {
  Map<String, List<Holiday>> sepretedMap = new Map();
  String holydaykey = HolydaySelectionType.school.toString();

  List<Holiday> list = new List();
  Holiday holiday1 = new Holiday();
  holiday1.name = "Independance day";
  holiday1.startDate = 1574241975;
  holiday1.endDate = 1574241975;
  holiday1.type = "Vacation";
  //  sepretedMap[holydaykey] = list;

  // List<Holiday> list = new List();
  Holiday holiday2 = new Holiday();
  holiday2.name = "Diwali";
  holiday2.startDate = 1574241975;
  holiday2.endDate = 1574241975;
  holiday2.type = "Vacation";
  list.add(holiday1);
  list.add(holiday2) ;
  sepretedMap[holydaykey] = list;

  return sepretedMap;
}

Map<String, List<Holiday>> Importantdays() {
  Map<String, List<Holiday>> sepretedMap = new Map();
  String holydaykey = HolydaySelectionType.school.toString();

  List<Holiday> list = new List();
  Holiday holiday1 = new Holiday();
  holiday1.name = "Dashera";
  holiday1.startDate = 1574241975;
  holiday1.endDate = 1574241975;
  holiday1.type = "Vacation";
  //  sepretedMap[holydaykey] = list;

  // List<Holiday> list = new List();
  Holiday holiday2 = new Holiday();
  holiday2.name = "Kathikapornima";
  holiday2.startDate = 1574241975;
  holiday2.endDate = 1574241975;
  holiday2.type = "Vacation";
  list.add(holiday1);
  list.add(holiday2) ;
  sepretedMap[holydaykey] = list;

  return sepretedMap;

}



