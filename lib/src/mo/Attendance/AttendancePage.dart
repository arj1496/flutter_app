import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/mo/Attendance/Attendance.dart';
import 'package:flutter_app/src/mo/Attendance/AttendanceActivity.dart';
import 'package:flutter_app/src/mo/Attendance/GridMonthForstandard.dart';
import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Standard/StandardService.dart';

class AttendanceUIPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AttendancePageUI();
  }
}

class _AttendancePageUI extends State<AttendanceUIPage> {
  @override
  Widget build(BuildContext context) {
    var futureBuilder = new FutureBuilder(
        future: getStandardListFromLocalDB(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return new Text("Loading");
            default:
              if (snapshot.hasError) {
                return new Text('Error:${snapshot.error}');
              } else
                return createStandardList(context, snapshot);
          }
        });

    return Scaffold(
      appBar: AppBar(
        title: Text('Standard list'),
      ),
      body: futureBuilder,
    );
  }

  /* Future<List<Attendance>> getDbAttendance() async {
    AttendanceActivity attendanceActivity = new AttendanceActivity();
    List<Attendance> attendanceListFromFuture =
    await attendanceActivity.getDbAttendance();
    return attendanceListFromFuture;
  }*/
  StandardService standardService = new StandardService();

  Future<List<Standard>> getStandardListFromLocalDB() async {
    List<Standard> standardListFromFuture =
        await standardService.getStandardListFromLocalDB();
    return standardListFromFuture;
  }


  Widget createStandardList(BuildContext context, AsyncSnapshot snapshot) {
    List<Standard> list1 = snapshot.data;
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: list1.length,
      itemBuilder: (context, index) {
        // Standard standard = list1[index];
        return ListTile(
          title: new Card(
            elevation: 5.0,
            child: new Container(
              alignment: Alignment.center,
              margin: new EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: new Text(list1[index].name,style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          onTap: () {
           /* showDialog(
                barrierDismissible: false,
                context: context,
                child: new CupertinoAlertDialog(
                  title: new Column(
                    children: <Widget>[
                      new Text("ListView"),
                      new Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  content: new Text("Selected Item ${list1[index].name}"),
                  actions: <Widget>[
                    new FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: new Text("OK"))
                  ],
                ));*/
           //Navigator.push(context,MaterialPageRoute(builder: (context)=>GridMonthStandard()));
          },
        );
      },
    );
  }

}
