import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_app/Attachment.dart';
import 'package:flutter_app/EventService.dart';
import 'package:flutter_app/src/mo/HomeWork/HomeWork.dart';
import 'package:flutter_app/src/mo/HomeWork/hwservice.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'PropertyFile.dart';

class AttachmentFileView extends StatelessWidget {

  var property = new PropertyFile();
  static EventService eventService = new EventService();
    HWService hwService = new HWService();
  //Map _values = getValues();
  List<Attachment> attachmrntlist = eventService.getValues();



  /*DateWidget.init(PropertyFile property){
    this.property = property;
  }*/


  @override
  Widget build(BuildContext context) {
    return Container(

      color: AppTheme.background,
      child: SingleChildScrollView(
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
             shrinkWrap: true,
            itemCount: attachmrntlist.length,
            itemBuilder: (BuildContext ctxt, int Index){
              return _listTileViewUV(attachmrntlist[Index]);
            }
        ),

    ),
    );

  }

  Widget _listTileViewUV(data) {

    return Padding(
      padding: const EdgeInsets.only(top:2.0,bottom:3,left:8,right:8),
      child: Container(
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

        // This is the Main Table Container
        child: Column(
          children: <Widget>[

            // this Padding is Used to render the Horizontal line Starts
            Padding(
              padding: const EdgeInsets.only(
                  left: 5, right: 5, top: 2 ,bottom: 2
              ),
              /*child: Container(
                height: 2,
                decoration: BoxDecoration(
                  color: AppTheme.background,
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
              ),*/
            ),
            // this Padding is Used to render the Horizontal line Ends

            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 3, bottom: 8
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        /*Text(
                          'Festival',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: AppTheme.robotoFontName,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            letterSpacing: -0.2,
                            color: AppTheme.darkText,
                          ),
                        ),*/
                        IconButton(
                          icon: new Icon(
                              FontAwesomeIcons.filePdf,
                            color: Colors.red,
                          ),

                        ),

                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              data.fileName,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: AppTheme.robotoFontName,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                letterSpacing: -0.2,
                                color: AppTheme.darkText,
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            /*Text(
                              '02 Oct 2019',
                              style: TextStyle(
                                fontFamily: AppTheme.robotoFontName,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                letterSpacing: -0.2,
                                color: AppTheme.darkText,
                              ),
                            ),*/
                            IconButton(
                              icon: new Icon(FontAwesomeIcons.download),
                            ),

                          ],
                        ),
                      ],
                    ),
                  )


                ],
              ),
            )
          ],
        ),

      ),
    );
  }
}










