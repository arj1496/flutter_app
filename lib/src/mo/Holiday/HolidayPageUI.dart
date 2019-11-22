import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_app/src/fr/SchoolUtils.dart';
import 'package:flutter_app/src/mo/Holiday/AddHoliday.dart';
import 'package:flutter_app/src/mo/Holiday/Holiday.dart';
import 'package:flutter_app/src/mo/Holiday/HolidayActivity.dart';
import 'package:flutter_app/src/mo/Holiday/HolidayAdd.dart';
//import 'package:flutter_app/src/mo/Holiday/HolidayActivity1.dart';
import 'package:flutter_app/src/mo/Holiday/HolidayBloc.dart';
import 'package:flutter_app/src/mo/Holiday/HolidayPage.dart';
import 'package:rxdart/rxdart.dart';
class HolidayPageUI extends StatefulWidget {

  final HolidayActivity _holidayBloc1 = HolidayActivity();
  HolidayPageUI(){
    this._holidayBloc1;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _holidayPageUI();
  }
}


class _holidayPageUI extends State<HolidayPageUI> {

  SchoolUtils schoolUtils = new SchoolUtils();

  List<Widget> _getListViewWithBuilder(BuildContext context, AsyncSnapshot snapshot) {

    Map<String, List<Holiday>> holidayList = snapshot.data;
    List<Widget> wigetList = new List();
    for (String key in holidayList.keys) {
      List<Holiday> holdayList = holidayList[key];
      wigetList.add(getListOfWidgets(context, key, holdayList));
    }
    return wigetList;
  }

//  Future<Map<String, List<Holiday>>> getDbHoliday() async {
//
//    HolidayActivity holidayActivity = new HolidayActivity();
//    Map<String, List<Holiday>> holidayListFromFuture =
//    await holidayActivity.getHolidaysMainList();
//    return holidayListFromFuture;
//  }


  @override
  Widget build(BuildContext context) {


    var streambuilder = new StreamBuilder<Map<String,List<Holiday>>>(
      stream:widget._holidayBloc1.allHoliday,
      initialData: Map<String,List<Holiday>>(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return new Text('loading......');

          default:
            if (snapshot.hasError)
              return new Text('Error:${snapshot.error}');
            else
              //return CreateListView(context,snapshot);
              return Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _getListViewWithBuilder(context, snapshot),

                ),
              );
        }
      },
    );


    return Scaffold(
      appBar: new AppBar(
        title: Text('Holidays List'),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HolidayAdd()));
            },
            child: Text("AddHoliday"),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(

          children: <Widget>[

            Container(

              child: streambuilder,
        ),
      ]
        )
      ),
      bottomNavigationBar: submitButton(),

    );
  }



  getListOfWidgets(BuildContext context, key, holydaylist) {

    return /*Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(

            color: AppTheme.background,
            child:*/Column(

              children: <Widget>[

                Text(
                  key,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: AppTheme.robotoFontName,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    letterSpacing: 0.0,
                    color: AppTheme.nearlyDarkBlue
                        .withOpacity(0.6),
                  ),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: holydaylist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return new Container(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: new Text(
                              holydaylist[index].name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: new Text(schoolUtils
                                .getDateStringFromLongWithSchoolTimeZone(
                                holydaylist[index].startDate)),
                            trailing: Text(
                                '${holydaylist[index].type} \n(end) ${schoolUtils.getDateStringFromLongWithSchoolTimeZone(holydaylist[index].endDate)})'),
                          ),
                          new Divider(
                            height: 2,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
    );
            //)));
  }


  submitButton() {
    return BottomNavigationBar(
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(
            title: Text("School Holidays"), icon: Icon(Icons.arrow_drop_up)),
        BottomNavigationBarItem(
            title: Text("Teachers Holidays"),
            icon: Icon(Icons.arrow_drop_up)),
        BottomNavigationBarItem(
            title: Text("ImportatntDays"), icon: Icon(Icons.arrow_drop_up)),
      ],
      onTap: (index) {
        if (index == 0) {
          print( "School Holydays Tapped" );
          widget._holidayBloc1.holydayselectiontype.add(HolydaySelectionType.school);
        }
        else if(index==1) {
          print( "Teachers holyday tapped" );
          widget._holidayBloc1.holydayselectiontype.add(
              HolydaySelectionType.teacher );
        }
        else {
          print( "Importatnt Days Tapped" );
          widget._holidayBloc1.holydayselectiontype.add(
              HolydaySelectionType.importantDays );
        }
      },
    );

  }


}
