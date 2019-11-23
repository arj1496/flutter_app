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
    if (eventsDynamic != null && eventsDynamic.length > 0) {
      List<Event> eventList = List.generate ( eventsDynamic.length , ( i ) {
        List<dynamic> participantsDynamic = eventsDynamic[i]['eventPrticipantds'];
        Event event = Event.fromJson ( eventsDynamic[i] );
        List<Participant> participantList = getParticipant(participantsDynamic,event );
        if(participantList != null) {
          allParticipants.addAll ( participantList );
        }
        return event;
      } );
      await eventDAO.batchAddEvent (eventList);
      await participantDao.batchAddParticipant(allParticipants);
    }
  }

  List<Participant> getParticipant( List participantsDynamic ,Event event)  {
    if (participantsDynamic != null && participantsDynamic.length > 0) {
      List<Participant> participanttList = List.generate (
          participantsDynamic.length , ( i ) {
        Participant participant = Participant.fromJson(participantsDynamic[i]);
        participant.entityId = event.id;
        participant.reference = 0;
        return participant;
      } );
      return participanttList;
    }
  }
}