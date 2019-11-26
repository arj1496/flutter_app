
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app/src/mo/Attendance/BlocForChangeMonth.dart';
import 'package:flutter_app/src/mo/Attendance/StudentListPage.dart';

import 'package:intl/intl.dart';

class GridMonthStandard extends StatelessWidget{

  MonthBloc monthBloc = new MonthBloc( );
  String name;
  GridMonthStandard(String name1) {
    this.name=name1;
    this.monthBloc;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: new AppBar(
        title:Text(name),
    ),
    body: GridForStandard(),
    bottomNavigationBar:
    submitButton()
    );
  }


  GridForStandard() {
    return StreamBuilder<List<int>>(
        stream: this.monthBloc.allDays,
        //initialData: [],
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.hasData){
            return GridView.builder(
                itemCount: snapshot.data.length,

                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  return new GestureDetector(
                      child: new Card(
                        // elevation: 3.0,
                        child: new Container(
                          alignment: Alignment.center,
                          child: new Text('${index + 1}'),
                        ),
                      ),
                      onTap: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentUIList()));
                      }
                  );
                });
          }else{
            return Container(

            );
          }

        });
  }

  submitButton() {
    DateFormat month_date = new DateFormat( "MMMM" );
    var currentmonth = DateTime.now( );
    // var now = DateTime.now();
    print(daysInMonth(currentmonth));
    //print( currentmonth.day );
    var days = currentmonth.add( new Duration( days: 0 ) );
    print( days );


    String month_name = month_date.format(currentmonth);
    String monthKey = month_name + " " + currentmonth.year.toString();
    return BottomAppBar(
      child: Row(
        children: <Widget>[
          new Expanded(
            child: new RaisedButton(
              color: Colors.lightBlueAccent,
              child: Text('Prev'),
              onPressed: () {
                this.monthBloc.selectiontype.add(selectMonth.prev);
              },
            ),
          ),
          new Expanded(
            child: new RaisedButton(
              color: Colors.lightBlueAccent,
              child: Text('$monthKey'),
              onPressed: () {
                this.monthBloc.selectiontype.add(selectMonth.current);
              },
            ),
          ),
          new Expanded(
            child: new RaisedButton(
              color: Colors.lightBlueAccent,
              child: Text(' Next'),
              onPressed: () {
                this.monthBloc.selectiontype.add(selectMonth.next);
              },
            ),
          )
        ],
      ),
    );
  }

  int daysInMonth(DateTime date){
    var firstDayThisMonth = new DateTime(date.year, date.month, date.day);
    var firstDayNextMonth = new DateTime(firstDayThisMonth.year, firstDayThisMonth.month + 1, firstDayThisMonth.day);
    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }

}