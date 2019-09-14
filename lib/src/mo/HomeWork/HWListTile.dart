import 'package:flutter/material.dart';
import 'package:flutter_app/src/mo/HomeWork/HomeWork.dart';

class HWListTile extends StatelessWidget {

  HomeWork _homeWork = null;

  HWListTile(HomeWork this._homeWork);



  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:  Icon(Icons.account_balance),
      title: Text(_homeWork.title),
    );
  }
}
