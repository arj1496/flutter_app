import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/mo/Event/PersonalParticipantUI.dart';

import '../../../AppTheme.dart';
import 'Event.dart';

class ParticipantUI extends StatefulWidget {
  @override
  _ListTileViewUVState createState() => _ListTileViewUVState();

  }

  class _ListTileViewUVState extends State<ParticipantUI> {
  List<Event> eventList = null;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10.0),
      child: Container(
        height:150,
        decoration: BoxDecoration(
          color: AppTheme.background,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
              topRight: Radius.circular(8.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: AppTheme.grey.withOpacity(0.2),
                offset: Offset(1.1, 1.1),
                blurRadius: 10.0),
          ],
        ),
        child:Container(
          // given Box Shadow to the Container
          decoration: BoxDecoration(
            color: AppTheme.background,
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
                  blurRadius: 10.0
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                const EdgeInsets.only(top: 5, left: 5, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 4, bottom: 1,top: 5),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 4, bottom: 3
                              ),
                              child: Text(
                                //'Gandhi Jayanti Gandhi Jayanti',
                                "Partcipant",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: AppTheme.robotoFontName,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: AppTheme.nearlyDarkBlue,
                                ),
                              ),
                            ),
                          ],
                        ),


                      ],
                    ),
                    Container(
                        height: 50,

                      // given Box Shadow to the Container
                      decoration: BoxDecoration(
                        color: AppTheme.white,
                        border: new Border.all(color: Colors.blue),
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
                              blurRadius: 10.0
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                         Padding(
                           padding: const EdgeInsets.only(left:8.0),
                           child: GestureDetector(
                             onTap:() {
                               Navigator.push (
                                 context ,
                                 MaterialPageRoute (
                                     builder: ( context ) => PersonalParticipantUI() ) ,
                               );
                             },
                             child: GestureDetector(
                              // onTap: ,
                               child: Container(
                                   height: 40,
                                   width: 250,
                                decoration: BoxDecoration(
                                color: AppTheme.white,
                                border: new Border.all(color: Colors.blue),
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
                                      blurRadius: 10.0
                                  ),
                                ],
                               ),
                                 child: Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Text("Select Personal Participant",
                                     textAlign: TextAlign.center,
                                     style: TextStyle(
                                       fontFamily: AppTheme.robotoFontName,
                                       fontWeight: FontWeight.w600,
                                       fontSize: 14,
                                       color: AppTheme.lightText,
                                     ),
                                   ),
                                 ),
                               ),
                             ),
                           ),
                         ),
                          Container(
                            height: 40,
                            width: 50,
                            decoration: BoxDecoration(
                              color: AppTheme.white,
                              border: new Border.all(color: Colors.blue),
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
                                    blurRadius: 10.0
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("0",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: AppTheme.robotoFontName,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: AppTheme.lightText,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0,bottom: 8),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: Container(
                              height: 40,
                              width: 150,
                              decoration: BoxDecoration(
                                color: AppTheme.white,
                                border: new Border.all(color: Colors.blue),
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
                                      blurRadius: 10.0
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("School",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: AppTheme.robotoFontName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: AppTheme.lightText,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right:0.0),
                            child: Container(
                              height: 40,
                              width: 150,
                              decoration: BoxDecoration(
                                color: AppTheme.white,
                                border: new Border.all(color: Colors.blue),
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
                                      blurRadius: 10.0
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Class",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: AppTheme.robotoFontName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: AppTheme.lightText,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}