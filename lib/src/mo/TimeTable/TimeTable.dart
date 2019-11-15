
import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Subject/Subject.dart';
import 'package:flutter_app/src/mo/teacher/Teacher.dart';

class TimeTable{

  int id;
  int lid;
  String title;
  int date;
  String time;
  String day;
  int standardId;
  int subjectId;
  int isWritable = 0;
  int personId;
  String owner;
  String operation;
  String infraStructure;

  // Transient
  Standard standard;
  Subject subject;
  int startHour, startMinute, endHour, endMinute, startTime, endTime;
  String startMeridian, endMeridian;
  Teacher teacher;


  TimeTable({
    this.id,
    this.lid,
    this.title,
    this.date,
    this.time,
    this.day,
    this.standardId,
    this.subjectId,
    this.isWritable,
    this.personId,
    this.owner,
    this.operation,
    this.infraStructure,
    this.standard,
    this.subject,
    this.startHour, this.startMinute, this.endHour, this.endMinute, this.startTime, this.endTime,
    this.startMeridian, this.endMeridian,
    this.teacher
});

  factory TimeTable.fromJsonServer(Map<String, dynamic> jsonObject) => TimeTable(
    id : jsonObject["id"],
    lid : jsonObject["lid"],
    title: jsonObject["title"],
    date: jsonObject["date"],
    time: jsonObject["time"],
    day: jsonObject["day"],
    standardId: jsonObject["standard"]["id"],
    subjectId: jsonObject["subject_id"],
    isWritable: jsonObject["isWritable"] == true ? 1 : 0,
    personId: jsonObject["person"],
    owner: jsonObject["owener"],
    operation: jsonObject["operation"],
    infraStructure: jsonObject["infraStructureName"],
  );

  factory TimeTable.fromJsonLocal(Map<String, dynamic> jsonObject) => TimeTable(
      id : jsonObject["timeTableId"],
      lid : jsonObject["lid"],
      title: jsonObject["timeTableTitle"],
      date: jsonObject["timeTableDate"],
      day: jsonObject["timeTableDay"],
      time: jsonObject["timeTableTime"],
      standardId: jsonObject["standardId"],
      subjectId: jsonObject["subjectId"],
      isWritable: jsonObject["timeTableisWritable"],
      personId: jsonObject["timeTablePersonId"],
      owner: jsonObject["timeTableOwner"],
      operation: jsonObject["timeTableOperation"],
      infraStructure: jsonObject["timeTableInfraStructure"],
      standard: jsonObject["standardId"] != null ? Standard(id: jsonObject["standardId"], name: jsonObject["standardName"]) : null,
      subject: jsonObject["subjectId"] != null ? Subject(id: jsonObject["subjectId"], name: jsonObject["subjectName"]) : null,
     /*startHour: jsonObject[""],
      startMinute: jsonObject[""],
      endHour: jsonObject[""],
      endMinute: jsonObject[""],
      startTime: jsonObject[""],
      endTime: jsonObject[""],
      startMeridian: jsonObject[""],
      endMeridian: jsonObject[""],
      teacher: jsonObject[""]*/
  );

  Map<String, dynamic> toJson() => {
    "id" : id,
    "lid" : lid,
    "title" : title,
    "date" : date,
    "time" : time,
    "day" : day,
    "standardId" : standardId,
    "subjectId" : subjectId,
    "isWritable" : isWritable,
    "personId" : personId,
    "owner" : owner,
    "operation" : operation,
    "infraStructure" : infraStructure,
  };


}