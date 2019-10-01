import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_app/DescriptionCustomView.dart';
import 'package:flutter_app/PropertyService.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'PropertyFile.dart';

class MainDetailPage extends StatelessWidget {
 PropertyService propertyService = new PropertyService();
  final infoHeight = 364.0;
  AnimationController animationController;
  Animation<double> animation;
  var opacity1 = 0.0;
  var opacity2 = 0.0;
  var opacity3 = 0.0;

  @override
  Widget build( BuildContext context ) {
    return Stack(
      children: <Widget>[
    Column(
    children: <Widget>[
      AspectRatio(
      aspectRatio: 1.2,
      child: Image.asset('assets/images/feedbackImage.png'),
    ),
    ],
    ),
        Positioned(
          top: (MediaQuery.of(context).size.width / 1.2) - 24.0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.nearlyWhite,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  topRight: Radius.circular(32.0)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: AppTheme.grey.withOpacity(0.2),
                    offset: Offset(1.1, 1.1),
                    blurRadius: 10.0),
              ],
            ),
            child: Padding(
               padding: const EdgeInsets.only(left: 8, right: 8),
                child: SingleChildScrollView(
                /* child:  DescriptionCustomView.init(propertyService.getData())),
                 child:  DescriptionCustomView.init(propertyService.getData())),*/
                  child: Column(
                    children:  _getWidget(),
                  ),
    ),
    ),
    ),
        ),
    ],
    );

  }
 List<Widget> _getWidget(){
    List<Widget> list = [DescriptionCustomView.init(propertyService.getData()),DescriptionCustomView.init(propertyService.getData()),DescriptionCustomView.init(propertyService.getData())];
   return list;
 }
}