import 'package:flutter/material.dart';
import 'package:flutter_app/src/Student%20Dashboard/DivisionStudentsCount.dart';
import 'package:flutter_app/src/Student%20Dashboard/StudentDashboardActivity.dart';
import 'package:flutter_app/src/mo/Analytics/Analytics.dart';
import 'package:flutter_app/src/mo/Analytics/AnalyticsActivity.dart';
import 'AllStudentcount.dart';
import 'ClassStudentsCount.dart';
import 'DivisionGrade.dart';

class StudentDashboard extends StatelessWidget {
  StudentDashboard();

  AnalyticsActivity analyticsActivity = new AnalyticsActivity();

  @override
  Widget build(BuildContext context) {
    Future<Map<String, dynamic>> analyticsList = analyticsActivity.getAnalytics();
    var futureBuilder = new FutureBuilder(
        future: analyticsList,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return new Text('Input a URL to start');
            case ConnectionState.waiting:
              return new Center(child: new CircularProgressIndicator());
            default:
              if (snapshot.hasError)
                return new Text('Error: ${snapshot.error}');
              else
                return _getContainerBasedTile(context, snapshot);
          }
        });

    return Scaffold(
      appBar: AppBar(
        title: Text("Student DashBoard"),
      ),
      body: futureBuilder,
      //_getContainerBasedTile(),
    );
  }

  Widget _getContainerBasedTile(BuildContext context, AsyncSnapshot snapshot) {
    var test = snapshot.data;

    var dataDump = test['dataDumpMap'];
    var divGradeClassList = test["divisionGradeClassListMap"];
    List<dynamic> divisions = test['divisionList'];
    Map<int, List<int>> divisionClassList = test["divisionClassListMap"];

    //get Division List from server
    //For loop of Divission
    return ListView(
      children: getAllWidgets(dataDump, divisions, divGradeClassList, divisionClassList),
    );
  }

  List<Widget> getAllWidgets(dataDump, List<dynamic> divisions, divGradeClassList, Map<int, List<int>> divisionClassList ) {

    List<Widget> widgetList = new List();

    // perfect
    widgetList.add( AllStudentCount(data: dataDump['totalStudentCount']));

    // perfect
    widgetList.add(ClassStudentsCount(
      title:"Grade Students Count",
      list: dataDump['onlyInGradeStudentCount'],
    ));

  StudentDashboardActivity studentDashboardActivity = new StudentDashboardActivity();
  List<dynamic> data = studentDashboardActivity.getDivisionGradeClassListMap(dataDump, divisions, divGradeClassList, divisionClassList);
    Widget widget = DivisionGrade(
      dataList : data,
      /* dataObject: divisions[i],
          classDetailsList: dataDump['classWiseStudentCount'], //classWiseStudentCount
          gradeDetailList: dataDump['gradeWiseStudentCount'], //gradeWiseStudentCount
          gradeClassListMap: divGradeClassList[divisions[i]['id']],*/
      //divisionClassList : //divisionClassList[divisions[i]['id']],
    );
    if(widget != null){
      widgetList.add(widget);
    }


   /* widgetList.add(DivisionStudentsCount(
      title: "Division Students Count",
    ));*/
    return widgetList;
  }
}
