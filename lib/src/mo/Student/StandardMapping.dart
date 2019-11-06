
class StandardMapping{

  int id;
  int studentId;
  int standardId;
  int schoolDS;
  int mappingType;
  int gradeId;
  int studentStatus;
  String rollNo;
  int isVisible;


  StandardMapping({
    this.id,
    this.studentId,
    this.standardId,
    this.schoolDS,
    this.mappingType,
    this.gradeId,
    this.studentStatus,
    this.rollNo,
    this.isVisible
});

  factory StandardMapping.fromJsonServer(Map<String, dynamic> jsonObject) => StandardMapping(
      id: jsonObject['smId'],
      studentId: jsonObject['studentId'],
      standardId: jsonObject['standardId'],
      schoolDS: jsonObject['schoolDs'],
      mappingType: jsonObject['mappingType'],
      gradeId: jsonObject['gradeId'],
      studentStatus: jsonObject['studentStatus'],
      rollNo: jsonObject['rollNo'],
      isVisible: jsonObject['isVisible']
  );

  factory StandardMapping.fromJsonLocal(Map<String, dynamic> jsonObject) => StandardMapping (
    id: jsonObject['smId'],
    studentId: jsonObject['studentId'],
    standardId: jsonObject['standardId'],
    schoolDS: jsonObject['schoolDs'],
    mappingType: jsonObject['mappingType'],
    gradeId: jsonObject['gradeId'],
    studentStatus: jsonObject['studentStatus'],
    rollNo: jsonObject['rollNo'],
    isVisible: jsonObject['isVisible']
  );

  Map<String, dynamic> toJson() => {
    "smId": id,
    "studentId": studentId,
    "standardId": standardId,
    "schoolDs": schoolDS,
    "mappingType": mappingType,
    "gradeId": gradeId,
    "studentStatus": studentStatus,
    "rollNo": rollNo,
    "isVisible": isVisible
  };



}