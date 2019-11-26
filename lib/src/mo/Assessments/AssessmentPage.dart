import 'dart:convert';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/mo/Assessments/Assessment.dart';
import 'package:flutter_app/src/mo/Assessments/AssessmentActivity.dart';
import '../../../AppTheme.dart';
import 'ObservationPage.dart';


class AssessmentPage extends StatefulWidget {
  @override
  _AssessmentPageState createState() => _AssessmentPageState();
}

class _AssessmentPageState extends State<AssessmentPage> {
  Assessment assessment = new Assessment();
  @override
  Widget build(BuildContext context) {

    AssessmentActivity assessmentActivity = new AssessmentActivity();
    Future<List<Assessment>> assessmentList = assessmentActivity.getAssessmentListFromLocalDB();
    var futureBuilder = new FutureBuilder(
      future: assessmentList,
      builder: (BuildContext context, AsyncSnapshot snapshot){
         return assessmentListView(context, snapshot);
      },
    );

    return Scaffold(
      appBar: new AppBar(
        title: Text('Assessments'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.sync),
            onPressed: () {
              /* AssessmentActivity assessmentActivity = new AssessmentActivity();*/
              Future<List<Assessment>> assess = assessmentActivity
                  .getAssessmentListFromLocalDB();
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
      body: futureBuilder, //assessmentListView(),
    );
  }
}


Widget assessmentListView(BuildContext context, AsyncSnapshot snapshot) {
  List<Assessment> assessmentList = snapshot.data;
  return Container(
    child: ListView.builder(
        itemCount: assessmentList != null ? assessmentList.length : 0,
        itemBuilder: (BuildContext context, int index){
          return assessmentList != null && assessmentList.length > 0
              ? skills(assessmentList[index], context)
              : _listNotFound();
        }),
  );
}


skills(Assessment assessment, BuildContext context) {
  return GestureDetector(
    onTap: () {
      print("hello");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ObservationPage(
            object: assessment,
          ),
        ),
      );


      // createAlertDialogBox(context, subject);
    },
    child: Padding(
      padding:
      const EdgeInsets.only(left: 5.0, right: 5.0, top: 3, bottom: 3),
      // This is the Main Table Container
      child: Container(
        // given Box Shadow to the Container
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
              topRight: Radius.circular(8.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: AppTheme.grey.withOpacity(0.2),
                offset: Offset(1.1, 1.1),
                blurRadius: 10.0),
          ],
        ),
        child:_listtile(assessment),
      ),
    ),
  );
}

Widget _listtile(Assessment assessment) {
  return ListTile(
    title:  skillName(assessment),
    subtitle: subjectName(assessment),
    trailing: dateAndTerm(assessment),
  );
}

Widget skillName(Assessment assessment) {
  return Padding(
    padding: const EdgeInsets.only(left:0.0),
    child: Container(
      alignment: AlignmentDirectional.topStart,
      child: Column(
        children: <Widget>[
          Text(
            assessment.title != null
                ? assessment.title.toString()
                : " ",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: AppTheme.robotoFontName,
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: AppTheme.nearlyDarkBlue,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget subjectName(Assessment assessment) {
  return Padding(
    padding: const EdgeInsets.only(top:20.0),
    child: Row(
      children: <Widget>[
        Text(
          assessment.subjectName != null
              ? assessment.subjectName.toString()
              : " ",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: AppTheme.robotoFontName,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            letterSpacing: -0.2,
            color: AppTheme.darkText,
          ),
        )
      ],
    ),
  );
}

Widget dateAndTerm(Assessment assessment) {
  return Column(
      children: <Widget>[
        Text(
          "Date",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontFamily: AppTheme.robotoFontName,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            letterSpacing: -0.2,
            color: AppTheme.darkText,
          ),
        ),
        term(assessment),
      ]
  );
}

Widget term(Assessment assessment) {
  return Padding(
    padding: const EdgeInsets.only(top:20.0),
    child: Column(
      children: <Widget>[
        Text(
          assessment.termName != null
              ? assessment.termName.toString()
              : " ",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: AppTheme.robotoFontName,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            letterSpacing: -0.2,
            color: AppTheme.darkText,
          ),
        )
      ],
    ),
  );
}


Widget _listNotFound() {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
    child: Container(
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0),
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),
            topRight: Radius.circular(8.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: AppTheme.grey.withOpacity(0.2),
              offset: Offset(1.1, 1.1),
              blurRadius: 10.0),
        ],
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 5, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 4, bottom: 3),
                          child: Text(
                            'Event Not Found',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: AppTheme.robotoFontName,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: AppTheme.nearlyDarkBlue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}