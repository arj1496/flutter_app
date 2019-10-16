class Exam
{
   int lid;
   int id;
   String name;
   int standardId;
   String standardName;
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
       standardId: json["standardId"],
     //  standardName: json["standardName"],
        subjectId: json["subjectId"],
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