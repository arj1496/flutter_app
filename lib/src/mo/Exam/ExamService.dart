import 'package:flutter/cupertino.dart';
import 'package:flutter_app/ButtonUI.dart';
import 'package:flutter_app/HeaderContainer.dart';
import 'package:flutter_app/PropertyService.dart';
import 'package:flutter_app/src/mo/Exam/ButtonAccess.dart';
import 'package:flutter_app/src/mo/Exam/Exam.dart';
import 'package:flutter_app/src/mo/Exam/ExamSecurityCheck.dart';

import '../../../CardDetail2Oct.dart';
import '../../../DescriptionCustomView.dart';
import '../../../MarkWidget.dart';
import '../../../TitleViewDetail.dart';
import '../../../TypeView.dart';
import 'ExamActivity.dart';
import 'ExamPage.dart';

class ExamService{

  getExam(){
    Exam exam = new Exam();
    return exam;
  }
  getSecurity(){
    ExamSecurityCheck securityCheck = new ExamSecurityCheck();
    securityCheck.header = false;
    securityCheck.detail = true;
    securityCheck.markHeader = false;
    securityCheck.gradeBoundry = false;
    securityCheck.type = false;
    securityCheck.syllabus = true;
    securityCheck.description = true;
    securityCheck.result = true;
    securityCheck.delete = false;
    return securityCheck;
  }

  // only accessible widget is added into list of widgetList.
  getAccessibleWidget(){
    ExamSecurityCheck examSecurityCheck = getSecurity();
    List<Widget> widgetList = new List();

    if(examSecurityCheck.header){
      widgetList.add(HeaderContainer.init("Unit Test - 1","Result Published"));
    }
    if(examSecurityCheck.detail){
       List<Widget> exWidget3= [ExamPage(),];
       widgetList.add(CardDetail2Oct(exWidget3));
    }
    if(examSecurityCheck.markHeader){
      widgetList.add(MarkWidget());
    }
    if(examSecurityCheck.gradeBoundry){
      widgetList.add(HeaderContainer.init("Grade Boundry","Grade Level 1 Science and Enginerring mathematics"));
    }
    if(examSecurityCheck.type){
      widgetList.add( TypeView());
    }
    if(examSecurityCheck.syllabus){
      var propertyService = new PropertyService();
      widgetList.add( TitleViewDetail.init(propertyService.getExamData()),);
      widgetList.add(DescriptionCustomView.init(propertyService.getExamData()));
    }
    if(examSecurityCheck.description){
      var propertyService = new PropertyService();
      widgetList.add(TitleViewDetail.init(propertyService.getData()));
      widgetList.add(DescriptionCustomView.init(propertyService.getData()));
    }
    if(examSecurityCheck.result){
      widgetList.add(ButtonAccess());
    }
    /*if(examSecurityCheck.delete){
      widgetList.add();
    }*/

    return widgetList;
  }
}