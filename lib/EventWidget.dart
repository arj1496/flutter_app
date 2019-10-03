/**
 * This is the detail page of event this element is behave as a child of CardDetail2Oct.dart.
 *
 */


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/AppTheme.dart';


import 'PropertyFile.dart';

class EventWidget extends StatelessWidget {

  var property = new PropertyFile();
  EventWidget.init(PropertyFile property){
    this.property = property;
  }

  EventWidget(){

  }
  @override
  Widget build( BuildContext context ) {
    return _getTileViewWidget();

  }

  /* List<Widget> _getWidget(){
    List<Widget> list = [
      DescriptionCustomView.init(propertyService.getData())
    ];
    return list;
  }*/

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

                                      Padding(
                                        padding: const EdgeInsets.only(bottom:8.0,right:2.0,left:12),
                                        child: Text(
                                          'Gandhi Jayanti ',
                                          overflow: TextOverflow.ellipsis,
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