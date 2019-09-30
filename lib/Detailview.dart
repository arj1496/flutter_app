import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/Descrptionview.dart';
import 'package:flutter_app/Placeview.dart';
import 'AllDetailsview.dart';

class Detailview extends StatelessWidget {

  List<Widget>  _widgetList = null;
  Detailview.init(List<Widget>  widgetList){
    this._widgetList = widgetList;
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: AppBar(
        title: Text("Collapsable Demo"),
        backgroundColor: Colors.yellow,
      ),
      body: SingleChildScrollView(
      child: Column(
          children:  _getWidget(),
      ),
      ),
    );

  }

  List<Widget> _getWidget(){
    return this._widgetList;
  }
}

