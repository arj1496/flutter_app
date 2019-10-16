import 'Subject.dart';
import 'SubjectService.dart';



class SubjectActivity{
  SubjectService subjectService = new SubjectService();
  Future<List<Subject>> getSubjectListFromLocalDB() async{
    List<Subject> subjectListFromFuture = await subjectService.getSubjectListFromLocalDB();
    return subjectListFromFuture;
  }

  Future<List<Subject>> getSubjectByStandardId(int standardId) async{
    List<Subject> subjectListFromFuture = await subjectService.getSubjectByStandardId(standardId);
    return subjectListFromFuture;
  }
}