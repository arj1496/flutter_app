import 'package:flutter_app/src/mo/Assessments/Assessment.dart';
import 'package:flutter_app/src/mo/Assessments/AssessmentDao.dart';
import 'package:flutter_app/src/mo/Assessments/AssessmentWebService.dart';

class AssessmentService{
  AssessmentWebService assessmentWebService = new AssessmentWebService();

  AssessmentDao assessmentDao = new AssessmentDao();

  syncCallBackHandle(Map<String,dynamic> syncDataResponse) async {
    List<dynamic> assessmentDynamic = syncDataResponse['skillList'];
    if (assessmentDynamic != null && assessmentDynamic.length > 0){
      List<Assessment> assessmentList = List.generate(assessmentDynamic.length, (i){
        Assessment assessment = Assessment.fromJsonServer(assessmentDynamic[i]);
        return assessment;
      });
      await batchAddAssessment(assessmentList);
    }
  }

  batchAddAssessment(List<Assessment> assessmentList) async{
   await assessmentDao.batchAddAssessment(assessmentList);
  }

 Future<List<Assessment>> getAssessmentListFromLocalDB() async{
    List<Assessment> assessmentList = await assessmentDao.getAllAssessmentData();
    return assessmentList;

  }
}