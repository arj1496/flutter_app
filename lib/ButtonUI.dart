/**
 * This is the generic container used for description and place in event.
 * To diaplay label and data this container is used.
 * In this property file is accepted in constructor from calling widgets.
 * property contains label,icon and data properties.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

import 'PropertyFile.dart';

class ButtonUI extends StatelessWidget {

  String button1,button2,button3;

  var property = new PropertyFile();
  ButtonUI.init(String button1,String button2,String button3){
    this.button1 = button1;
    this.button2 = button2;
    this.button3 = button3;
  }
  @override
  Widget build( BuildContext context ) {

    return getCategoryUI();
  }

   Widget getCategoryUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        /*Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
          child: Text(
            "Category",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: AppTheme.darkerText,
            ),
          ),
        ),*/
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: <Widget>[
              getButtonUI(button1, true),
              SizedBox(
                width: 16,
              ),
              getButtonUI(button2, false),
              SizedBox(
                width: 16,
              ),
              getButtonUI(button3, false),
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),

      ],
    );
  }

  Widget getButtonUI(String text, bool isSelected) {
   /* var txt = '';
    if (CategoryType.ui == categoryTypeData) {
      txt = 'RESULTS';
    } else if (CategoryType.coding == categoryTypeData) {
      txt = 'DELETE';
    } else if (CategoryType.basic == categoryTypeData) {
      txt = 'CLOSE';
    }*/
    return Expanded(
      child: Container(
        decoration: new BoxDecoration(
            color: isSelected
                ? AppTheme.nearlyBlue
                : AppTheme.nearlyWhite,
            borderRadius: BorderRadius.all(Radius.circular(24.0)),
            border: new Border.all(color: AppTheme.nearlyBlue)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white24,
            borderRadius: BorderRadius.all(Radius.circular(24.0)),

            child: Padding(
              padding:
              EdgeInsets.only(top: 12, bottom: 12, left: 18, right: 18),
              child: Center(
                child: Text(
                  text,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    letterSpacing: 0.27,
                    color: isSelected
                        ? AppTheme.nearlyWhite
                        : AppTheme.nearlyBlue,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

