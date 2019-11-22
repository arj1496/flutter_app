import 'package:flutter_app/src/mo/Assessments/Assessment.dart';
import 'package:flutter_app/src/mo/Assessments/AssessmentService.dart';

class AssessmentActivity{
  AssessmentService assessmentService = new AssessmentService();

  Future<List<Assessment>> getAssessmentListFromLocalDB() async{
    List<Assessment> assessmentList = await assessmentService.getAssessmentListFromLocalDB();
    return assessmentList;
  }

}