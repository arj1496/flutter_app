import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/EventDetails.dart';
import 'package:flutter_app/SliverView.dart';

class CollapseviewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _buildExpandableContent(Vehicle vehicle) {
      List<Widget> columnContent = [];
      for (String content in vehicle.contents)
      columnContent.add(
          new ListTile(
            title: new Text(content, style: new TextStyle(fontSize: 18.0),),
            leading: new Icon(vehicle.icon),
          ),
      );

      return columnContent;
    }
    return new Scaffold(
      appBar: AppBar(
        title: Text("Collapsable Demo"),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(height:50.0,

              child: new Text(
              'Attendance Summary  ',
             textAlign: TextAlign.center,
             style: new TextStyle(
            fontSize: 20.0,
             fontFamily: 'Roboto',

          color: new Color(0xDD000000 ),
        ),
              ),
                ),
                Container( height: 25.0,
                  child: new Text(
                  '2019-09-25',
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Roboto',

                    color: new Color(0xDD000000),
                  ),
                ),
                ),
                Container( height: 40.0,
                  child: new Row(
                  children: <Widget>[ Padding(
                    padding: const EdgeInsets.only(left:10.0),

                    child: new Text(
                      'Total Student: 23',
                      textAlign: TextAlign.left,
                      style: new TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Roboto',
                        color: new Color(0xDD000000),
                      ),
                    ),
                  ),
                    Padding(
                      padding: const EdgeInsets.only(left:40.0),
                      child: new Text(
                        'Total Attendance: 23%',
                        textAlign: TextAlign.right,
                        style: new TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Roboto',
                          color: new Color(0xDD000000),
                        ),
                      ),
                    ),
                  ],
                ),
                ),
                Container( height: 50.0,

                  child: new Row(
                    children: <Widget>[ Padding(
                      padding: const EdgeInsets.only(left:10.0),
                      child: new Text(
                        'Absent: 1%',
                        textAlign: TextAlign.left,
                        style: new TextStyle(
                          fontSize: 17.0,
                          fontFamily: 'Roboto',
                          color: new Color(0xDD000000),
                        ),
                      ),
                    ),
                      Padding(
                        padding: const EdgeInsets.only(left:80.0),
                        child: new Text(
                          'Present: 3%',
                          textAlign: TextAlign.right,
                          style: new TextStyle(
                            fontSize: 17.0,
                            fontFamily: 'Roboto',
                            color: new Color(0xDD000000),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
            )

          ),
          SliverFillRemaining(

            child:ListView.builder(
                itemCount: vehicles.length,
                itemBuilder: (context, i) {
                  return new ExpansionTile(
                    title: new Text(vehicles[i].title, style: new TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),),
                    children: <Widget>[
                      new Column(
                        children: _buildExpandableContent(vehicles[i]),

                      ),
                    ],
                  );
                }
            ),
          )
        ],
      ),

      );

  }


}
class Vehicle {
  final String title;
  List<String> contents = [];
  final IconData icon;

  Vehicle(this.title, this.contents, this.icon);

}

List<Vehicle> vehicles = [
  new Vehicle(
    'Bike',
    ['Vehicle no. 1', 'Vehicle no. 2', 'Vehicle no. 7', 'Vehicle no. 10'],
    Icons.motorcycle,
  ),
  new Vehicle(
    'Cars',
    ['Vehicle no. 3', 'Vehicle no. 4', 'Vehicle no. 6'],
    Icons.directions_car,
  ),

];

