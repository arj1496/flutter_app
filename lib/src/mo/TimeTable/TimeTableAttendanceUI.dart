import 'package:flutter/material.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Student/Student.dart';

class TimeTableAttendanceUI extends StatefulWidget {

  final Standard standard;
  final List<Student> studentDataList;
  const TimeTableAttendanceUI({
    this.standard,
    this.studentDataList
  });

  @override
  _TimeTableAttendanceUIState createState() => _TimeTableAttendanceUIState();
}

class _TimeTableAttendanceUIState extends State<TimeTableAttendanceUI> {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.standard.name),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.sync),
            tooltip: "Refresh",
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            tooltip: "More",
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: ListView(
          children: getAllWidgets()
        ),
      ),


    );
  }

  List<Widget> getAllWidgets() {
    List<Widget> widgetList = new List();

    List<Student> studentList = widget.studentDataList;
    List.generate(studentList.length, (i){
      Widget singleWidget = getSingleContainerWidget(widget.studentDataList[i]);
      widgetList.add(singleWidget);
    });
    return widgetList;
  }

  Widget getSingleContainerWidget(Student student) {
    return Padding(
      padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 3, bottom: 3),
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
        child: getListTile(student),
      ),
    );
  }

  Widget getListTile(Student student) {
    return ListTile(
      leading: GestureDetector(
        onTap: () {},
        child: getLeadingIcon(student),
      ),
      title: GestureDetector(
        onTap: () {},
        child: _studentFullName(student),
      ),
      subtitle: GestureDetector(
        onTap: () {},
        child: _details(student),
      ),
      trailing: GestureDetector(
        onTap: (){},
        child: getTrailingButton(),
      ),
    );
  }

  getLeadingIcon( Student student ) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        width: 50.0,
        child: Column(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Text(student.firstName.substring(0, 1)),
              ),
            ]
        ),
      ),
    );
  }

  Widget _studentFullName(Student student) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 1, top: 5),
          ),
          //child:
          Text(
            student.firstName + " " + student.lastName,
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
    );
  }

  Widget _details(Student student) {
    return Column(
      children: <Widget>[
        // this code for line
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 8, bottom: 8),
          child: Container(
            height: 2,
            decoration: BoxDecoration(
              color: AppTheme.background,
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            ),
          ),
        ),
        Padding(
          padding:
          const EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 8),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      student.standard != null
                          ? student.standard.name
                          : "Class - 1",
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
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          student.rollNo != null
                              ? student.rollNo.toString()
                              : " ",
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getTrailingButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        width: 50.0,
        child: Column(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Text("P"),
              ),
            ]
        ),
      ),
    );
  }


}
