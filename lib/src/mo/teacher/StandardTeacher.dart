
class StandardTeacher{

  int id;
  int standardId;
  int teacherId;
  int schoolDs;
  int subjectId;
  int association;
  int tracker;
  int sharePercentage = 0;


  StandardTeacher({
    this.id,
    this.standardId,
    this.teacherId,
    this.schoolDs,
    this.subjectId,
    this.association,
    this.tracker,
    this.sharePercentage
  });

  factory StandardTeacher.fromJsonServer(Map<String, dynamic> jsonObject) => StandardTeacher(
    id: jsonObject['recordId'],
    standardId: jsonObject['standardId'],
    teacherId: jsonObject['teacherId'],
    schoolDs: jsonObject['schoolDs'],
    subjectId: jsonObject['subjectId'],
    association: jsonObject['association'],
    tracker: jsonObject['tracker'],
    sharePercentage: jsonObject['sharePercentage']
  );

  factory StandardTeacher.fromJsonLocal(Map<String, dynamic> jsonObject) => StandardTeacher(
      id: jsonObject['Id'],
      standardId: jsonObject['standardId'],
      teacherId: jsonObject['teacherId'],
      schoolDs: jsonObject['schoolDs'],
      subjectId: jsonObject['subjectId'],
      association: jsonObject['association'],
      tracker: jsonObject['tracker'],
      sharePercentage: jsonObject['sharePercentage']
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "standardId": standardId,
    "teacherId": teacherId,
    "schoolDs": schoolDs,
    "subjectId": subjectId,
    "association": association,
    "tracker": tracker,
    "sharePercentage": sharePercentage
  };
}