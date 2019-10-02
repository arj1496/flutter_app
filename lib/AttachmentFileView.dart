import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/AppTheme.dart';


import 'PropertyFile.dart';

class AttachmentFileView extends StatelessWidget {

  var property = new PropertyFile();
  /*DateWidget.init(PropertyFile property){
    this.property = property;
  }*/

  AttachmentFile(){

  }
  @override
  Widget build( BuildContext context ) {
    return _getTileViewWidget();

  }



  Widget _getTileViewWidget() {

    return   Padding(
        padding: const EdgeInsets.only(
            left: 10, right: 10, top: 3, bottom: 3
        ),
        // This is the Main Table Container
        child: Container(
          // given Box Shadow to the Container
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
                      /*child: Text(
                        'Title',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: AppTheme.robotoFontName,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            letterSpacing: -0.1,
                            color: AppTheme.darkText),
                      ),*/
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
                                'Gandhi Jayanti Gandhi Jayanti',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: AppTheme.robotoFontName,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: AppTheme.nearlyDarkBlue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              // this Padding is Used to render the Horizontal line Starts
              Padding(
                padding: const EdgeInsets.only(
                    left: 5, right: 5, top: 8, bottom: 8
                ),
                child: Container(
                  height: 2,
                  decoration: BoxDecoration(
                    color: AppTheme.background,
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                ),
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
                          Text(
                            'Fastival',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: AppTheme.robotoFontName,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              letterSpacing: -0.2,
                              color: AppTheme.darkText,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              'Type',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: AppTheme.robotoFontName,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: AppTheme.grey.withOpacity(0.5),
                              ),
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
                                '1.30 Hrs',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: AppTheme.robotoFontName,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  letterSpacing: -0.2,
                                  color: AppTheme.darkText,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Text(
                                  'Duration',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: AppTheme.robotoFontName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: AppTheme.grey
                                        .withOpacity(0.5),
                                  ),
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
                              Text(
                                '02 Oct 2019',
                                style: TextStyle(
                                  fontFamily: AppTheme.robotoFontName,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  letterSpacing: -0.2,
                                  color: AppTheme.darkText,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Text(
                                  'Date',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: AppTheme.robotoFontName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: AppTheme.grey
                                        .withOpacity(0.5),
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
              )
            ],
          ),
        ),
      );

  }
}

