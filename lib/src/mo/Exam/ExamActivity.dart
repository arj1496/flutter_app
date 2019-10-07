import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/mo/Exam/ExamService.dart';


// This contains only comminaction logic between ui and service .
class ExamActivity{

  getAccessibleWidget() {
    ExamService examService = new ExamService( );
    List<Widget> widgetList = examService.getAccessibleWidget ( );
    return widgetList;
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