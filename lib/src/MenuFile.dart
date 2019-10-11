import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/AllDetailsview.dart';
import 'package:flutter_app/Buttonview.dart';
import 'package:flutter_app/Dateview.dart';
import 'package:flutter_app/DetailViewUV.dart';
import 'package:flutter_app/ExamAddPage2.dart';
import 'package:flutter_app/ExamAddPage2.dart';
import 'package:flutter_app/FilePickerDemo.dart';
import 'package:flutter_app/FirstScreen.dart';
import 'package:flutter_app/Fourscreen.dart';
import 'package:flutter_app/Placeview.dart';
import 'package:flutter_app/PropertyFile.dart';
import 'package:flutter_app/PropertyService.dart';
import 'package:flutter_app/Secondscreen.dart';
import 'package:flutter_app/src/Thirdscreen.dart';
import 'package:flutter_app/WebviewTest.dart';
import 'package:flutter_app/src/mo/Exam/ExamAddPage.dart';
import 'package:flutter_app/src/mo/Exam/ExamListPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../DemoCard.dart';
import '../DescriptionCustomView.dart';
import '../DescriptionOption.dart';
import '../Descrptionview.dart';
import '../Detailview.dart';
import '../ExamAddPage2.dart';
import '../ExamAddPage2.dart';
import '../ExamAddPage2.dart';
import 'CollapseviewDemo.dart';
import 'mo/Exam/ExamListPage2.dart';
class MenuFile extends StatelessWidget {

  static PropertyService propertyService = new PropertyService();
  List<Widget> widgetList = [Descriptionview(),Placeview(),AllDetailsview(),Dateview(),Buttonview()];
  List<Widget> customWidget = [DescriptionCustomView.init(propertyService.getData())];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("menus"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Collapsable view demo"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CollapseviewDemo()),
                );
              },

            ),
            RaisedButton(
              child: Text("open url"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirstScreen()),
                );
              },

            ),
            RaisedButton(
              child: Text("open Html Local File"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Secondscreen()),
                );
              },

            ),
            RaisedButton(
              child: Text("open Html with Local css File"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Thirdscreen()),
                );
              },

            ),
            RaisedButton(
              child: Text("activity to javascrript call"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WebViewTest()),
                );
              },

            ),
            RaisedButton(
              child: Text("javascrript to activity call"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Fourscreen()),
                );
              },

            ),

            RaisedButton(
              child: Text("Custom Widget"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Detailview.init(widgetList)),
                );
              },

            ),

            RaisedButton(
              child: Text("Description Options"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DescriptionOption()),
                );
              },

            ),
            RaisedButton(
              child: Text("Custom page of description"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FilePickerDemo()),
                );
              },

            ),
            RaisedButton(
              child: Text("Exam Add"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExamAddPage()),
                );
              },

            ),

            RaisedButton(
              child: Text("Exam list page"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExamListPage()),
                );
              },

            ),
            RaisedButton(
              child: Text("Exam Add page 2"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExamAddPage2()),
                );
              },

            ),
            RaisedButton(
              child: Text("Exam List page 2"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExamListPage2()),
                );
              },

            ),
          ],
        ),
      ),
    );
    getData(){

    }
  }




}

