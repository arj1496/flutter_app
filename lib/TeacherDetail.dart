import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TeacherDetail extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TeacherDetailState();
  }

}
class TeacherDetailState extends State<TeacherDetail>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(

      body: CustomScrollView(
        slivers: <Widget>[
          ///First sliver is the App Bar
          SliverAppBar(
            ///Properties of app bar
            backgroundColor: Colors.blue,
            floating: false,
            pinned: true,
            expandedHeight: 200.0,

            ///Properties of the App Bar when it is expanded
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "SliverList Widget",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,

              ),

            ),
          ),
    ),
    ]
    ),
    );




}

}