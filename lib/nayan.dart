import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/dhaval.dart';
class nayan extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nayan Route"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
           RaisedButton(
             onPressed: () {
               Navigator.pop(context);
             },
             child: Text('Go back!'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => dhaval()),
                );
              },
              child: Text('Go to Dhaval Page'),
            ),

          ],
        ),
      ),

    );
  }
}