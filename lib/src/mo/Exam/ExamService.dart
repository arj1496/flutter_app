// Service to get exam data as per access rights.
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/ButtonUI.dart';
import 'package:flutter_app/HeaderContainer.dart';
import 'package:flutter_app/PropertyService.dart';
import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:flutter_app/src/mo/Exam/ButtonAccess.dart';
import 'package:flutter_app/src/mo/Exam/Exam.dart';
import 'package:flutter_app/src/mo/Exam/ExamDao.dart';
import 'package:flutter_app/src/mo/Exam/ExamWebService.dart';


import '../../../CardDetail2Oct.dart';
import '../../../DescriptionCustomView.dart';
import '../../../ExamWidget2.dart';
import '../../../MarkWidget.dart';
import '../../../TitleViewDetail.dart';
import '../../../TypeView.dart';
import '../../ButtonUI2.dart';
import 'ExamActivity.dart';
import 'ExamPage.dart';

class ExamService{
  ExamWebService examWebService = new ExamWebService();
  ExamDao examDao = new ExamDao();

  getExam(){
    Exam exam = new Exam();
    exam.id = 1;
    exam.name = 'Matematics' ;
    exam.standardId = 1;
    exam.standardName = "Class  ";
    exam.subjectId = 2 ;
    exam.subjectName = 'computer science and enggineering - ' ;
    exam.examDate = 1571155865;
    exam.totalMark = 20;
    exam.examType ='Term ' ;
    exam.owner = 'Ramlingam';
    exam.description = 'class-1 exam';
    exam.status = 'DRAFT';
    exam.syllabus = 'chapter 1';
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
       widgetList.add(CardDetail2Oct(ExamPage()));
    }
    if(examSecurityCheck.markHeader){
      //widgetList.add(MarkWidget());
    }
    if(examSecurityCheck.gradeBoundry){
      widgetList.add(HeaderContainer.init("Grade Boundry","Grade Level 1 Science and Enginerring mathematics"));
    }
    if(examSecurityCheck.type){
      widgetList.add( TypeView());
    }
    if(examSecurityCheck.syllabus){
      var propertyService = new PropertyService();
      //widgetList.add( TitleViewDetail.init(propertyService.getExamData()),);
     // widgetList.add(DescriptionCustomView.init(propertyService.getExamData()));
    }
    if(examSecurityCheck.description){
      var propertyService = new PropertyService();
     // widgetList.add(TitleViewDetail.init(propertyService.getData()));
      widgetList.add(DescriptionCustomView.init("Hello world"));
    }
    if(examSecurityCheck.result){
      widgetList.add(ButtonAccess());
    }
    /*if(examSecurityCheck.delete){
      widgetList.add();
    }*/

    return widgetList;
  }

  List<Exam> getAllExam(){

    List<Exam> examList = new List();
    for(var i = 1 ; i < 100; i++){
      Exam exam = new Exam();
        exam.id = i;
        exam.name = 'Matematics' + i.toString();
        exam.standardId = i ;
        exam.standardName = "Class  " + i.toString();
        exam.subjectName = 'computer science and enggineering - ' + i.toString();
        exam.examDate = 1571155865;
        exam.totalMark = 20;
        exam.examType ='Term ' + i.toString();
        exam.owner = 'Ramlingam';
        exam.description = 'class-1 exam';
        exam.status = 'DRAFT';
        exam.syllabus = 'chapter 1';
        examList.add(exam);
      }
    return examList;
  }

    // call webservice to add exam to server.
    Future<int> addOrUpdateExam(GenericModel genericModel) async{
      Map<String, dynamic> examData = await examWebService.addOrUpdateExam(genericModel);
      // if the response is true and the examId is present allredy update that exam otherwise add that exam to local database
      if(examData['status']){
        Exam exam = Exam.fromJson(examData['exam']);
        if(genericModel.examId != null) {
          await examDao.updateExam (exam );
        }else{
          await examDao.addExam ( exam );
        }
        return exam.id;
      }else{
        print('Exam Add False');
      }
      return null;
    }

  Future<List<Exam>> getDbExam() async{
    List<Exam> examListFromFuture = await examDao.getDbExam();
    return examListFromFuture;
  }

  Future<List<Exam>> getJoinDbExam() async{
    List<Exam> examListFromFuture = await examDao.getJoinDbExam();
    return examListFromFuture;
  }

  Future<List<Exam>> getSubJoinDbExam() async{
    List<Exam> examListFromFuture = await examDao.getSubJoinDbExam();
    return examListFromFuture;
  }

  List<Widget> getWidget(){
    PropertyService propertyService = new PropertyService();
      List<Widget> examWidget = [
        HeaderContainer.init("Unit Test 1",""),     // For Appbar of evenry page.It constructor contains title which i displayed on header.
       // CardDetail2Oct(ExamWidget2()),            // It display all data in card view with curve corner.the detailwidget is a object of dart file for all details page
       // MarkWidget(),
        HeaderContainer.init("Grade Boundry","Grade Level 1 Science and Enginerring mathematics"), // It display date in blue container
        TypeView(),
      //  TitleViewDetail.init(propertyService.getExamData()),  // It display title of place and description in listview.
        DescriptionCustomView.init("Hello world"),  // Alll place data is displayed in container
       // TitleViewDetail.init(propertyService.getData()),
        DescriptionCustomView.init("Hello world"),
        //ButtonUI2.init('RESULTS','DELETE','CLOSE'),
        // AttachmentView(),                                       // It dispay container in water mark
        // AttachmentFileView(),                                    // This display all atachment in listview.
      ];
       return examWidget;
    }

  Future<List<Exam>> getExamListDataFromServer() async {
    ExamWebService _examWebService = new ExamWebService();

    HashMap map = new HashMap<String, String>();
    map['exam_sync_time'] = 0.toString();

    Map<String, dynamic> examDataFromServer = await _examWebService.getData_(map, "rest/sync/getSyncInfo");
    List<Exam> examList = null;
    if(examDataFromServer['isExamSync']){
      print(examDataFromServer);
      List<dynamic> examsDynamic = examDataFromServer['exams'];
      examList = List.generate(examsDynamic.length, (i){
        Exam exam = Exam.fromJson(examsDynamic[i]);
        return exam;
      });
      ExamService examService = new ExamService();
      await batchAddExam(examList);
    }else{
      print('Exam Sync is false');
    }
    return examList;
  }

  batchAddExam(List<Exam> examList){
    examDao.batchAddExam(examList);
  }

  syncCallBackHandle(Map<String, dynamic> syncDataResponse) async {
    List<dynamic> examsDynamic = syncDataResponse['exams'];
    if(examsDynamic != null && examsDynamic.length > 0){
      List<Exam> examList = List.generate(examsDynamic.length, (i){
        Exam exam = Exam.fromJson(examsDynamic[i]);
        return exam;
      });
      await batchAddExam(examList);
    }

  }

  Future<List<Exam>> getFilterExam(int standardId,int subjectId,String type) async{
    List<Exam> examListFromFuture = await examDao.getFilterExam(standardId, subjectId, type);
    return examListFromFuture;
  }

}
