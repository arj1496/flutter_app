import 'package:flutter_app/src/mo/Event/Event.dart';
import 'package:flutter_app/src/mo/Event/EventDAO.dart';
import 'package:flutter_app/src/mo/Participant/Event_Participant.dart';
import 'package:flutter_app/src/mo/Participant/Participant.dart';
import 'package:flutter_app/src/mo/Participant/Participant.dart' as prefix0;
import 'package:flutter_app/src/mo/Participant/ParticipantDao.dart';

import 'Attachment.dart';

class EventService {
  EventDAO eventDAO = new EventDAO( );
  ParticipantDao participantDao = new ParticipantDao( );

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

  syncCallBackHandle( Map<String , dynamic> syncDataResponse ) async {
    List<dynamic> eventsDynamic = syncDataResponse['events'];

    List<Participant> allParticipants = new List();
    List<Event_Participant> allEventParticpants = new List();
    if (eventsDynamic != null && eventsDynamic.length > 0) {
      List<Event> eventList = List.generate ( eventsDynamic.length , ( i ) {
        List<dynamic> participantsDynamic = eventsDynamic[i]['eventPrticipantds'];
        List<Participant> participantList = getParticipant(participantsDynamic );

        Event event = Event.fromJson ( eventsDynamic[i] );
        if(participantList != null) {
          for(Participant participant in participantList){
            Event_Participant event_participant = new Event_Participant(event.id, participant.id);
            allEventParticpants.add(event_participant);
          }
          allParticipants.addAll ( participantList );
        }

        return event;
      } );
      await eventDAO.batchAddEvent (eventList);
      await participantDao.batchAddParticipant(allParticipants);
      await participantDao.batchAddEventParticipant(allEventParticpants);
    }
  }

  List<Participant> getParticipant( List participantsDynamic )  {
    if (participantsDynamic != null && participantsDynamic.length > 0) {
      List<Participant> participanttList = List.generate (
          participantsDynamic.length , ( i ) {
        Participant participant = Participant.fromJson(participantsDynamic[i]);
        return participant;
      } );
     // await participantDao.batchAddParticipant ( participanttList );
      return participanttList;
    }


  }
}