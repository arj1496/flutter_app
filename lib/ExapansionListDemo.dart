import 'package:flutter/material.dart';
import 'package:flutter_app/src/mo/HomeWork/HWListTile.dart';
import 'package:flutter_app/src/mo/HomeWork/HomeWork.dart';
import 'package:flutter_app/src/mo/HomeWork/HomeworkService.dart';

import 'VehicleListTile.dart';

class ExpansionListDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HWListState();
  }
}

class _HWListState extends State<ExpansionListDemo> {
  List<Vehicle> _vehicleList = null;

  @override
  void initState() {

    _vehicleList = getVehicle();
  }

  @override
  Widget build(BuildContext context) {
    // return getListView(context);
    return getCustomerListView_Sliver(context);
  }

  Widget getListView(BuildContext context) {
    return ListView.builder(
        itemCount: this._vehicleList.length,
        itemBuilder: (BuildContext ctxt, int Index) {
          return VehicleListTile(this._vehicleList[Index]);
        });
  }

  Widget getCustomerListView_Sliver(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      buildSliverAppBar(),
      buildSliverList_1()

    ]);
  }

  SliverAppBar buildSliverAppBar() {
    return SliverAppBar(
      floating: false,
      expandedHeight: 200.0,
      pinned: true,
      title: Text("The Sliver App Bar 12"),
      backgroundColor: Colors.orangeAccent,
      flexibleSpace: getFlexibleSpaceBar(),


    );
  }

  SliverList buildSliverList_2(){

    return SliverList(

      delegate: SliverChildListDelegate([

        Text("Hello 12"),
        Container(color: Colors.red, height: 150.0,
          child: ListView(children: <Widget>[
            Text("He"),
            Text("He"),
          ],),


        ),
        Container(color: Colors.purple, height: 150.0),
        Container(color: Colors.green, height: 150.0),
        Container(color: Colors.lightBlue, height: 150.0),
        Container(color: Colors.amberAccent, height: 150.0),
        Container(color: Colors.black38, height: 150.0),

      ]),

    );

  }

  SliverList buildSliverList_1() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index){
            return VehicleListTile(this._vehicleList[index]);
          }
      ),
    );
  }

  Widget getFelixSpace(){

    return Container(
      height: 100,
      child: Row(
        children: <Widget>[
          Text("Hello 1"),
          Text("Hello 2")
        ],

      ),
    );

  }

  FlexibleSpaceBar getFlexibleSpaceBar() {
    return FlexibleSpaceBar(

      centerTitle: true,
      title: Container(
      ),
      background:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(child: Text("Rock & Roll"),
            onPressed: () => changeList(),
            color: Colors.red,
            textColor: Colors.yellow,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            splashColor: Colors.grey,
          )
        ],
      ),
    );
  }

  changeList(){
//    this._homeWorkList.removeAt(0);

    setState((){
      this._vehicleList.removeAt(0);
      this._vehicleList.removeAt(1);
    });

  }

  Widget getCustomerListView_Sliver_1(BuildContext context) {
    return Container(
      child: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          floating: true,
          expandedHeight: 200.0,
          title: Text("The Sliver App Bar"),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              //getListView(context),
            ],
          ),
        ),
      ]),
    );
  }



  getVehicle(){
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
    return vehicles;
  }
}
class Vehicle {
  final String title;
  List<String> contents = [];
  final IconData icon;

  Vehicle(this.title, this.contents, this.icon);
}

