import 'package:flutter_app/src/mo/Event/Event.dart';
import 'package:flutter_app/src/mo/Event/EventDAO.dart';

import 'Attachment.dart';

class EventService {
  EventDAO eventDAO = new EventDAO();
  getValues( ) {
    List<Attachment> attachmentList = new List( );
    for (var i = 0; i < 5; i++) {
      Attachment attachment = new Attachment( );
      attachment.fileName = "main" + i.toString ( ) + ".png";
      attachment.extension = "png";
      attachmentList.add ( attachment );
    }
    return attachmentList;
  }

  syncCallBackHandle(Map<String, dynamic> syncDataResponse) async{
    List<dynamic> eventsDynamic = syncDataResponse['events'];
    if(eventsDynamic != null && eventsDynamic.length > 0) {
      List<Event> eventList = List.generate(eventsDynamic.length, (i){
        Event event = Event.fromJson(eventsDynamic[i]);
        return event;
      });
      await eventDAO.batchAddEvent(eventList);
    }
  }
}