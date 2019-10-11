import 'package:flutter_app/src/mo/Event/EventService.dart';

import 'Event.dart';

class EventActivity{
  EventService eventService = new EventService();

  Future<List<Event>> getAllEvent() async{
    List<Event> events =  await eventService.getEventList();
   return events;
  }
}