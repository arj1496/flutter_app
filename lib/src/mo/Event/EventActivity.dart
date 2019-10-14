import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/src/fr/SchoolUtils.dart';
import 'package:flutter_app/src/mo/Event/EventService.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../CardDetail2Oct.dart';
import '../../../DateWidget.dart';
import '../../../DescriptionCustomView.dart';
import '../../../DetailView2Oct.dart';
import '../../../EventWidget.dart';
import '../../../PropertyFile.dart';
import '../../../TitleViewDetail.dart';
import 'Event.dart';

class EventActivity{
  EventService eventService = new EventService();
  SchoolUtils schoolUtils = new SchoolUtils();

  Future<List<Event>> getAllEvent() async{
    List<Event> events =  await eventService.getEventList();
   return events;
  }

  String getDateFromLong(int startDate){
   return schoolUtils.getDateStringFromLongWithSchoolTimeZone(startDate);
  }
  String getDurationFromLong(int startDateLong, int endDateLong){
    return schoolUtils.getDurationBetweenTwoTimestamp(startDateLong, endDateLong);
  }
  String getTimeStringFromLongWithTimeZone(int timeStamp){
    return schoolUtils.getTimeStringFromLongWithTimeZone(timeStamp);
  }

  PropertyFile showEventDetail(data){
    EventActivity  eventActivity = EventActivity();
    var property = new PropertyFile();
    property.eventName = data.name;
    property.eventType = data.type;
    property.eventCreated = data.owner;
    property.placeLabel ="Place1";
    property.placeIconData = FontAwesomeIcons.mapMarker;
    property.palceData = data.place;
    property.startDate = eventActivity.getDateFromLong(data.startDate);
    property.endDate = eventActivity.getDateFromLong(data.endDate);
    property.startTime = eventActivity.getTimeStringFromLongWithTimeZone(data.startDate);
    property.endTime = eventActivity.getTimeStringFromLongWithTimeZone(data.endDate);
    property.durication = eventActivity.getDurationFromLong(data.startDate, data.endDate);
    property.descriptionLabel ="Description";
    property.descriptionIconData = FontAwesomeIcons.bookOpen;
    property.descriptionData = data.description;
 return property;
  }
}