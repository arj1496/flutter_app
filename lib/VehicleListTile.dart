import 'package:flutter/material.dart';
import 'package:flutter_app/ExapansionListDemo.dart';
import 'package:flutter_app/src/mo/HomeWork/HomeWork.dart';

class VehicleListTile extends StatelessWidget {

  Vehicle _vehicle = null;
  VehicleListTile(Vehicle this._vehicle);



  @override
  Widget build(BuildContext context) {
    // return getRowTile(this._homeWork);
    return getRow(this._vehicle);
  }

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
  Widget getRowTile(Vehicle vehicle){

    return new ExpansionTile(
      title: new Text(vehicle.title, style: new TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic),),
      children: <Widget>[
        new Column(
          children: _buildExpandableContent(vehicle),
        ),
      ],
    );



  }


  Widget getRow(Vehicle vehicle){

    return ListTile(

      leading:  Icon(Icons.account_balance),
      title: Container(
        color: Colors.amber,
        child: Row(

          children: <Widget>[
            Column(
              children: <Widget>[
                Text(this._vehicle.title)
              ],
            ),
            Column(
              children: <Widget>[
                Text( "Hi " +  this._vehicle.title)
              ],
            )


          ],
        ),
      ),

    );




  }


}
