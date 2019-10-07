import 'package:flutter/material.dart';
import 'package:flutter_app/AddFormUI.dart';
import 'package:flutter_app/DetailViewUV.dart';
import 'package:flutter_app/ListTileViewUV.dart';
import 'package:flutter_app/ListViewUV.dart';
import 'package:flutter_app/urvesh.dart';

import 'AppTheme.dart';
import 'HeaderContainer.dart';

class UrveshNew extends StatefulWidget {
  @override
  _UrveshNewState createState() => _UrveshNewState();
}

class _UrveshNewState extends State<UrveshNew> {

  List<Widget> customWidget = [
    HeaderContainer.init("Events", "test"),
    ListViewUV(),ListViewUV(),ListViewUV(),ListViewUV(),ListViewUV(),ListViewUV(),ListViewUV(),ListViewUV()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Urvesh New Home Page"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute( builder: (context) => UrveshHome()),
                );
              },
              child: Text('Login'),
            ),
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
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> AddFormUI()));
          },
          backgroundColor: AppTheme.background,
          child: Icon(
            Icons.add,
            size: 32,
          ),
        )
    );
  }
}
