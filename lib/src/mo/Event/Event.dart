
import 'package:flutter_app/src/mo/Participant/Participant.dart';

import '../../../Attachment.dart';

class Event {
  int lid; //Lcoal Primary Key
  int id;  //Server Primary Key
  String  name;
  String  description;
  String  place;
  int  startDate;
  int endDate;
  int status;
  String type;
  String owner;
  int person;
  int allDay = 0;
  int isWritable = 0;
  String attachment;
  List<Participant> eventParticipant = new List<Participant>();
 // Map<String, Set<int>> personalParticipant = new Map<String, Set<int>>();
  List<Participant> personalParticipant = new List<Participant>();
  String attechmentJson;
  //List<Attachment> attachments;

  Event({
    this.lid,
    this.id,
    this.name,
    this.description,
    this.place,
    this.startDate,
    this.endDate,
    this.status,
    this.type,
    this.owner,
    this.person,
    this.allDay,
    this.isWritable,
    this.attachment,
   // this.eventParticipant,
    //this.personalParticipant,
    this.attechmentJson,
    this.eventParticipant,
   // this.attachments
});

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    lid: json["lid"],
    id : json["id"],
    name : json["name"],
    description : json["description"],
    place : json["place"],
    startDate : json["startDate"],
    endDate : json["endDate"],
    status : json["status"] == true ? 1 : 0,
    type : json["type"],
    owner : json["owner"],
    person : json["person"],
    allDay : json["allDay"] == true ? 1 : 0,
    isWritable : json["isWritable"] == true ? 1 : 0,
    attachment : json["attachment"],
   // eventParticipant : Participant.fromJson(json["eventPrticipantds"]),
   // personalParticipant : json["personalParticipant"],
    attechmentJson : json["attechmentJson"],
   // attachments : json["attachments"],
  );

  Map<String, dynamic> toJson() => {
    "lid" : lid,
    "id" : id,
    "name" : name,
    "description" : description,
    "place" : place,
    "startDate" : startDate,
    "endDate" : endDate,
    "status" : status,
    "type" : type,
    "owner" : owner,
    "person" : person,
    "allDay" : allDay,
    "isWritable" : isWritable,
    "attachment" : attachment,
    //"eventParticipant" : eventParticipant,
    //"personalParticipant" : personalParticipant,
    "attechmentJson" : attechmentJson,
    //"attachments" : attachments
  };

}