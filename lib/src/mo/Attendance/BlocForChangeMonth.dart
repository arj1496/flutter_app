
import 'dart:async';

import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:rxdart/rxdart.dart';
enum selectMonth
{
  prev,
  next,
  current
}
class MonthBloc {
  Stream<List<int>> get allDays => monthlist.stream;


  final monthlist = BehaviorSubject<List<int>>( );

  Sink<selectMonth> get selectiontype => selectiontypeController.sink;

  final selectiontypeController = StreamController<selectMonth>( );

  MonthBloc() {

    monthlist.add( getValue( ) );
    selectiontypeController.stream.listen( (monthselectiontype) {
      if (monthselectiontype == selectMonth.prev) {
        monthlist.add( prevMonth( ) );
      }
      else if (monthselectiontype == selectMonth.current) {
        monthlist.add( currentMonth( ) );
      }
      else {
        monthlist.add( nextMonth( ) );
      }
    } );
  }

  List<int> prevMonth() {
    var item = new List<int>( );
    for (int i = 1; i <= 28; i++) {
      item.add( i );
    }
    return item;
  }

  List<int> nextMonth() {
    var item = new List<int>( );
    for (int i = 1; i <= 32; i++) {
      item.add( i );
    }
    return item;
  }

  List<int> getValue() {
    var item = new List<int>( );
    for (int i = 1; i <= 31; i++) {
      item.add( i );
    }
    return item;
  }

  List<int> currentMonth() {
    var item = new List<int>( );
    var now = DateTime.now( );
    for (int i = 1; i <= daysInMonth( now ); i++)
      item.add( i );
    return item;
  }

  int daysInMonth(DateTime date) {
    var firstDayThisMonth = new DateTime( date.year, date.month, date.day );
    var firstDayNextMonth = new DateTime(
        firstDayThisMonth.year, firstDayThisMonth.month + 1,
        firstDayThisMonth.day );
    return firstDayNextMonth
        .difference( firstDayThisMonth )
        .inDays;
  }


}