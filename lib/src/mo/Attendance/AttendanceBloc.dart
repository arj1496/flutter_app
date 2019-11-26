
import 'dart:async';

import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Standard/StandardService.dart';
import 'package:flutter_app/src/mo/Subject/Subject.dart' as prefix0;
import 'package:flutter_app/src/mo/Subject/SubjectService.dart';

import 'package:rxdart/rxdart.dart';

enum Selectattendancetype
{
  classattendance,
  subjectattendance,
}
class AttendanceBloc
{
  Stream<List<dynamic>> get allStandard => _standardlist.stream;

  final _standardlist = BehaviorSubject<List<dynamic>>( );

  StandardService standardService=new StandardService();
  SubjectService subjectService=new SubjectService();

  List<dynamic> standard;
/*

  Stream<List<prefix0.Subject>> get allSubject => _subjectlist.stream;

  final _subjectlist = BehaviorSubject<List<prefix0.Subject>>( );

  List<prefix0.Subject> subject;
*/

  Sink<Selectattendancetype> get selectiontype => selectiontypeController.sink;

  final selectiontypeController = StreamController<Selectattendancetype>( );


  getStandardList() {
    Future<List<Standard>> standardListFromFuture = standardService.getStandardListFromLocalDB();
    //List<Holiday> holydasys;
    standardListFromFuture.then( (value) {
      standard = value;
      _standardlist.add(standard);
    } );
  }


  AttendanceBloc() {

  getStandardList( );
    //getSubjectList();
   selectiontypeController.stream.listen( (attendanceselection) {
      if (attendanceselection == Selectattendancetype.classattendance) {
        Future<List<Standard>> standardListFromFuture = standardService.getStandardListFromLocalDB();
        //List<Holiday> holydasys;
        standardListFromFuture.then( (value) {
          standard = value;
          _standardlist.add(standard);
        } );
      }
      else if (attendanceselection == Selectattendancetype.subjectattendance) {
        Future<List<prefix0.Subject>> subjectListFromFuture = subjectService.getSubjectListFromLocalDB();
        //List<Holiday> holydasys;
        subjectListFromFuture.then( (value) {
          standard = value;
          _standardlist.add(standard);
        } );
      }
    } );
  }


}