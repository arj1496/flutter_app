import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'PropertyFile.dart';

class DescriptionCustomView extends StatelessWidget {

  var property = new PropertyFile();
  DescriptionCustomView.init(PropertyFile property){
    this.property = property;
  }
  @override
  Widget build( BuildContext context ) {
    return Padding(
      padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: 16
      ),
      child: new Material (
        //margin: const EdgeInsets.only(top:5.0),
        color: Colors.transparent,
        child: new Column (
          children: <Widget>[
            Row(
              children:<Widget>[IconButton(
                icon: property.iconData,
              ),
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: new Text (
                    property.label,
                    style: new TextStyle(
                      fontSize: 20.0,
                      decorationStyle: TextDecorationStyle.solid,
                      fontFamily: AppTheme.robotoFontName,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left:8.0,bottom:8.0,right:2.0),
              child:
              Linkify(
                onOpen:  (link) async {
                  if (await canLaunch(link.url)) {
                    await launch(link.url);
                  } else {
                    throw 'Could not launch $link';
                  }
                },
                text:(property.data),
                style: new TextStyle(
                  fontSize: 15.0,
                  fontFamily: AppTheme.robotoFontName,
                  color: Colors.black45,
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}