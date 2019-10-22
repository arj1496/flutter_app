import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/src/fr/SchoolUtils.dart';
import 'package:flutter_app/src/mo/Event/EventService.dart';
import 'package:flutter_app/src/mo/Event/EventType.dart';
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

  List<EventType> getEventTypeList(){
    List<EventType> eventYpeList = new List();
    //1.EVENT
    EventType event = new EventType();
    event.id = 0;
    event.eventType = "EVENT";
    eventYpeList.add(event);
    //2. TEACHER_MEETING
    EventType TEACHER_MEETING = new EventType();
    TEACHER_MEETING.id = 1;
    TEACHER_MEETING.eventType = "TEACHER_MEETING";
    eventYpeList.add(TEACHER_MEETING);
    //3.PARENT_MEETING
    EventType PARENT_MEETING = new EventType();
    PARENT_MEETING.id = 2;
    PARENT_MEETING.eventType = "PARENT_MEETING";
    eventYpeList.add(PARENT_MEETING);
    //4.STUDENT_MEETING
    EventType STUDENT_MEETING = new EventType();
    STUDENT_MEETING.id = 3;
    STUDENT_MEETING.eventType = "STUDENT_MEETING";
    eventYpeList.add(STUDENT_MEETING);
    //5.ONE_ON_ONE_MEETING
    EventType ONE_ON_ONE_MEETING = new EventType();
    ONE_ON_ONE_MEETING.id = 4;
    ONE_ON_ONE_MEETING.eventType = "ONE_ON_ONE_MEETING";
    eventYpeList.add(ONE_ON_ONE_MEETING);
    //6.GROUP_METTING
    EventType GROUP_METTING = new EventType();
    GROUP_METTING.id = 5;
    GROUP_METTING.eventType = "GROUP_METTING";
    eventYpeList.add(GROUP_METTING);
    //7.STAFF_MEETING
    EventType STAFF_MEETING = new EventType();
    STAFF_MEETING.id = 6;
    STAFF_MEETING.eventType = "STAFF_MEETING";
    eventYpeList.add(STAFF_MEETING);
    //8.MEETING
    EventType MEETING = new EventType();
    MEETING.id = 7;
    MEETING.eventType = "MEETING";
    eventYpeList.add(MEETING);
    //9.ANNUAL_FUNCTION
    EventType ANNUAL_FUNCTION = new EventType();
    ANNUAL_FUNCTION.id = 8;
    ANNUAL_FUNCTION.eventType = "ANNUAL_FUNCTION";
    eventYpeList.add(ANNUAL_FUNCTION);
    //10.DAY_CELEBRATION
    EventType DAY_CELEBRATION = new EventType();
    DAY_CELEBRATION.id = 9;
    DAY_CELEBRATION.eventType = "DAY_CELEBRATION";
    eventYpeList.add(DAY_CELEBRATION);
    //11.FESTIVAL_CELEBRATION
    EventType FESTIVAL_CELEBRATION = new EventType();
    FESTIVAL_CELEBRATION.id = 10;
    FESTIVAL_CELEBRATION.eventType = "FESTIVAL_CELEBRATION";
    eventYpeList.add(FESTIVAL_CELEBRATION);
    //12.SPORTS_EVENT
    EventType SPORTS_EVENT = new EventType();
    SPORTS_EVENT.id = 11;
    SPORTS_EVENT.eventType = "SPORTS_EVENT";
    eventYpeList.add(SPORTS_EVENT);
    //13.HEALTH_CARE
    EventType HEALTH_CARE = new EventType();
    HEALTH_CARE.id = 12;
    HEALTH_CARE.eventType = "HEALTH_CARE";
    eventYpeList.add(HEALTH_CARE);
    //14.CO_CURRICULAR_ACTIVITY
    EventType CO_CURRICULAR_ACTIVITY = new EventType();
    CO_CURRICULAR_ACTIVITY.id = 13;
    CO_CURRICULAR_ACTIVITY.eventType = "CO_CURRICULAR_ACTIVITY";
    eventYpeList.add(CO_CURRICULAR_ACTIVITY);
    //15.FUNCTIONS
    EventType FUNCTIONS = new EventType();
    FUNCTIONS.id = 14;
    FUNCTIONS.eventType = "FUNCTIONS";
    eventYpeList.add(FUNCTIONS);
    //16.PICNIC
    EventType PICNIC = new EventType();
    PICNIC.id = 15;
    PICNIC.eventType = "PICNIC";
    eventYpeList.add(PICNIC);
    //17.FIELD_TRIP
    EventType FIELD_TRIP = new EventType();
    FIELD_TRIP.id = 16;
    FIELD_TRIP.eventType = "FIELD_TRIP";
    eventYpeList.add(FIELD_TRIP);
    //18.EXPERT_LECTURE
    EventType EXPERT_LECTURE = new EventType();
    EXPERT_LECTURE.id = 17;
    EXPERT_LECTURE.eventType = "EXPERT_LECTURE";
    eventYpeList.add(EXPERT_LECTURE);
    //19.OTHER
    EventType OTHER = new EventType();
    OTHER.id = 18;
    OTHER.eventType = "OTHER";
    eventYpeList.add(OTHER);
    //20.EXAM
    EventType EXAM = new EventType();
    EXAM.id = 19;
    EXAM.eventType = "EXAM";
    eventYpeList.add(EXAM);
    return eventYpeList;
  }

  getEventHardCodeData() {
    Event event = new Event();
    // String  name;
    event.name =" Event Save From Mobile";
    //  String  description;
    event.description = "Event Description";
    //  String  place;
    event.place = "Event Place";
    //  int  startDate;
    event.startDate = 1571106600000;
    //  int endDate;
    event.endDate = 1571110200000;
    //  int status;
    event.status = 0;
    //  String type;
    event.type = "Event";
    //  String owner;
    event.owner ="Urvesh";
    //  int person;
    event.person = 1;
    //  int allDay = 0;
    event.allDay = 0;
    //  int isWritable = 0;
    event.isWritable = 0;
    return event;
  }

  addEventToServer(event) {
    Event eventObject = eventService.addOrUpdateEvent(event);
    return eventObject;
  }
}