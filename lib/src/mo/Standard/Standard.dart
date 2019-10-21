class Standard {
  int lid; // local id
  int id; //server id
  String name;
  int startDate;
  int endDate;
  String startTime;
  String endTime;
  String cordTeacher;
  int divisionId;
  String divisionName;

  //Transient
  int startHour;
  int startMinut;
  int eHour;
  int eMinute;
  int sTime;
  int eTime;
  String sFormate;
  String eFormate;
  bool isSlelected = false;

  Standard(
      {this.id,
      this.name,
      this.startDate,
      this.endDate,
      this.startTime,
      this.endTime,
      this.cordTeacher,
      this.divisionId,
      this.divisionName,
      this.startHour,
      this.startMinut,
      this.eHour,
      this.eMinute,
      this.sTime,
      this.eTime,
      this.sFormate,
      this.eFormate,
      this.isSlelected});

  factory Standard.fromJsonServer(Map<String, dynamic> json) => Standard(
      id: json["id"],
      name: json["name"],
      startDate: json["startDate"] != null ? int.parse(json["startDate"].toString()) : null,
      endDate: json["endDate"] != null ? int.parse(json["endDate"].toString()) : null,
      startTime: json["startTime"],
      endTime: json["endTime"],
      cordTeacher: json["cordTeacher"],
      divisionId: json["divisionId"],
      divisionName: json["divisionName"],
      startHour: json["startHour"],
      startMinut: json["startMinut"],
      eHour: json["eHour"],
      eMinute: json["eMinute"],
      sTime: json["sTime"],
      eTime: json["eTime"],
      sFormate: json["sFormate"],
      eFormate: json["eFormate"],
      isSlelected: json["isSlelected"]);

  factory Standard.fromJsonLocal(Map<String, dynamic> json) => Standard(
      id: json["id"],
      name: json["name"],
      startDate: json["startDate"] != null ? int.parse(json["startDate"].toString()) : null,
      endDate: json["endDate"] != null ? int.parse(json["endDate"].toString()) : null,
      startTime: json["startTime"],
      endTime: json["endTime"],
      cordTeacher: json["cordTeacher"],
      divisionId: json["divisionId"],
      divisionName: json["divisionName"],
      startHour: json["startHour"],
      startMinut: json["startMinut"],
      eHour: json["eHour"],
      eMinute: json["eMinute"],
      sTime: json["sTime"],
      eTime: json["eTime"],
      sFormate: json["sFormate"],
      eFormate: json["eFormate"],
      isSlelected: json["isSlelected"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "startDate": startDate,
        "endDate": endDate,
        "startTime": startTime,
        "endTime": endTime,
        "divisionId": divisionId,
        "divisionName": divisionName
      };
}
