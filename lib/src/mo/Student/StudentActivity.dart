import "StudentDetailsWithDialog.dart";

class StudentActivity{

  saveStudentDetail(student, callBack){
    Future.delayed(Duration(seconds: 5), () {
      callBack();
    });
  }


}