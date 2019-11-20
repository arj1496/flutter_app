import 'package:flutter_app/src/mo/Holiday/Holiday.dart';
import 'package:flutter_app/src/mo/Holiday/HolidayService.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';




class HolidayBloc1 {

  Stream<List<Holiday>> get allHoliday => _holidaylist.stream;
  List<Holiday> _holiday;

  HolidayBloc1() {
    // _holiday = getDbHoliday();
    // _holidaylist.add(_holiday);

    Future<List<Holiday>> holidayListFromFuture = holidayService
        .getDbHolyday( );

    holidayListFromFuture.then( (value) {
      _holiday = value;
      _holidaylist.add( _holiday );
    } );
  }

  final _holidaylist = BehaviorSubject<List<Holiday>>( );


  HolidayService holidayService = new HolidayService( );

  Future<Map<String, List<Holiday>>> getDbHoliday() async {
    List<Holiday> holidayListFromFuture = await holidayService.getDbHolyday( );
    // holidayListFromFuture.sort( (a, b) =>
    // b.startDate.compareTo( a.startDate ) );
    Map<String, List<Holiday>> seperatedMap = sepratedHoliday(
        holidayListFromFuture );
    return seperatedMap;
  }

  Map<String, List<Holiday>> sepratedHoliday(List<Holiday> holyDays) {
    Map<String, List<Holiday>> sepretedMap = new Map( );


    for (Holiday holyday in holyDays) {
      DateTime month = DateTime.fromMillisecondsSinceEpoch( holyday.startDate );
      DateFormat month_date = new DateFormat( "MMMM" );
      var currentmonth = DateTime.now( );
      String month_name = month_date.format( month );
      String monthKey = month_name + " " + month.year.toString( );

      // var currnt=int.parse(currentmonth.toString());
      // var month1=int.parse(month.toString());


      if (month.compareTo( currentmonth ) >= 0) {
        //int homeworkTime = holyday.startDate;
        if (sepretedMap[monthKey] == null) {
          List<Holiday> newHD = new List( );
          newHD.add( holyday );
          sepretedMap[monthKey] = newHD;
        }

        else {
          List<Holiday> newHD1 = sepretedMap[monthKey];
          newHD1.add( holyday );
          sepretedMap[monthKey] = newHD1;
        }
      }
    }
    return sepretedMap;
  }

  getHolidayList(int i) {
    switch (i) {
      case 1:
        {
          _holiday.clear();
          _holidaylist.add( _holiday );
        }
        break;

      case 2:
        {
          // _streamController.add(this._allHolidays);
          _holidaylist.add( _holiday );
          //_streamController.add(_allHolidays);
        }
        break;

      case 3:
        {
          // _streamController.add(this._allHolidays);
        }
        break;
    }
  }
}