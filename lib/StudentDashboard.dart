import 'package:flutter/material.dart';
import 'AllStudentcount.dart';
import 'DivisionGrade.dart';


class StudentDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student DashBoard"),
      ),
      body: _getContainerBasedTile(),
    );
  }

  Widget _getContainerBasedTile() {
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
