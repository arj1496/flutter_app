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
    int examObject = await examService.addOrUpdateExam(exam);
    return examObject;
  }
  Future<int> addExamToServer_(  GlobalKey<FormState> formKey,GenericModel genericModel) async{
    print("in examactivity");
    Exam exam = getExamFromGeneric(genericModel);
    int examObject = await examService.addOrUpdateExam(exam);
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

  getExamFromGeneric(GenericModel genericModel){
    Exam exam = new Exam();
    exam.id = genericModel.examId;
    exam.name = genericModel.title;
    exam.standardId = genericModel.classId ;
    exam.standardName = "Science";
    exam.subjectId = genericModel.subjectId ;
    exam.subjectName = 'computer science and enggineering - ' ;
    exam.examDate = genericModel.date;
    exam.totalMark = 20;
   // exam.examType =genericModel.examType ;
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