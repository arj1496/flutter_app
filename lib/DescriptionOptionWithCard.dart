import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/Buttonview.dart';
import 'package:flutter_app/Dateview.dart';
import 'package:flutter_app/DescriptionCardModel.dart';
import 'package:flutter_app/Descrptionview.dart';
import 'package:flutter_app/DetailCardModel.dart';
import 'package:flutter_app/PlaceCardModel.dart';
import 'package:flutter_app/Placeview.dart';
import 'AllDetailsview.dart';

class DescriptionOptionWithCard extends StatelessWidget {

  List<Widget> _widgetList = [DescriptionCardModel(),PlaceCardModel(),DetailCardModel(),Dateview(),Buttonview()];
  DescriptionOptionWithCard.init(List<Widget>  widgetList){
    this._widgetList = widgetList;
  }
  DescriptionOptionWithCard(){}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: AppBar(
        title: Text("Description Option"),
        backgroundColor: Colors.grey,
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

