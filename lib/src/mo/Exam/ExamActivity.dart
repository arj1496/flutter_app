import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:flutter_app/src/mo/Exam/ExamService.dart';
import 'Exam.dart';


// This contains only comminaction logic between ui and service .
class ExamActivity{
  ExamService examService = new ExamService( );
  getAccessibleWidget() {

    List<Widget> widgetList = examService.getAccessibleWidget ( );
    return widgetList;
  }

   Future<int> addExamToServer(Exam exam) async{
    print("in examactivity");
   // int examObject = await examService.addOrUpdateExam(exam);
   // return examObject;
  }
  // Pass all data from exam add page in the form of generic model.
  Future<int> addExamToServer_(  GlobalKey<FormState> formKey,GenericModel genericModel) async{
    print("in examactivity");
    Exam exam = getExamFromGeneric(genericModel);
    int examObject = await examService.addOrUpdateExam(genericModel);
    return examObject;
  }

  Future<List<Exam>> getDbExam() async{
    List<Exam> examListFromFuture = await examService.getDbExam();
    return examListFromFuture;
  }

  Future<List<Exam>> getJoinDbExam() async{
    List<Exam> examListFromFuture = await examService.getJoinDbExam();
    return examListFromFuture;
  }

  Future<List<Exam>> getFilterExam(int standardId,int subjectId,String type) async{
    List<Exam> examListFromFuture = await examService.getFilterExam(standardId, subjectId, type);
    return examListFromFuture;
  }

  getAccessRights(Exam exam){
    //return map of variable<string,string>
  }
  // Prepare exam object from generic model.
  getExamFromGeneric(GenericModel genericModel){
    Exam exam = new Exam();
    exam.id = genericModel.examId;
    exam.name = genericModel.title;
    exam.standardId = genericModel.classId ;
    exam.standardName = "Science";
    exam.subjectId = genericModel.subjectId ;
    exam.subjectName = 'computer science and enggineering - ' ;
    exam.examDate = genericModel.date;
    exam.totalMark =genericModel.totalMarks;
    exam.owner = 'Ramlingam';
    exam.description = genericModel.description;
    exam.syllabus = genericModel.syllabus;
    return exam;
  }
}

// This class contain variables for all the fields of exam detail page widget.
class ExamSecurityCheck{
  bool header;
  bool detail;
  bool markHeader;
  bool gradeBoundry;
  bool type;
  bool syllabus;
  bool description;
  bool delete;
  bool result;
  bool close;
}