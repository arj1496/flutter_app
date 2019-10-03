

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'AppTheme.dart';

class TitleView extends StatelessWidget {
  final String titleTxt;
  final IconData subTxt;


  const TitleView(
      {Key key,
        this.titleTxt: "",
        this.subTxt: null,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 24),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      height: 38,
                      width: 26,
                      child: Padding(
                        padding: const EdgeInsets.only(right:14.0),
                        child: IconButton(
                          icon: new Icon(subTxt),
                          color: AppTheme.darkText.withOpacity(0.5),
                          iconSize: 18,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Text(
                          titleTxt,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: AppTheme.robotoFontName,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            letterSpacing: 0.5,
                            color: AppTheme.lightText,
                          ),
                        ),
                      ),
                    ),
                    /*InkWell(
                      highlightColor: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Row(
                          children: <Widget>[
                            Text(
                              subTxt,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: AppTheme.robotoFontName,
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                letterSpacing: 0.5,
                                color: AppTheme.nearlyDarkBlue,
                              ),
                            ),
                            *//*SizedBox(
                              height: 38,
                              width: 26,
                              child: Icon(
                                Icons.arrow_forward,
                                color: AppTheme.darkText,
                                size: 18,
                              ),
                            ),*//*
                          ],
                        ),
                      ),
                    )*/
                  ],
                ),
              ),
        );



  }
}
