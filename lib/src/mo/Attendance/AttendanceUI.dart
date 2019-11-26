


import 'package:flutter/material.dart';
import 'package:flutter_app/src/fr/SchoolUtils.dart';
import 'package:flutter_app/src/mo/Attendance/AttendanceBloc.dart';
import 'package:flutter_app/src/mo/Attendance/AttendanceCalendar.dart';

import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Subject/Subject.dart';
import 'package:intl/intl.dart';

class AttendanceUI extends StatefulWidget {
  final AttendanceBloc _attendanceBloc = AttendanceBloc();

  AttendanceUI() {
    this._attendanceBloc;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Attendance();
  }
}

class Attendance extends State<AttendanceUI> {
  SchoolUtils schoolUtils = new SchoolUtils();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Attendance'),
      ),
      body:
          getListOfWidgets(),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
              title: Text("Class Attendance"), icon: Icon(Icons.arrow_drop_up)),
          BottomNavigationBarItem(
              title: Text("Subject Attendance"),
              icon: Icon(Icons.arrow_drop_up)),
         ],
        onTap: (index) {
          if (index == 0) {
            print( "class Attendance Tapped" );
            widget._attendanceBloc.selectiontype.add(Selectattendancetype.classattendance);
          }
          else if(index==1) {
            print( "Subject Attendance  tapped" );
            widget._attendanceBloc.selectiontype.add(Selectattendancetype.subjectattendance);
          }

        },
      ),

    );
  }

  // TODO: implement build

/*  getListOfWidgets() {
    return StreamBuilder<List<Standard>>(
      stream: widget._attendanceBloc.allStandard,
      initialData: List<Standard>(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          List<Standard> standardlist = snapshot.data;
          var length;
          return StreamBuilder<List<Standard>>(
              stream: widget._attendanceBloc.allStandard,
              initialData: List<Standard>(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: standardlist.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          title: new Card(
                          elevation: 5.0,
                          child: new Container(
                          alignment: Alignment.center,
                          margin: new EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: new Text(standardlist[index].name,style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      ),
                      onTap:(){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>GridMonthStandard()));
                      },
                      );
                    },
                  );
                }
              });
        }
      },
    );
  }*/




  getListOfWidgets( ) {
    return StreamBuilder<List<dynamic>>(
      stream: widget._attendanceBloc.allStandard,
      initialData: List<dynamic>(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          List<dynamic> standardlist = snapshot.data;
          var length;
          return StreamBuilder<List<dynamic>>(
              stream: widget._attendanceBloc.allStandard,
              initialData: List<dynamic>(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: standardlist.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: new Card(
                          elevation: 5.0,
                          child: new Container(
                            alignment: Alignment.center,
                            margin: new EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: new Text(standardlist[index].name,style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                        onTap:(){
                          //Navigator.push(context,MaterialPageRoute(builder: (context)=>GridMonthStandard(standardlist[index].name)));
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>AttendanceCalendar(standardlist[index].name)));
                        },
                      );
                    },
                  );
                }
              });
        }
      },
    );
  }
}
