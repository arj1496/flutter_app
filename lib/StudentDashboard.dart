import 'package:flutter/material.dart';
import 'package:flutter_app/src/mo/Analytics/Analytics.dart';
import 'package:flutter_app/src/mo/Analytics/AnalyticsActivity.dart';
import 'AllStudentcount.dart';
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
          return _getContainerBasedTile(context, snapshot);
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

    var datadump = test["dataDumpMap"];
    var divgradeclasslist = test["divisionGradeClassListMap"];
    List<dynamic> divisions = test['divisionList'];
    //get Division List from server
    //For loop of Divission
    return ListView(
      children: getAllWidgets(datadump, divisions, divgradeclasslist),
    );
  }

  List<Widget> getAllWidgets(datadump, List<dynamic> divisions, divgradeclasslist) {

    List<Widget> widgetList = new List();
    widgetList.add( AllStudentCount(data: datadump['totalStudentCount']));
    List.generate(divisions.length, (i){
      Widget widget = DivisionGrade(
          dataObject: divisions[i],
          classDetailsMap: datadump['classWiseStudentCount'], //classWiseStudentCount
          gradeDetailMap: datadump['gradeWiseStudentCount'], //gradeWiseStudentCount
          gradeClassListMap: divgradeclasslist[divisions[i]['id']]
      );
      if(widget != null){
        widgetList.add(widget);
      }
    });

    return widgetList;
  }
}
