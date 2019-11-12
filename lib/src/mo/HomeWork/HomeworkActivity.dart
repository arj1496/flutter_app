import 'dart:core' as prefix0;
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_app/src/fr/SchoolUtils.dart';
import 'package:flutter_app/src/mo/HomeWork/HomeWork.dart';
import 'package:flutter_app/src/mo/HomeWork/HomeworkDao.dart';
import 'package:flutter_app/src/mo/HomeWork/HomeworkService.dart';
import 'package:intl/intl.dart';
class HomeworkActivity {

  HomeworkService homeworkService = new HomeworkService( );


  Future<Map<String,List<HomeWork>>> getLocalDbHomework( ) async {
    List<HomeWork> HWListFromFuture = await homeworkService.getLocalDbHomework ( );
    HWListFromFuture.sort((a, b) => b.endDate.compareTo(a.endDate));
    Map<String,List<HomeWork>> seperedMap = septretedHomeWorks ( HWListFromFuture );
    return seperedMap;
  }

  addHomeworkToServer_( HomeWork homework , callBack ) async {
    print ( "in hwactivity" );
    homeworkService.addOrUpdateHW ( homework ).then ( ( value ) {
      callBack ( );
    } );
    /* int examObject = await examService.addOrUpdateExam(genericModel);
    return examObject;*/
  }


  updateHomeworkToServer_( HomeWork homework , callBack ) async {
    print ( "in hwactivity" );
    homeworkService.updateHW ( homework ).then ( ( value ) {
      callBack ( );
    } );
    /* int examObject = await examService.addOrUpdateExam(genericModel);
    return examObject;*/
  }

  Map<String,List<HomeWork>> septretedHomeWorks( List<HomeWork> homeWorks ) {
    Map<String , List<HomeWork>> sepretedMap = new Map( );
    DateTime dayStart = new DateTime.now( );
    DateTime dayEnd = new DateTime(
        dayStart.year , dayStart.month , dayStart.day , 23 , 59 , 59 );
    DateTime lastWeek = new DateTime(
        dayStart.year , dayStart.month , dayStart.day - 6 , 23 , 59 , 59 );

    for (HomeWork homeWork in homeWorks) {
      if (homeWork.endDate != null) {
        int homeworkTime = homeWork.endDate;

        if (homeworkTime >= dayEnd.millisecondsSinceEpoch) {
          if (sepretedMap["Upcoming"] == null) {
            List<HomeWork> newHW = new List( );
             newHW.add(homeWork);
             sepretedMap["Upcoming"] = newHW;
          }  else {
            List<HomeWork> newHW2 = sepretedMap["Upcoming"];
            newHW2.add ( homeWork );
            sepretedMap["Upcoming"] = newHW2;
          }
        } else if (homeworkTime <= dayEnd.millisecondsSinceEpoch &&
            homeworkTime >= dayStart.millisecondsSinceEpoch) {
          if (sepretedMap["Today"] == null) {
          List<HomeWork> newHW = new List( );
          newHW.add(homeWork);
            sepretedMap["Today"] = newHW;
          } else {
            List<HomeWork> newHW2 = sepretedMap["Today"];
            newHW2.add ( homeWork );
            sepretedMap["Today"] = newHW2;
          }
        } else if (homeworkTime < dayStart.millisecondsSinceEpoch &&
            homeworkTime >= lastWeek.millisecondsSinceEpoch) {
          if (sepretedMap["Last Week"] == null) {
            List<HomeWork> newHW = new List( );
            newHW.add(homeWork);
            sepretedMap["Last Week"] = newHW;
          } else {
            List<HomeWork> newHW2 = sepretedMap["Last Week"];
            newHW2.add ( homeWork );
            sepretedMap["Last Week"] = newHW2;
          }
        } else {
          DateTime month = DateTime.fromMillisecondsSinceEpoch(homeworkTime);
          DateFormat month_date = new DateFormat("MMMM");
           String month_name = month_date.format(month);
           String monthKey = month_name +" " + month.year.toString();

          if (sepretedMap[monthKey] == null) {
            List<HomeWork> newHW = new List( );
            newHW.add(homeWork);
            sepretedMap[monthKey] = newHW;
          } else {
            List<HomeWork> newHW2 = sepretedMap[monthKey];
            newHW2.add ( homeWork );
            sepretedMap[monthKey] = newHW2;
          }
        }
      }
      }
    return sepretedMap;
    }
  }




