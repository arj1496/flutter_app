import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'EventWidget.dart';
import 'PropertyFile.dart';

class CardDetail2Oct extends StatelessWidget {

  List<Widget> cutomWidgetList = new List();
  var property = new PropertyFile();
  CardDetail2Oct.init(PropertyFile property){
    this.property = property;
  }
  CardDetail2Oct(List<Widget> cutomWidgetList){
    this.cutomWidgetList = cutomWidgetList;
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
                            child: Column(
                              children: _getWidget() ,
                            ),
                          ),

                        ),
                      ),
                    ],

                ),
           ),

          ],
        );

  }

  List<Widget> _getWidget(){
    return this.cutomWidgetList;
  }

 /* Widget _getTileViewWidget() {
    return Padding(
      padding: const EdgeInsets.only(
          left: 24, right: 24, top: 16, bottom: 18
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
        child: Column(
          children: <Widget>[
            Padding(
              padding:
              const EdgeInsets.only(top: 16, left: 16, right: 16
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 4
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  height: 48,
                                  width: 2,
                                  decoration: BoxDecoration(
                                    color: AppTheme.darkText.withOpacity(0.5),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(4.0)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 4, bottom: 2),
                                        child: Text(
                                          'Title',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily:AppTheme.robotoFontName,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            letterSpacing: -0.1,
                                            color: AppTheme.grey.withOpacity(0.5),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.end,
                                        children: <Widget>[
                                          SizedBox(
                                            width: 28,
                                            height: 28,
                                            child: Image.asset(
                                                "assets/fitness_app/eaten.png"),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                left: 4, bottom: 3),
                                            child: Text(
                                              'Gandhi Jayanti',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily:
                                                AppTheme.robotoFontName,
                                                fontWeight:
                                                FontWeight.w600,
                                                fontSize: 16,
                                                color: AppTheme
                                                    .darkerText,
                                              ),
                                            ),
                                          ),

                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  height: 48,
                                  width: 2,
                                  decoration: BoxDecoration(
                                    color: AppTheme.darkText.withOpacity(0.5),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(4.0)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 4, bottom: 2),
                                        child: Text(
                                          'Type',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily:
                                            AppTheme.robotoFontName,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            letterSpacing: -0.1,
                                            color: AppTheme.grey
                                                .withOpacity(0.5),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.end,
                                        children: <Widget>[
                                          SizedBox(
                                            width: 28,
                                            height: 28,
                                            child: Image.asset(
                                                "assets/fitness_app/burned.png"),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                left: 4, bottom: 3),
                                            child: Text(
                                              'Festival',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: AppTheme.robotoFontName,
                                                fontWeight:
                                                FontWeight.w600,
                                                fontSize: 16,
                                                color: AppTheme.darkerText,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 24, right: 24, top: 8, bottom: 8),
                                            child: Container(
                                              height: 2,
                                              decoration: BoxDecoration(
                                                color: AppTheme.background,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );*/

  }
