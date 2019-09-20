import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/src/mo/HomeWork/HomeWork.dart';
import 'package:flutter_app/src/mo/HomeWork/HomeWorkHomePage.dart';
import 'package:flutter_app/src/mo/HomeWork/hwservice.dart';

class dhaval extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Dhaval's  HomePage"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      HomeWorkListPage()),
            );

            // Navigate back to first route when tapped.
          },
          child: Text('Go back21!'),
        ),
      ),
    );
  }
}
