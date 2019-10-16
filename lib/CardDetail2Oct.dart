/***** This is a skelton of container with curve corner.All the details of exam,event,announcement
 * and assignment details like title,type is displayed on this container.
 * the container layout is generic but the child widget is changed accoring to requirement of details.
 */



import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'EventWidget.dart';
import 'ExamWidget2.dart';
import 'PropertyFile.dart';

class CardDetail2Oct extends StatelessWidget {

  Widget cutomWidget;
  var property = new PropertyFile();
  CardDetail2Oct.init(PropertyFile property){
    this.property = property;
  }
  CardDetail2Oct(Widget cutomWidget){
    this.cutomWidget = cutomWidget;
  }
  @override
  Widget build( BuildContext context ) {
    return Stack(
      children: <Widget>[

           Padding(
             padding: const EdgeInsets.only(bottom:8.0),
             child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppTheme.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              bottomLeft: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0),
                              topRight: Radius.circular(50.0)
                          ),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: AppTheme.grey.withOpacity(0.2),
                                offset: Offset(1.1, 1.1),
                                blurRadius: 10.0),
                          ],
                        ),
                         child: SingleChildScrollView(
                            child: _getWidget(),
                          ),

                        ),
                      ),
                    ],

                ),
           ),

          ],
        );

  }

   Widget _getWidget(){
    return this.cutomWidget;
  }



  }
