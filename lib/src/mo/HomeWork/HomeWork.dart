
import 'package:flutter_app/src/mo/Standard/Standard.dart';

class HomeWork{

  int dbId;
  int serverId;
  String title;
  int classId;
  String className;
  int subjectId;
  String subjectName;
  int teacherId;
  String owner;
  String description;
  int startDate;
  int endDate;
  int duration;
  int mark;
  String type;
  List<int> subIds = new List();


  HomeWork({
   this.dbId,
   this.serverId,
    this.title,
    this.classId,
    this.className,
    this.subjectId,
    this.subjectName,
    this.teacherId,
    this.owner,
    this.startDate,
    this.endDate,
    this.duration,
    this.mark,
    this.description
  });

  factory HomeWork.fromJson(Map<String, dynamic> json) => HomeWork(
    serverId: json["id"],
    title :json["name"],
    classId:json["standard"]['id'],
    className:json["standard"]['name'],
    subjectId: json["subject"]['id'],
    subjectName : json["subject"]['name'],
    startDate: json["startDate"],
    endDate: json["submitDate"],
     mark: json["mark"],
    owner:json["owner"],
    description:json["description"],
   /* examType: json["examType"],
    owner: json["owner"],
    description: json["description"],
    status: json["status"],
    syllabus: json["syllabus"],
    erDataJson: json["erDataJson"],*/
  );


  factory HomeWork.fromJsonLocal(Map<String, dynamic> json) => HomeWork(
    serverId: json["id"],
    title :json["name"],
    classId:json["standardId"],
    className:json["standardName"],
    subjectId: json["subjectId"],
    subjectName : json["subjectName"],
    startDate: json["startDate"],
    endDate: json["endDate"],
    mark: json["mark"],
    owner:json["owner"],
    description:json["description"],
    /* examType: json["examType"],
    owner: json["owner"],
    description: json["description"],
    status: json["status"],
    syllabus: json["syllabus"],
    erDataJson: json["erDataJson"],*/
  );

  Map<String, dynamic> toJson() => {

    "id" : serverId,
    "name" : title,
    "standardId" : classId,
     "standardName" : className,
    "subjectId" : subjectId,
    "subjectName" : subjectName,
    "startDate" : startDate,
    "endDate" : endDate,
    "owner":owner,
    "mark":mark,
    "description":description,
     };
}