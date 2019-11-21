import 'package:flutter_app/src/mo/Participant/Participant.dart';
import 'package:flutter_app/src/mo/Participant/ParticipantDao.dart';

class ParticipantServive {
  ParticipantDao participantDao = new ParticipantDao();

  batchAddParticipant(List<Participant> participantList) {
    participantDao.batchAddParticipant(participantList);
  }

  Future<List<Participant>> getParticpantList() async {
    List<Participant> particpantListFromFuture =
        await participantDao.getAllParticipantData();
    return particpantListFromFuture;
  }
}
