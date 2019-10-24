/**
 * This is the generic container used for description and place in event.
 * To diaplay label and data this container is used.
 * In this property file is accepted in constructor from calling widgets.
 * property contains label,icon and data properties.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

import 'PropertyFile.dart';

class DescriptionCustomView extends StatelessWidget {

  String description ;
  DescriptionCustomView.init(String description){
    this.description = description;
  }
  @override
  Widget build( BuildContext context ) {
    return Padding(
      padding: EdgeInsets.only(
        top:1,
          left: 8,
          right: 8,
          bottom: 8
      ),
      child: new Container (
        width:800,
        height: 150,
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
              topRight: Radius.circular(8.0)
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: AppTheme.grey.withOpacity(0.2),
                offset: Offset(1.1, 1.1),
                blurRadius: 10.0),
          ],
        ),
        //margin: const EdgeInsets.only(top:5.0),

        child: new Column (
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
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
                textDirection: TextDirection.ltr,
                style: new TextStyle(
                  fontFamily:AppTheme.workSansFontName,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  letterSpacing: -0.1,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}