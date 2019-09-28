import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class Placeview extends StatelessWidget {
  var place = "Navale It Park, Pune Banglore Highway, Narhe, Pune - 411041, Near Navle Bridge (Map)Computer Graphic Designers In Adobe";
  var label = "Place: ";
  @override
  Widget build( BuildContext context ) {
    return new Container (
      padding: const EdgeInsets.only(left:16.0),
      margin: const EdgeInsets.only(left:15.0,right:15.0),

      decoration: new BoxDecoration(

        border: new Border.all(color: Colors.blue, width: 1.0),
        borderRadius: new BorderRadius.circular(10.0),
      ),
      child: new Column (
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right:250.0,bottom: 10.0),
            child: new Text (label,
              style: new TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.solid,
                fontFamily: 'Roboto',
                color: Colors.green,

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom:8.0),
            child:
            Linkify(
              onOpen:  (link) async {
                if (await canLaunch(link.url)) {
                  await launch(link.url);
                } else {
                  throw 'Could not launch $link';
                }
              },
              text:(place),
              style: new TextStyle(
                fontSize: 15.0,
                fontFamily: 'Roboto',
                color: Colors.black,
              ),
            ),
          ),

        ],
      ),
    );

  }
}

