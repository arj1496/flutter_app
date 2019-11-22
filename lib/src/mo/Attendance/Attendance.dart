
import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Subject/Subject.dart';

class Attendance
{
  int id;
  int date;
  String owner;
  Standard standard;
  Subject subject;
  String type;
  int isWritable=01;
  String commaseperatedAbsent;
  int status;
  String message;
  int recordId;
  int syncTime;
  int timetableId;


 Attendance({
   this.id,
   this.date,
   this.owner,
   this.standard,
   this.subject,
   this.type,
   this.isWritable,
   this.commaseperatedAbsent,
   this.status,
   this.message,
   this.recordId,
   this.syncTime,
   this.timetableId
});

  factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
    //serverId: json["id"],
    id: json["id"],
    date :json["date"],
    owner: json["owner"],
    standard: json["standard"],
    subject: json["subject"],
    type: json["type"],
    isWritable: json["isWritable"],
    commaseperatedAbsent :json["commaseperatedAbsent"],
    status: json["status"],
    message: json["message"],
    recordId: json["recordId"],
    syncTime: json["syncTime"],
    timetableId: json["timetableId"],

  );

  Map<String, dynamic> toJson() => {
   // "id" : serverId,
    "id" : id,
    "date" : date,
    "owner" : owner,
    "standard" : standard,
    "subject" : subject,
    "type":type,
    "isWritable":isWritable,
    "commaseperatedAbsent":commaseperatedAbsent,
    "status":status,
    "message":message,
    "recordId":recordId,
    "syncTime":syncTime,
    "timetableId":timetableId
  };

  factory Attendance.fromJsonLocal(Map<String, dynamic> json) => Attendance(
    id: json["attendanceId"],
    date :json["date"],
    owner: json["owner"],
    standard: json["standard"],
    subject: json["subject"],
    type: json["type"],
    isWritable: json["isWritable"],
    commaseperatedAbsent :json["commaseperatedAbsent"],
    status: json["status"],
    message: json["message"],
    recordId: json["recordId"],
    syncTime: json["syncTime"],
    timetableId: json["timetableId"],


  );

}