import 'package:flutter/material.dart';
import 'package:flutter_app/src/mo/HomeWork/HWListTile.dart';
import 'package:flutter_app/src/mo/HomeWork/HomeWork.dart';
import 'package:flutter_app/src/mo/HomeWork/hwservice.dart';

class HWList extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new _HWListState();
  }
}

class _HWListState  extends State<HWList>{
  List<HomeWork> _homeWorkList = null;

  @override
  void initState() {

    HWService hwService = new HWService();
    _homeWorkList = hwService.getAllHomeWork();
  }

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: this._homeWorkList.length,
        itemBuilder: (BuildContext ctxt, int Index) {
          return HWListTile(this._homeWorkList[Index]);
        }
    );

  }
}