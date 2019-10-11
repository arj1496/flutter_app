import 'dart:ffi';

/**
 * This is the detail page of event this element is behave as a child of CardDetail2Oct.dart.
 *
 */


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/AppTheme.dart';

import '../../../PropertyFile.dart';
class ExamPage extends StatelessWidget {

  var property = new PropertyFile();
/*  ExamWidget.init(PropertyFile property){
    this.property = property;
  }*/

  ExamWidget2(){

  }
  @override
  Widget build( BuildContext context ) {
    return  Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          _getTileViewWidget(),
        ],
      ),

    );


  }

  /* List<Widget> _getWidget(){
    List<Widget> list = [
      DescriptionCustomView.init(propertyService.getData())
    ];
    return list;
  }*/


  Widget getTimeBoxUI(String text1, String txt2,double leftPadding,double rightPadding) {
    return Padding(
      padding: EdgeInsets.only(left:leftPadding,right:rightPadding,top:5,bottom: 5
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.nearlyWhite,
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: AppTheme.grey.withOpacity(0.2),
                offset: Offset(1.1, 1.1),
                blurRadius: 8.0),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 25.0, right: 25.0, top: 12.0, bottom: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                text1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: AppTheme.nearlyBlue,
                ),
              ),
              Text(
                txt2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: AppTheme.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  Widget _getTileViewWidget() {
    return  Column(
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
                                gradient: LinearGradient ( colors: [
                                  AppTheme.nearlyDarkBlue ,
                                  HexColor ( "#6F56E8" )
                                ],
                                ),
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
                                      'Class',
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
                                      /*SizedBox(
                                        width: 28,
                                        height: 28,
                                        child: Image.asset(
                                            "assets/fitness_app/burned.png"),
                                      ),*/
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(
                                            left: 16, bottom: 3),
                                        child: Text(
                                          'Class-1',
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

                                    ],
                                  ),


                                ],
                              ),
                            )
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              left: 0, right: 0, top: 8, bottom: 8),
                          child: Container(
                            height: 2,
                            decoration: BoxDecoration(
                              color: AppTheme.background,
                              borderRadius: BorderRadius.all(Radius.circular(4.0)),
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              height: 48,
                              width: 2,
                              decoration: BoxDecoration(
                                gradient: LinearGradient ( colors: [
                                  AppTheme.nearlyDarkBlue ,
                                  HexColor ( "#6F56E8" )
                                ],
                                ),
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
                                      'Subject',
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
                                      /*SizedBox(
                                        width: 28,
                                        height: 28,
                                        child: Image.asset(
                                            "assets/fitness_app/burned.png"),
                                      ),*/
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(
                                            left: 16, bottom: 3),
                                        child: Text(
                                          'Marathi',
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

                                    ],
                                  ),


                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                ),
              ),
            ],
          ),
        ),
        // for border line between type and event start date
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
                    left:12),
                child: Text(
                  'Created By',
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
                CrossAxisAlignment.start,
                children: <Widget>[

                  Padding(
                    padding:
                    const EdgeInsets.only(
                        bottom: 3),
                    child: Text(
                      'A T John',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily:
                        AppTheme.robotoFontName,
                        fontWeight:
                        FontWeight.w600,
                        fontSize: 16,
                        color: AppTheme.darkerText,
                      ),
                    ),
                  ),

                ],
              ),
            ],
          ),
        )
      ],

    );

  }
}