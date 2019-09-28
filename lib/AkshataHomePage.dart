import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'FirstScreen.dart';
import 'Secondscreen.dart';

class AkshataHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit))
              ],
            ),
            title: Text('Flutter Tabs Example'),
          ),
          body: TabBarView(
            children: [
              //FirstScreen(),
              //SecondScreen(),

            ],

          ),

        ),
      ),
    );
  }
}