import 'package:flutter/material.dart';
import 'package:flutter_app/src/fr/SchoolUtils.dart';
import 'package:flutter_app/src/mo/Exam/ExamAddPage.dart';
import 'package:flutter_app/src/mo/HomeWork/HWList.dart';
import 'package:flutter_app/src/mo/HomeWork/HomeWork.dart';
import 'package:flutter_app/src/mo/HomeWork/HomeworkActivity.dart';

import '../../../AppTheme.dart';
import '../../../DetailView2Oct.dart';


class HomeWorkListPage extends StatelessWidget {

  List<HomeWork> _homeWorkList;

  HomeWorkListPage(){

    //_homeWorkList = hwList;
  }
  HomeWorkListPage.hwList(var hwList){
    _homeWorkList = hwList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: Text("Assignment 123"),
      ),

      body: HWList(),  // this is return a custom scroll view

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
                HWList(),
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
      ListTile(
        title: Text('Star'),
      ),

    ];

  }

  Widget getHomeWorkRow(HomeWork hw){
    return Row();
  }

  Widget getHomeWorkTile(BuildContext context, int position) {

      return Text(this._homeWorkList[position].title );

      return homeWorkTile(this._homeWorkList[position]);


  }


}

Widget homeWorkTile(HomeWork homeWorkList) {


   final part_1_date = Column(

   );


  return Row(
    children: <Widget>[




    ],
  );
}










