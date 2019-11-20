import 'package:flutter/material.dart';
import 'package:flutter_app/src/fr/SchoolUtils.dart';
import 'package:flutter_app/src/mo/Holiday/Holiday.dart';
import 'package:flutter_app/src/mo/Holiday/HolidayActivity.dart';
import 'package:flutter_app/src/mo/Holiday/HolidayActivity1.dart';
import 'package:flutter_app/src/mo/Holiday/Teacher.dart';
import 'package:flutter_app/src/mo/Holiday/TeacherBloc.dart';
import 'package:flutter_app/src/mo/Student/Student.dart';


import '../../../AppTheme.dart';

class HolidayPage extends StatefulWidget {
  final HolidayBloc1 _holidayBloc1 = HolidayBloc1();


  HolidayPage() {
    this._holidayBloc1;

  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Holidaypage();
  }
}

class Holidaypage extends State<HolidayPage> {
  SchoolUtils schoolUtils = new SchoolUtils();

//  List<Widget> _getListViewWithBuilder(
//      BuildContext context, AsyncSnapshot snapshot) {
//    Map<String, List<Holiday>> holidayList = snapshot.data;
//    List<Widget> wigetList = new List();
//    for (String key in holidayList.keys) {
//      List<Holiday> holdayList = holidayList[key];
//      wigetList.add(getListOfWidgets());
//      //wigetList.add(getHolidayList());
//    }
//    return wigetList;
//  }

//  Future<Map<String, List<Holiday>>> getDbHoliday() async {
//    HolidayActivity holidayActivity = new HolidayActivity();
//    Map<String, List<Holiday>> holidayListFromFuture =
//    await holidayActivity.getDbHoliday();
//    return holidayListFromFuture;
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Working with bLoc'),
      ),
      body:   getListOfWidgets(),
      bottomNavigationBar: Row(
        children: <Widget>[
          Expanded(
              child: RaisedButton(
                  child: Text('School Holidays'), onPressed: () {
                widget._holidayBloc1.getHolidayList(1);
              })),
          Expanded(
              child: RaisedButton(
                  child: Text('Teachers Holidays'), onPressed:(){
                widget._holidayBloc1.getHolidayList(2);
              })),
          Expanded(
              child:
              RaisedButton(child: Text('Important Days'), onPressed: () {}))
        ],
      ),
    );
  }

    // TODO: implement build


  getListOfWidgets() {
    return StreamBuilder<List<Holiday>>(
      stream: widget._holidayBloc1.allHoliday,
      initialData: List<Holiday>( ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator( ),
          );
        } else {
          List<Holiday> holidaylist = snapshot.data;
          var length;
          return StreamBuilder<List<Holiday>>(
              stream: widget._holidayBloc1.allHoliday,
              initialData: List<Holiday>( ),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: new Text(
                                snapshot.data[index].name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: new Text(schoolUtils
                                  .getDateStringFromLongWithSchoolTimeZone(
                                  snapshot.data[index].startDate)),
                              trailing: Text(
                                  '${snapshot.data[index].type} \n(end) ${schoolUtils.getDateStringFromLongWithSchoolTimeZone(snapshot.data[index].endDate)})'),
                            ),
                            new Divider(
                              height: 2,
                            )
                          ],
                        ),
                      );
                    },
                  );
                }
              } );
        }
      },
    );
  }


}
