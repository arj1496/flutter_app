import 'package:flutter_app/src/mo/Event/ParticipantType.dart';
import 'package:flutter_app/src/mo/Standard/Standard.dart';

class Participant{

  int id;
  String participantType;
  int participantId;
  int participantRole;
  String text;
  /*
	 * Transient
	 */
  Standard standard = new Standard();

  Participant({
   this.id,
   this.participantType,
   this.participantId,
   this.participantRole,
   this.text,
   this.standard
});

  factory Participant.fromJson(Map<String, dynamic> json) => Participant(
    id: json["id"],
    participantType: json["participantType"],
    participantId: json["participantId"],
    participantRole: json["participantRole"],
    text: json["text"],
    standard: json["standard"]
  );
  Map<String, dynamic> toJson() => {
    "id" :id,
    "participantType" : participantType,
    "participantId" : participantId,
    "participantRole" : participantRole,
    "text" : text,
    "standard" :standard
  };

  Map<String, dynamic> toJson_() => {

    "participantType" : participantType,
    "standard" :standard
  };
}