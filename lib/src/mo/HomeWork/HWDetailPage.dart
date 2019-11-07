import 'package:flutter/material.dart';


class HWDetailPaage extends StatelessWidget{
  HWDetailPaage(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeWorkDetails"),
      ),
      body: Stack(
        children: <Widget>[

          Container(height: 150,color: Colors.lightBlue),
          Container(height: 150,color: Colors.grey),
          Container(height: 150,color: Colors.yellow),
          Container(height: 150,color: Colors.red),
          Container(height: 150,color: Colors.grey),
          Container(height: 150,color: Colors.amberAccent),
          Container(height: 150,color: Colors.brown),
          Container(height: 150,color: Colors.deepPurple),
          Container(height: 150,color: Colors.lime),

        ],

      )
    );
  }

  
}