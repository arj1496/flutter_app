import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class Descriptionview extends StatelessWidget {

  var description=
      "n a project of mine I wrap Text instances around Containers. This particular code sample features two stacked Text objects."
      "n a project of mine I wrap Text instances around Containers. This particular code sample features two stacked Text objects."
      "\nhttps://www.google.com"
      "\nhttps://www.gmail.com"
        "\nwww.gmail.com";
  var label = "Description: ";
  @override
  Widget build( BuildContext context ) {
    return new Container (color:Colors.black12,
      padding: const EdgeInsets.only(left:16.0),
      margin: const EdgeInsets.only(top:15.0),

      child: new Column (
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right:200.0,bottom: 10.0),
            child: new Text (label,
              style: new TextStyle(
              fontSize: 20.0,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.solid,
                fontFamily: 'Roboto',
                color: Colors.black,
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
    text:(description),
                humanize: true,
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