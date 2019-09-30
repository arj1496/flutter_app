import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/AllDetailsview.dart';
import 'package:flutter_app/Buttonview.dart';
import 'package:flutter_app/Dateview.dart';
import 'package:flutter_app/Placeview.dart';


import 'DescriptionOptionWithCard.dart';
import 'Descrptionview.dart';


class DescriptionOption extends StatelessWidget {
  List<Widget> widgetList = [Descriptionview(),Placeview(),AllDetailsview(),Dateview(),Buttonview()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("menus"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Card Demo"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DescriptionOptionWithCard()),
                );
              },

            ),
          ],
        ),
      ),
    );
  }
}