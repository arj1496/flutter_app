import 'package:flutter/material.dart';
import 'package:flutter_app/src/mo/Analytics/Analytics.dart';
import 'package:flutter_app/src/mo/Analytics/AnalyticsActivity.dart';
import 'AllStudentcount.dart';
import 'DivisionGrade.dart';


class StudentDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    AnalyticsActivity analyticsActivity = new AnalyticsActivity();
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
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget>[
            AllStudentCount(),
            DivisionGrade(),
          ],
                ),
              ),
            );
  }
}
