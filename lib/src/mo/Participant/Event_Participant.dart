class Event_Participant{


  int eventId;
  int participantId;

  Event_Participant(

      this.eventId,
      this.participantId,

      );


 /* factory Event_Participant.fromJson(Map<String, dynamic> json) => Event_Participant(
     // eventId : json["eventId"],
     // participantId : json["participantId"]
  );*/


  Map<String, dynamic> toJson() => {
    "eventId" : eventId,
    "participantId" : participantId,

  };
}