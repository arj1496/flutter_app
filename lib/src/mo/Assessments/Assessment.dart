import 'dart:core';

class Assessment{
  //POJO
  int skillId;
  int serverSkillId;
  String title;
  int subjectId;
  String subjectName;
  int parentSkillId;
  String parentSkillTitle; // check not required
  int standardId;
  String standardName;
  int groupId;
  String groupName;
  int gradeId;
  String gradeName;
  int termId;
  String termName;
  int schoolDS;
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
    this.title,
    this.subjectId,
    this.subjectName,
    this.parentSkillId,
    this.parentSkillTitle,
    this.standardId,
    this.standardName,
    this.groupId,
    this.groupName,
    this.gradeId,
    this.gradeName,
    this.termId,
    this.termName,
    this.schoolDS,
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
      title: jsonObject['title'],
      subjectId: jsonObject['subjectId'],
      subjectName: jsonObject['subjectName'],
      parentSkillId: jsonObject['parentSkillId'],
      parentSkillTitle: jsonObject['parentSkillTitle'],
      standardId: jsonObject['standardId'],
      standardName: jsonObject['standardName'],
      groupId: jsonObject['groupId'],
      groupName: jsonObject['groupName'],
      gradeId: jsonObject['gradeId'],
      gradeName: jsonObject['gradeName'],
      termId: jsonObject['termId'],
      termName: jsonObject['termName'],
      schoolDS: jsonObject['schoolDS'],
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
      title: jsonObject['title'],
      subjectId: jsonObject['subjectId'],
      subjectName: jsonObject['subjectName'],
      parentSkillId: jsonObject['parentSkillId'],
      parentSkillTitle: jsonObject['parentSkillTitle'],
      standardId: jsonObject['standardId'],
      standardName: jsonObject['standardName'],
      groupId: jsonObject['groupId'],
      groupName: jsonObject['groupName'],
      gradeId: jsonObject['gradeId'],
      gradeName: jsonObject['gradeName'],
      termId: jsonObject['termId'],
      termName: jsonObject['termName'],
      schoolDS: jsonObject['schoolDS'],
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
    'title': title,
    'subjectId': subjectId,
    'subjectName': subjectName,
    'parentSkillId': parentSkillId,
    'parentSkillTitle': parentSkillTitle,
    'standardId': standardId,
    'standardName': standardName,
    'groupId': groupId,
    'groupName': groupName,
    'gradeId': gradeId,
    'gradeName': gradeName,
    'termId': termId,
    'termName': termName,
    'schoolDS': schoolDS,
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
