import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/EventDetails.dart';

class Heena extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Heena's Workspace"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: (){
                 Navigator.pop(context);  // Navigates to the origin page -- for exit
              },
              child: Text("Go Back"),
          ),
            RaisedButton(
              onPressed:(){
                Navigator.push(context,             // to divert to some page -- for entry to some page
                    MaterialPageRoute(builder: (context)=> EventDetails())
                );
              },
              child: Text("Event Details"),
            ),
          ],
        )
      )
    );
  }
}
