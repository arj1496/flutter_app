import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:flutter_app/src/mo/Standard/Standard.dart';

import 'Subject.dart';
import 'SubjectService.dart';



class SubjectActivity{
  SubjectService subjectService = new SubjectService();
  Future<List<Subject>> getSubjectListFromLocalDB() async{
    List<Subject> subjectListFromFuture = await subjectService.getSubjectListFromLocalDB();
    return subjectListFromFuture;
  }

  getHardCodedSubjectList(){
    List<Subject> subbList = new List<Subject>();
    for(int i=1; i<= 6; i++){
      Subject subject = new Subject();
      subject.id = i;
      subject.name = "Subject ${i.toString()}";
      Standard standard = new Standard();
      standard.id = i;
      standard.name = "Class ${i.toString()}";
      subject.standard = standard;
      subbList.add(subject);
    }
    return subbList;
  }
  Future<List<Subject>> getSubjectByStandardId(int standardId) async{
    List<Subject> subjectListFromFuture = await subjectService.getSubjectByStandardId(standardId);
    return subjectListFromFuture;
  }

  addSubject(Subject subject, callBack){
    subjectService.addSubjectInServer(subject).then((value){
      callBack();
    });

    /* Future.delayed(Duration(seconds: 5), () {
      callBack();
    });*/
  }
}