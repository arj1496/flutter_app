import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class DescriptionCardModel extends StatelessWidget {

  var description=
      "n a project of mine I wrap Text instances around Containers. This particular code sample features two stacked Text objects."
      "n a project of mine I wrap Text instances around Containers. This particular code sample features two stacked Text objects."
      "\nhttps://www.google.com"
      "\nhttps://www.gmail.com";
  var label = "Description: ";
  @override
  Widget build( BuildContext context ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Card (
        color: Colors.blueAccent,
        child: new Column (
            children: <Widget>[
        Padding(
        padding: EdgeInsets.all(10),
      ),
      Row(
     children:<Widget>[IconButton(
       icon: new Icon(FontAwesomeIcons.bookOpen),

      ),
              Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: new Text (label,

                  style: new TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.solid,
                    fontFamily: 'Roboto',
                    color: Colors.white,

                  ),
                ),
              ),

              ],
      ),
              Padding(
              padding: const EdgeInsets.only(left:8.0,bottom:8.0),
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
                style: new TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'Roboto',
                  color: Colors.white,
                ),
              ),
            ),

          ],
        ),
      ),
    );

  }
}