import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'PropertyFile.dart';

class PlaceCustomView extends StatelessWidget {

  var property = new PropertyFile();
  PlaceCustomView.init(PropertyFile property){
    this.property = property;
  }
  @override
  Widget build( BuildContext context ) {
    return Padding(
      padding: EdgeInsets.only(
          top:8,
          left: 8,
          right: 8,
          bottom: 8
      ),
      child: new Container (
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
                  fontFamily:AppTheme.robotoFontName,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  letterSpacing: -0.1,
                  color: AppTheme.grey.withOpacity(0.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}