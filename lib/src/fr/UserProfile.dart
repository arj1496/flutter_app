
import 'package:flutter_app/src/fr/UserProfileDao.dart';
import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Subject/Subject.dart';

class UserProfile{

  UserProfileDao _userProfileDao = new UserProfileDao();

  // Get the AccessibleClasses of Logged in User
  Future<List<Standard>> getAccessibleClasses() async{
    List<Standard> standardList = await _userProfileDao.getAcceessibleStandardsFromLocalDB();
    print("Accessible standards : ${standardList.length}");
    return standardList;
  }

  // Get the AccessibleSubjects of Logged in User
  Future<List<Subject>> getAccessibleSubjects() async{
    List<Subject> subjectList = await _userProfileDao.getAcceessibleSubjectsFromLocalDB();
    print("Accessible Subjects : ${subjectList.length}");
    return subjectList;
  }

  // Get the AccessibleGrades of Logged in User
  List<int> getAccessibleGrades(){

  }

  // Get the AccessibleDivisions of Logged in User
  List<int> getAccessibleDivisions(){

  }

  // get the emailId of Logged in User
  Future<String> getEmailId() async{
    String emailid = await _userProfileDao.getEmailIdFromLocalDB();
    print("Email Id : ${emailid}");
    return emailid;
  }

  // get the Role of Logged in User
  String getUserRole(){

  }

  // get the Students of Logged in parent
  List<int> getParentStudentIds(){

  }

  // get the Student EmailId of Logged in User
  String getStudentEmail(){

  }

  // get the Permissions of Logged in User
  List<String> getAccessPermissions(){

  }

  // get the Parents of Logged in Student
  List<int> getStudentParents(){

  }
}