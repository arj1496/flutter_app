import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class Dateview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom:5.0),
      decoration: new BoxDecoration(

        border: new Border.all(color: Colors.blue),
        borderRadius: new BorderRadius.circular(8.0),
      ),
      child: new Row(
        children: <Widget>[Container(width: 110.0,

          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(3.0),


          child: new Column (
            children: <Widget>[
              new Text(
                'startDate',
                textAlign: TextAlign.right,
                style: new TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'Roboto',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: new Text(
                  '28/9/19',
                  textAlign: TextAlign.right,
                  style: new TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Roboto',
                    color: new Color(0xDD000000),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(width: 110.0,
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(3.0),

          child: new Column (
              children: <Widget>[
            new Text(
                'Duration',
                textAlign: TextAlign.right,
                style: new TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: new Text(
                    '1 hr',
                    textAlign: TextAlign.right,
                    style: new TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                      color: new Color(0xDD000000),
                    ),
                  ),
                ),
             ],
            ),
          ),
          Container(width: 110.0,

            child: new Column (
              children: <Widget>[
                new Text(
                  'EndDate',
                  textAlign: TextAlign.right,
                  style: new TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Roboto',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: new Text(
                    '28/9/19',
                    textAlign: TextAlign.right,
                    style: new TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                      color: new Color(0xDD000000),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}