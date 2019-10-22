import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Subject/Subject.dart';

class Exam
{
   int lid;
   int id;
   String name;
   int standardId;
   String standardName;
   Standard standard;
   Subject subject;
   int subjectId;
   String subjectName;
   int examDate;
   int totalMark;
   String examType;
   String owner;
   String description;
   String status;
   String syllabus;
   String erDataJson;

  Exam({
      this.id,
      this.name,
      this.standardId,
      this.standardName,
      this.subjectName,
    this.standard,
    this.subject,
       this.subjectId,
      this.examDate,
      this.totalMark,
      this.examType,
      this.owner,
      this.description,
      this.status,
      this.syllabus,
      this.erDataJson
});

   factory Exam.fromJson(Map<String, dynamic> json) => Exam(
     id: json["id"],
     name :json["name"],
     standardId: Standard.fromJsonLocal(json["standard"]).id,
     standard:Standard.fromJsonLocal(json["standard"]),

     //  standardName: json["standardName"],
        subjectId:Subject.fromJsonLocal(json["subject"]).id,
       subject : Subject.fromJsonLocal(json["subject"]),
       examDate: json["examDate"],
       totalMark: json["totalMark"],
       examType: json["examType"],
       owner: json["owner"],
       description: json["description"],
       status: json["status"],
       syllabus: json["syllabus"],
       erDataJson: json["erDataJson"],
   );

   Map<String, dynamic> toJson() => {

     "id" : id,
     "name" : name,
     "standardId" : standardId,
    // "standardName" : standardName,
     "subjectId" : subjectId,
     "examDate" : examDate,
     "totalMark" : totalMark,
     "examType" : examType,
     "owner" : owner,
     "description" : description,
     "status" : status,
     "syllabus" : syllabus,
     "erDataJson" : erDataJson,
   };
}