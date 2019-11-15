import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/mo/Event/PersonalParticipantUI.dart';
import 'package:flutter_app/src/mo/Exam/ClassPopup.dart';
import 'package:flutter_app/src/mo/Standard/Standard.dart';

import '../../../AppTheme.dart';
import 'Event.dart';

class ParticipantUI extends StatefulWidget {

  @override
  _ListTileViewUVState createState() => _ListTileViewUVState();

  }

  class _ListTileViewUVState extends State<ParticipantUI> {
    List<String> schoolPaticipant = ["School","School Students","School Teachers","School Parents"];
    bool boolVal = false;

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
                            child: GestureDetector(
                              onTap: ( ) {
                                setState ( ( ) {
                                  _showAlert();
                                } );
                              } ,
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
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right:0.0),
                            child: GestureDetector(
                              onTap:() {
                                setState(() {
                                  _showClassAlert(context);
                                });
                              },
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

  _showAlert(  ) {
    return showDialog (
        context: context ,
        builder: ( context ) {
          return AlertDialog (
            title: new Text( "Particpant" ) ,
            content: ListView.builder (
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true ,
                itemCount: schoolPaticipant.length ,
                itemBuilder: ( context , i ) {
                  return CheckboxListTile (
                      value: boolVal ,
                      title: new Text( schoolPaticipant[i] ) ,
                      controlAffinity: ListTileControlAffinity.leading ,
                      onChanged: ( bool val ) {
                        setState(() {
                          ItemChange ( val , i , );
                        });
                      } );
                } ) ,
            actions: <Widget>[
              MaterialButton (
                  child: Text ( "DONE" ) ,
                  onPressed: ( ) {
                    // widget.callback ( selectedsSubjectList );
                     Navigator.pop ( context );
                  } ) ,
            ] ,
          );
        }
    );
  }

    void ItemChange( bool val , int index ) {
      setState ( ( ) {
        if (val) {
          boolVal = true;
        } else {
          boolVal = false;
        }
      } );
    }

    _showClassAlert(BuildContext context) {
      return showDialog(
          context: context,
          builder: (context) {
            return ClassPopup(
                callback: (List<Standard> value){
                  print("callBack Return ${value.length}");
                }
            );
          }
      );
    }

  }