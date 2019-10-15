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

import '../PropertyFile.dart';


class ButtonUI2 extends StatelessWidget {

  String button1,button2,button3;

  var property = new PropertyFile();
  ButtonUI2.init(String button1,String button2,String button3){
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
            child: Padding(
            padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
      child: Material(  //Wrap with Material
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(24.0),
            side: BorderSide(color: AppTheme.nearlyBlue)
        ),
        elevation: 16.0,

        clipBehavior: Clip.antiAlias, // Add This
        child: MaterialButton(
          minWidth: 200.0,
          height: 35,

          child: new Text(text,
              style: new TextStyle(fontSize: 12.0, color: AppTheme.nearlyBlue)),
          onPressed: (){
              justClick(text);

//          setState(() {
//            _isNeedHelp = true;
//          });
          },
        ),
      ),
    ),
    );
  }

  justClick(String text){
    print(text);
  }
}

