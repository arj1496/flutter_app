import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class Buttonview extends StatelessWidget {
  @override
  Widget build( BuildContext context ) {
    return  Row(children: <Widget>[
      SizedBox(
        width: 120.0,height: 50.0,
        child: RaisedButton(
          child: Text("Prevous"),
          onPressed: () => null,
          color:  Colors.white,
          splashColor: Colors.amberAccent,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
              side: BorderSide(color: Colors.blue)
          ),
        ),
      ),
      SizedBox(
        width: 120.0,height: 50.0,
        child: RaisedButton(

          child: Text("Today"),
          onPressed: () => null,
          color:  Colors.white,
          splashColor: Colors.amberAccent,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
              side: BorderSide(color: Colors.blue)
          ),
        ),
      ),
      SizedBox(
        width: 120.0,height: 50.0,
        child: RaisedButton(
          child: Text("Next"),
          onPressed: () => null,
          color:  Colors.white,
          splashColor: Colors.amberAccent,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
              side: BorderSide(color: Colors.blue)
          ),
        ),
      )
    ],);
  }
}



