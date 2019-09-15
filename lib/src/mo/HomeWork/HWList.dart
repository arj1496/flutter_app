import 'package:flutter/material.dart';
import 'package:flutter_app/src/mo/HomeWork/HWListTile.dart';
import 'package:flutter_app/src/mo/HomeWork/HomeWork.dart';
import 'package:flutter_app/src/mo/HomeWork/hwservice.dart';

class HWList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HWListState();
  }
}

class _HWListState extends State<HWList> {
  List<HomeWork> _homeWorkList = null;

  @override
  void initState() {
    HWService hwService = new HWService();
    _homeWorkList = hwService.getAllHomeWork();
  }

  @override
  Widget build(BuildContext context) {
    // return getListView(context);
    return getCustomerListView_Sliver(context);
  }

  Widget getListView(BuildContext context) {
    return ListView.builder(
        itemCount: this._homeWorkList.length,
        itemBuilder: (BuildContext ctxt, int Index) {
          return HWListTile(this._homeWorkList[Index]);
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
     //flexibleSpace: Text("Hi ... 23"),

      // leading: Text("Leading"),
      backgroundColor: Colors.orangeAccent,
      // bottom: PreferredSize(child: Icon(Icons.linear_scale,size: 60.0,), preferredSize: Size.fromHeight(50.0)),
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
            Text("He"),
            Text("He"),
            Text("He"),
            Text("He"),
            Text("He"),
            Text("He"),

            Text("He"),
            Text("He"),
            Text("He"),
            Text("He"),

            Text("He"),
            Text("He"),
            Text("He"),
            Text("He"),

            Text("He"),
            Text("He"),
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
                  return HWListTile(this._homeWorkList[index]);
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
      this._homeWorkList.removeAt(0);
      this._homeWorkList.removeAt(1);
      this._homeWorkList.removeAt(2);
      this._homeWorkList.removeAt(3);
      this._homeWorkList.removeAt(4);
      this._homeWorkList.removeAt(5);
      this._homeWorkList.removeAt(6);
      this._homeWorkList.removeAt(7);
      this._homeWorkList.removeAt(8);

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
}
