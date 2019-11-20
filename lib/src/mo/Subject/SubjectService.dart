import 'dart:collection';
import 'package:flutter_app/src/mo/Subject/Subject.dart';
import 'package:flutter_app/src/mo/Subject/SubjectDao.dart';
import 'package:flutter_app/src/mo/Subject/SubjectWebservice.dart';
import 'package:flutter_app/src/mo/teacher/Teacher.dart';
import 'package:flutter_app/src/mo/teacher/TeacherDAO.dart';

class SubjectService {
  SubjectWebService subjectWebService = new SubjectWebService();
  SubjectDao subjectDao = new SubjectDao();

  Future addSubjectInServer(Subject subject) async {
    Map<String, dynamic> responseData = await subjectWebService.addSubjectInServer(subject);
    if(responseData['status']){
      Subject subject = Subject.fromJsonServer(responseData['subject']);
      print(subject);
      List<Subject> subjectList = [];
      subjectList.add(subject);
      batchAddSubject(subjectList);
    }
    else{
      print('False');
    }
  }

  Subject addSubject(Subject subject) {
    Subject _subject = subjectDao.addSubject(subject);
  }

  // this method is used to save the List of subjects
  batchAddSubject(List<Subject> subjectList) {
    subjectDao.batchAddSubject(subjectList);
  }



  List<Subject> getSubjectList_() {
    List<Subject> subjectList = null;
    Future<List<Subject>> subjectListFromFuture = subjectDao.getAllSubjectData();
    subjectListFromFuture.then((subjects) {
      subjectList = subjects;
    });
    return subjectList;
  }

  Future<List<Subject>> getSubjectListFromLocalDB() async {
    List<Subject> subjectListFromFuture = await subjectDao.getAllSubjectData();
    return subjectListFromFuture;
  }

  Future<List<Subject>> getSubjectListDataFromServer() async {
    SubjectWebService _subjectWebService = new SubjectWebService();

    HashMap map = new HashMap<String, String>();
    map['subject_sync_time'] = 0.toString();

    Map<String, dynamic> subjectDataFromServer = await _subjectWebService
        .getData_(map, "rest/sync/getSyncInfo");
    List<Subject> subjectList;
    if (subjectDataFromServer['isSubjectSync']) {
      print(subjectDataFromServer);
      List<dynamic> subjectsDynamic = subjectDataFromServer['subjects'];
      subjectList = List.generate(subjectsDynamic.length, (i) {
        Subject subject = Subject.fromJsonServer(subjectsDynamic[i]);
        return subject;
      });
      await batchAddSubject(subjectList);
    } else {
      print('Subject Sync is false');
    }
    return subjectList;
  }


  Future<List<Subject>> getSubjectByStandardId(int standardId) async {
    List<Subject> subjectListFromFuture = await subjectDao
        .getSubjectByStandardId(standardId);
    return subjectListFromFuture;
  }

  syncCallBackHandle(Map<String, dynamic> syncDataResponse) async {
    List<dynamic> subjectsDynamic = syncDataResponse['subjects'];
    if (subjectsDynamic != null && subjectsDynamic.length > 0) {
      List<Subject> subjectList = List.generate(subjectsDynamic.length, (i) {
        Subject subject = Subject.fromJsonServer(subjectsDynamic[i]);
        return subject;
      });
      await batchAddSubject(subjectList);
    }
  }


  List<Subject> getAllSubject() {
    List<Subject> subjectList = new List();
    for (var i = 1; i < 3; i++) {
      Subject subject = new Subject();
      subject.id = i;
      subject.name = 'Matematics' + i.toString();
      subject.standardId = i;
      subjectList.add(subject);
    }
    return subjectList;
  }

  Future<List<Subject>> getAccesibleSubjectList() async {
    /*List<Subject> subjectList = await subjectDao.getAccesibleSubjectList();
    return subjectList;*/
  }

  Future<Subject> getSubjectBySubjectId(int subjectId) async{
    return await subjectDao.getSubjectBySubjectId(subjectId);
  }

}