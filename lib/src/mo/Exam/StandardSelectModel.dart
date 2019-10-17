import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter_app/src/mo/Exam/ExamActivity.dart';
import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Standard/StandardService.dart';
import 'package:flutter_app/src/mo/Subject/Subject.dart';
import 'package:flutter_app/src/mo/Subject/SubjectService.dart';

class StandardSelectModel extends ChangeNotifier{

  StandardService standardService = new StandardService();
  final List<Standard> _standardList = [];
  List<Subject> _standardSubkectList = [];
  UnmodifiableListView<Standard> get allStandard => UnmodifiableListView(_standardList);
  UnmodifiableListView<Subject> get standardSubjectClass => UnmodifiableListView(_standardSubkectList);

  void changeStandard(Standard std) async{
    //Get Subject From Standard id
    SubjectService subjectService = new SubjectService();
    List<Subject> subjectList = await subjectService.getSubjectByStandardId(std.id);
    _standardSubkectList = [];
    _standardSubkectList.addAll(subjectList);
    notifyListeners();
  }

   void getStandardList(String test) {
    tstFunction();

  }

  void tstFunction() async{
    List<Standard> list = await standardService.getStandardListFromLocalDB();
    _standardList.addAll(list);
    notifyListeners();
  }
}