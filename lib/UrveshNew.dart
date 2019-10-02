import 'package:flutter/material.dart';
import 'package:flutter_app/DetailViewUV.dart';
import 'package:flutter_app/ListTileViewUV.dart';
import 'package:flutter_app/ListViewUV.dart';

import 'HeaderContainer.dart';

class UrveshNew extends StatefulWidget {
  @override
  _UrveshNewState createState() => _UrveshNewState();
}

class _UrveshNewState extends State<UrveshNew> {

  List<Widget> customWidget = [
    HeaderContainer(),
    ListViewUV(),ListViewUV(),ListViewUV(),ListViewUV(),ListViewUV(),ListViewUV(),ListViewUV(),ListViewUV()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Urvesh New Home Page"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute( builder: (context) => DetailViewUV.init(customWidget)),
                );
              },
              child: Text('List View With Container'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute( builder: (context) => ListTileViewUV()),
                );
              },
              child: Text('List View With ListTile and Builder'),
            ),
          ],
        ),

      ),
    );
  }
}
