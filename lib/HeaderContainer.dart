import 'package:flutter/material.dart';

import 'AppTheme.dart';

class HeaderContainer extends StatelessWidget {

  @override
  Widget build( BuildContext context ) {

    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16 - 8.0,
             bottom: 12 - 8.0
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Exam Detail",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: AppTheme.robotoFontName,
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      letterSpacing: 1.2,
                      //  color: FintnessAppTheme.darkerText,
                    ),
                  ),
                ),
              ),
              /*SizedBox(
                height: 38,
                width: 38,
                child: InkWell(
                  highlightColor: Colors.transparent,
                  borderRadius:
                  BorderRadius.all(Radius.circular(32.0)),
                  onTap: () {},
                  child: Center(
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      // color: FintnessAppTheme.grey,
                    ),
                  ),
                ),
              ),*/
              /*Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Icon(
                        Icons.calendar_today,
                        //color: FintnessAppTheme.grey,
                        size: 18,
                      ),
                    ),
                    Text(
                      "15 May",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: AppTheme.robotoFontName,
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        letterSpacing: -0.2,
                        // color: FintnessAppTheme.darkerText,
                      ),
                    ),
                  ],
                ),
              ),*/
              /*SizedBox(
                height: 38,
                width: 38,
                child: InkWell(
                  highlightColor: Colors.transparent,
                  borderRadius:
                  BorderRadius.all(Radius.circular(32.0)),
                  onTap: () {},
                  child: Center(
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      //color: FintnessAppTheme.grey,
                    ),
                  ),
                ),
              ),*/
            ],
          ),
        )
      ],
    );

  }
}