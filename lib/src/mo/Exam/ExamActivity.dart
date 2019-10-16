import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/mo/Exam/ExamService.dart';

import 'Exam.dart';


// This contains only comminaction logic between ui and service .
class ExamActivity{
  ExamService examService = new ExamService( );
  getAccessibleWidget() {

    List<Widget> widgetList = examService.getAccessibleWidget ( );
    return widgetList;
  }

   Future<Exam> addExamToServer(Exam exam) async{
    print("in examactivity");
    Exam examObject = await examService.addOrUpdateExam(exam);
    return examObject;
  }

  Future<List<Exam>> getDbExam() async{
    List<Exam> examListFromFuture = await examService.getDbExam();
    return examListFromFuture;
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