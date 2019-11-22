import 'dart:core';

class Assessment{
  //POJO
  int skillId;
  int serverSkillId;
  String skillTitle;
  int skillSubjectId;
  String skillSubjectName;
  int parentSkillId;
  String parentSkillName; // check not required
  int standardId;
  String standardName;
  int groupId;
  String groupName;
  int gradeId;
  String gradeName;
  int termId;
  String termName;
  int schoolIdS;
  String evaluationCount = "1";
  int ownerId;
  String ownerName;
  String skillDataDump;
  String syllabusRef;

  /**
   * 0 = skill
   * 1 = exam
   * 2 = assignment
   * 3 = competition
   * 4 = Rubrics
   * 5 =
   */
  int assessmentType;
  int studentId; // this property will be used in case of only parent result
  List<Assessment> childSkills; // this property will be used in case of only parent result
  String referenceDetails; // rubrics details

  Assessment({
    this.skillId,
      this.serverSkillId,
      this.skillTitle,
      this.skillSubjectId,
      this.skillSubjectName,
      this.parentSkillId,
      this.parentSkillName,
      this.standardId,
      this.standardName,
      this.groupId,
      this.groupName,
      this.gradeId,
      this.gradeName,
      this.termId,
      this.termName,
      this.schoolIdS,
      this.evaluationCount,
      this.ownerId,
      this.ownerName,
      this.skillDataDump,
      this.syllabusRef,
      this.assessmentType,
      this.studentId,
      this.childSkills,
      this.referenceDetails});

  factory Assessment.fromJsonServer(Map<String, dynamic> jsonObject) => Assessment(
      skillId: jsonObject['skillId'],
      serverSkillId: jsonObject['serverSkillId'],
      skillTitle: jsonObject['skillTitle'],
      skillSubjectId: jsonObject['skillSubjectId'],
      skillSubjectName: jsonObject['skillSubjectName'],
      parentSkillId: jsonObject['parentSkillId'],
      parentSkillName: jsonObject['parentSkillName'],
      standardId: jsonObject['standardId'],
      standardName: jsonObject['standardName'],
      groupId: jsonObject['groupId'],
      groupName: jsonObject['groupName'],
      gradeId: jsonObject['gradeId'],
      gradeName: jsonObject['gradeName'],
      termId: jsonObject['termId'],
      termName: jsonObject['termName'],
      schoolIdS: jsonObject['schoolIdS'],
      evaluationCount: jsonObject['evaluationCount'],
      ownerId: jsonObject['ownerId'],
      ownerName: jsonObject['ownerName'],
      skillDataDump: jsonObject['skillDataDump'],
      syllabusRef: jsonObject['syllabusRef'],
      assessmentType: jsonObject['assessmentType'],
     // studentId: jsonObject['studentId'],
      childSkills: jsonObject['childSkills'],
      referenceDetails: jsonObject['referenceDetails']
  );

  factory Assessment.fromJsonLocal(Map<String, dynamic> jsonObject) => Assessment(
      skillId: jsonObject['skillId'],
      serverSkillId: jsonObject['serverSkillId'],
      skillTitle: jsonObject['skillTitle'],
      skillSubjectId: jsonObject['skillSubjectId'],
      skillSubjectName: jsonObject['skillSubjectName'],
      parentSkillId: jsonObject['parentSkillId'],
      parentSkillName: jsonObject['parentSkillName'],
      standardId: jsonObject['standardId'],
      standardName: jsonObject['standardName'],
      groupId: jsonObject['groupId'],
      groupName: jsonObject['groupName'],
      gradeId: jsonObject['gradeId'],
      gradeName: jsonObject['gradeName'],
      termId: jsonObject['termId'],
      termName: jsonObject['termName'],
      schoolIdS: jsonObject['schoolIdS'],
      evaluationCount: jsonObject['evaluationCount'],
      ownerId: jsonObject['ownerId'],
      ownerName: jsonObject['ownerName'],
      skillDataDump: jsonObject['skillDataDump'],
      syllabusRef: jsonObject['syllabusRef'],
      assessmentType: jsonObject['assessmentType'],
     // studentId: jsonObject['studentId'],
      childSkills: jsonObject['childSkills'],
      referenceDetails: jsonObject['referenceDetails']
  );

  Map<String, dynamic> toJson() => {
   'skillId': skillId,
   'serverSkillId': serverSkillId,
   'skillTitle': skillTitle,
   'skillSubjectId': skillSubjectId,
   'skillSubjectName': skillSubjectName,
   'parentSkillId': parentSkillId,
   'parentSkillName': parentSkillName,
   'standardId': standardId,
   'standardName': standardName,
   'groupId': groupId,
  'groupName': groupName,
   'gradeId': gradeId,
   'gradeName': gradeName,
   'termId': termId,
   'termName': termName,
   'schoolIdS': schoolIdS,
   'evaluationCount': evaluationCount,
   'ownerId': ownerId,
   'ownerName': ownerName,
   'skillDataDump': skillDataDump,
   'syllabusRef': syllabusRef,
   'assessmentType': assessmentType,
  // 'childSkills': childSkills,
   'referenceDetails': referenceDetails
  };
}
