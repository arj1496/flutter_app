/**
 * In title view icon and label is display before displaying the container of place and d
 * descfription in event.
 * In this the titletxt is label and subtxt is displayed as icon
 *
 */

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
                padding: const EdgeInsets.only(left: 1, right: 24,top:4),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      height: 38,
                      width: 26,
                      child: Padding(
                        padding: const EdgeInsets.only(right:14.0),
                        child: IconButton(
                          icon: new Icon(subTxt),
                          color: AppTheme.darkerText.withOpacity(0.5),
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

                  ],
                ),
              ),
        );



  }
}
