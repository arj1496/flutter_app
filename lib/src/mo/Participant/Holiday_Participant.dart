class Holiday_Participant{


  int holidayId;
  int participantId;

  Holiday_Participant(

      this.holidayId,
      this.participantId,

      );


  /* factory Event_Participant.fromJson(Map<String, dynamic> json) => Event_Participant(
     // eventId : json["eventId"],
     // participantId : json["participantId"]
  );*/


  Map<String, dynamic> toJson() => {
    "holidayId" : holidayId,
    "participantId" : participantId,

  };
}