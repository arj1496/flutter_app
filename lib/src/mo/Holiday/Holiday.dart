
class Holiday
{
  int serverId;
  int id;
  String name;
  int startDate;
  int endDate;
  String type;
  //String participants;



  Holiday({
    this.serverId,
    this.id,

    this.name,
    this.startDate,
    this.endDate,
    this.type,
   // this.participants
  }

      );

  factory Holiday.fromJson(Map<String, dynamic> json) => Holiday(
    serverId: json["id"],
      id: json["id"],
      name :json["name"],
      startDate: json["startDate"],
      endDate: json["endDate"],
      type: json["type"],
      //participants: json["participants"],

  );

  Map<String, dynamic> toJson() => {
    "id" : serverId,
    "id" : id,
    "name" : name,
    "startDate" : startDate,
    "endDate" : endDate,
    "type" : type,
    //"participants":participants,
  };

  factory Holiday.fromJsonLocal(Map<String, dynamic> json) => Holiday(
    serverId: json["id"],
    id: json["id"],
    name :json["name"],
    startDate: json["startDate"],
    endDate: json["endDate"],
    type: json["type"],
   // participants:json["participants"],


  );



}