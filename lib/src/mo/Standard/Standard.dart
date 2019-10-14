class Standard{
  int serialVersionUID = 1;
  int lid;       // server id
  int id;         //local id
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


  Standard({
    this.serialVersionUID,
    this.id,
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
    this.isSlelected
});
  factory Standard.fromJson(Map<String, dynamic> json) => Standard(
    serialVersionUID : json["serialVersionUID"],
    id: json["id"],
    name :json["name"],
    startDate: json["startDate"],
    endDate: json["endDate"],
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
    isSlelected: json["isSlelected"]
  );

  Map<String, dynamic> toJson() => {
    "serialVersionUID" : serialVersionUID,
    "id" : id,
    "name" : name,
    "startDate" : startDate,
    "endDate" : endDate,
    "startTime" : startTime,
    "endTime" : endTime,
    "cordTeacher" : cordTeacher,
    "divisionId" : divisionId,
    "divisionName" : divisionName,
    "startHour" : startHour,
    "startMinut" : startMinut,
    "eHour" : eHour,
    "eMinute" : eMinute,
    "sTime" : sTime,
     "eTime" : eTime,
     "sFormate" : sFormate,
     "eFormate": eFormate,
    "isSlelected"  : isSlelected
  };
}