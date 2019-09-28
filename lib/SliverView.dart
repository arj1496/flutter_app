import 'package:flutter/material.dart';
import 'package:flutter_app/ExapansionListDemo.dart';
import 'package:flutter_app/src/mo/HomeWork/HWList.dart';
import 'package:flutter_app/src/mo/HomeWork/HomeWork.dart';
import 'package:flutter_app/src/mo/HomeWork/hwservice.dart';

class SliverView extends StatelessWidget {

  List<HomeWork> _homeWorkList;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
/*

      appBar: AppBar(
        title: Text("Assignment 123"),
      ),
*/
      body: ExpansionListDemo(),

    );
  }


  Widget getCustomerListView_Sliver(){

    return CustomScrollView(

        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            expandedHeight: 200.0,
            title: Text("The Sliver App Bar"),
          ),
          SliverList (
            delegate: SliverChildListDelegate(
              [
                ExpansionListDemo(),
              ],
            ),
          ),
        ]


    );
  }

  List<Widget> getHomeWorkList(){

    // return _homeWorkList.map((hw)  =>  new Text(hw.title));
    return <Widget>[
      ListTile(
        title: Text('Sun2345'),
      ),
      ListTile(
        title: Text('Moon2'),
      ),


    ];

  }




}



