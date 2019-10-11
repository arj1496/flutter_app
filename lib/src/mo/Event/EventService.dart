import 'dart:async';
import 'dart:collection';
import 'package:flutter_app/src/mo/Event/EventDAO.dart';
import 'package:flutter_app/src/mo/Event/EventWebService.dart';

import 'Event.dart';

class EventService{

  EventDAO eventDAO = new EventDAO();
  Event addTeacher(Event event){
    Event _event = eventDAO.addEvent(event);
  }

  batchAddEvent(List<Event> eventList){
    eventDAO.batchAddEvent(eventList);
  }

  Future<List<Event>> getEventList() async{
    List<Event> eventListFromFuture = await eventDAO.getAllEventData();
    return eventListFromFuture;
  }
  Future<List<Event>> getEventListDataFromServer() async {
    EventWebService _eventWebService = new EventWebService();

    HashMap map = new HashMap<String, String>();
    map['event_sync_time'] = 0.toString();

    Map<String, dynamic> eventDataFromServer = await _eventWebService.getData_(map, "rest/sync/getSyncInfo");
    List<Event> eventList = null;
    if(eventDataFromServer['isEventSync']){
      print(eventDataFromServer);
      List<dynamic> eventsDynamic = eventDataFromServer['events'];
      eventList = List.generate(eventsDynamic.length, (i){
        Event event = Event.fromJson(eventsDynamic[i]);
        return event;
      });
      EventService eventServcie = new EventService();
      await eventServcie.batchAddEvent(eventList);
    }else{
      print('Event Sync is false');
    }
    return eventList;
  }
}