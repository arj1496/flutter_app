import 'package:flutter/material.dart';

class urvesh extends StatelessWidget {

  final nayanWork = Material(
    color: Colors.indigo,
    /* borderRadius: BorderRadius.circular(30.0),*/
    child: MaterialButton(

      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      onPressed: (){},
      child: Text("Nayan Work",
          textAlign: TextAlign.center,
          style: style.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Urvesh Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}