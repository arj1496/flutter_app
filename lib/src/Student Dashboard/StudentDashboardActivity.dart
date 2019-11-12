class StudentDashboardActivity{


  List<dynamic> getDivisionGradeClassListMap(dataDump, List<dynamic> divisions, Map<int, Map<int, List<int>>> divGradeClassList, Map<int, List<int>> divisionClassListMap) {

    List<dynamic> data = new List();

    Map<int, dynamic> gradeDetailsMap = getGradeDetailsMap(dataDump['gradeWiseStudentCount']);
    Map<int, dynamic> classDetailsMap = getClassDetailsMap(dataDump['classWiseStudentCount']);

    for(int i = 0; i < divisions.length; i++){
      if(divGradeClassList != null && divGradeClassList[divisions[i]['id']] != null && divGradeClassList[divisions[i]['id']].length > 0){
        Map<int, List<int>> gradeClassListMap = divGradeClassList[divisions[i]['id']];

        Map<String, dynamic> divisionGradeClassListMap = new Map();

        divisionGradeClassListMap['id'] = divisions[i]['id'];
        divisionGradeClassListMap['name'] = divisions[i]['name'];
        divisionGradeClassListMap['gradeList'] = getGradeDetailsList(gradeDetailsMap, classDetailsMap, gradeClassListMap);
        List<int> divisionClassList = divisionClassListMap[divisions[i]['id']];
        divisionGradeClassListMap['classList'] = getClassDetailsList(divisionClassList, classDetailsMap);
        data.add(divisionGradeClassListMap);
      }
    }
    return data;
  }

  Map<int, dynamic> getGradeDetailsMap(List<dynamic> gradeDetailsList) {
    Map<int, dynamic> gradeDetailsMap = new Map();
    for(int i = 0; i < gradeDetailsList.length; i++){
      gradeDetailsMap[gradeDetailsList[i]['gardeId']] = gradeDetailsList[i];
    }
    return gradeDetailsMap;
  }

  Map<int, dynamic> getClassDetailsMap(List<dynamic> classDetailsList) {
    Map<int, dynamic> classListMap = new Map<int, dynamic>();
    for(int i= 0; i < classDetailsList.length; i++){
      classListMap[classDetailsList[i]['classId']] = classDetailsList[i];
    }
    return classListMap;
  }

  getGradeDetailsList(Map<int, dynamic> gradeDetailsMap, Map<int, dynamic> classDetailsMap, Map<int, List<int>> gradeClassListMap ) {

    List<dynamic> gradeDetailsList = new List();
    if(gradeClassListMap != null && gradeClassListMap.length > 0){
      for(int gradeId in gradeClassListMap.keys){
        List<int> classList = gradeClassListMap[gradeId];
        Map<String, dynamic> gradeDetail = gradeDetailsMap[gradeId];
        gradeDetail['classList'] = getClassDetailsList(classList, classDetailsMap);
        gradeDetailsList.add(gradeDetail);
      }
    }
    return gradeDetailsList;
  }

  getClassDetailsList(List<int> classList, Map<int, dynamic> classDetailsMap) {

    List<dynamic> classDetailsList = new List();
    if(classList != null && classList.length > 0){
      for(int i = 0; i < classList.length; i++){
        int classId = classList[i];
        Map<String, dynamic> classDetail = classDetailsMap[classId];
        classDetailsList.add(classDetail);
      }
    }
    return classDetailsList;
  }




}