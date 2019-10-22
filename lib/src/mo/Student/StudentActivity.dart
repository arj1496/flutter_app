
class StudentActivity{

  saveStudentDetail(student, callBack){
    Future.delayed(Duration(seconds: 15), () {
      callBack();
    });
  }


}