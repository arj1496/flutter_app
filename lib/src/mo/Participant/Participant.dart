import 'package:equatable/equatable.dart';
import 'package:flutter_app/src/mo/Event/ParticipantType.dart';
import 'package:flutter_app/src/mo/Standard/Standard.dart';

class Participant extends Equatable {

  int id;
  String participantType;
  int participantId;
  String participantRole;
  String text;
  String standardName;
  int reference;
  int entityId;
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
    this.standardName,
   this.standard,
    this.entityId,
    this.reference,
});

  factory Participant.fromJson(Map<String, dynamic> json) => Participant(
    id: json["id"],
    participantType: json["type"],
    participantId: json["participantId"],
    participantRole: json["participantRole"],
    text: json["text"],
    standard: json["standard"],
    reference: json["reference"],
    entityId: json["entityId"],
  );
  Map<String, dynamic> toJson() => {
    "id" :id,
    "participantType" : participantType,
    "participantId" : participantId,
    "participantRole" : participantRole,
    "entityId":entityId,
    "reference":reference,
  };

  Map<String, dynamic> toJson_() => {

    "participantType" : participantType,
    "standard" :standard
  };

  @override
  // TODO: implement props
  List<Object> get props => [participantId];
}