import 'package:flutter/material.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_app/src/mo/Student/Student.dart';
import 'package:flutter_app/src/mo/Student/StudentActivity.dart';
import 'package:flutter_app/src/mo/TimeTable/LessonPlanWebView.dart';
import 'package:flutter_app/src/mo/TimeTable/TimeTable.dart';
import 'package:flutter_app/src/mo/TimeTable/TimeTableActivity.dart';
import 'package:flutter_app/src/mo/TimeTable/TimeTableAttendanceUI.dart';


class TimeTableListPage extends StatefulWidget {
  @override
  _TimeTableListPageState createState() => _TimeTableListPageState();
}

class _TimeTableListPageState extends State<TimeTableListPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getTimetableListFromLocalDb() async {
    TimeTableActivity timeTableActivity = new TimeTableActivity();
    return await timeTableActivity.getTimetableListFromLocalDb();
  }

  @override
  Widget build(BuildContext context) {
    var futureBuilder = new FutureBuilder(
        future: getTimetableListFromLocalDb(),
        builder: (context, snapShot) {
          switch (snapShot.connectionState) {
            case ConnectionState.none:
              return new Text('Input a URL to start');
            case ConnectionState.waiting:
              return new Center(child: new CircularProgressIndicator());
            default:
              if (snapShot.hasError)
                return new Text('Error: ${snapShot.error}');
              else
                return getTimeTableListWidget(context, snapShot);
          }
        });

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        title: Text("Time-Tables"),
      ),
      body: futureBuilder,
      /*bottomNavigationBar: BottomNavigationBar(
        //currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.navigate_before),
            title: new Text('Previous'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.markunread_mailbox),
            title: new Text('My TimeTable'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.navigate_next),
              title: Text('Next')
          )
        ],
      ),*/
    );
  }

  Widget getTimeTableListWidget(BuildContext context, AsyncSnapshot snapShot) {
    List<TimeTable> timeTableList = snapShot.data;
    return GestureDetector(
      onTap: (){
        print("gester Called");
      },
      child: ListView(
        children: getAllWidgets(timeTableList),
      ),
    );
  }

  List<Widget> getAllWidgets(List<TimeTable> timeTableList) {
    List<Widget> widgetList = new List();
    List.generate(timeTableList.length, (i) {
      Widget widget = getWidget(timeTableList[i]);
      if (widget != null) {
        widgetList.add(widget);
      }
    });
    return widgetList;
  }

  Widget getWidget(TimeTable timeTable) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 10, right: 10, top: 3, bottom: 3
      ),
      // This is the Main Table Container
      child: Container(
        // given Box Shadow to the Container
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
              topRight: Radius.circular(8.0)
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: AppTheme.grey.withOpacity(0.2),
                offset: Offset(1.1, 1.1),
                blurRadius: 10.0
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding:
              const EdgeInsets.only(top: 5, left: 5, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 4, bottom: 1,top: 5),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 4, bottom: 3
                            ),
                            child: Text(
                              timeTable.time.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: AppTheme.robotoFontName,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
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
            // this Padding is Used to render the Horizontal line Starts
            getHorizontalLine(AppTheme.background),
            // this Padding is Used to render the Horizontal line Ends
            getClassAndSubjectDetail(timeTable),
            getHorizontalLine(AppTheme.background),
            getAttendanceAndLessonPlanContainer(timeTable),
          ],
        ),
      ),
    );
  }

  Widget getHorizontalLine(Color color) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 5, right: 5, top: 8, bottom: 8
      ),
      child: Container(
        height: 2,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
    );
  }

  getClassAndSubjectDetail(TimeTable timeTable) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 10, right: 10, top: 3, bottom: 8
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  timeTable.standard != null ? timeTable.standard.name.toString() : "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppTheme.robotoFontName,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    letterSpacing: -0.2,
                    color: AppTheme.darkText,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    'Class',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppTheme.robotoFontName,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: AppTheme.grey.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  timeTable.subject != null ? timeTable.subject.name.toString() : "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppTheme.robotoFontName,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    letterSpacing: -0.2,
                    color: AppTheme.darkText,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    'Subject',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppTheme.robotoFontName,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: AppTheme.grey.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getAttendanceAndLessonPlanContainer(TimeTable timeTable) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 10, right: 10, top: 3, bottom: 8
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: (){
                print("Attendacne Clicked");
                getTimeTableAttendanceUI(timeTable);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.check_circle_outline,
                    size: 18,
                  ),
                  SizedBox(width: 2),
                  Text(
                    "Attendance",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppTheme.robotoFontName,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: -0.2,
                      color: AppTheme.darkText,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: (){
                print("Lesson Plan Clicked");
                getLessonPlanWebView(timeTable);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Icon(
                      Icons.playlist_play,
                    size: 22,
                  ),
                  SizedBox(width: 2,),
                  Text(
                    "LessonPlan",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppTheme.robotoFontName,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: -0.2,
                      color: AppTheme.darkText,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  getTimeTableAttendanceUI(TimeTable timeTable) async{
    StudentActivity studentActivity = new StudentActivity();
    List<Student> studentList = await studentActivity.getAllStudentsByClassIdFromLocalDB(timeTable.standard.id);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => TimeTableAttendanceUI(
          standard: timeTable.standard,
              studentDataList: studentList
          )
      ),
    );

  }

  getLessonPlanWebView(TimeTable timeTable) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LessonPlanWebView()
      ),
    );
  }
}
