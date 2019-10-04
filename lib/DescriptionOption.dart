import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/AttachmentView.dart';
import 'package:flutter_app/ButtonUI.dart';
import 'package:flutter_app/CardDetail2Oct.dart';
import 'package:flutter_app/DateWidget.dart';
import 'package:flutter_app/DemoCard.dart';
import 'package:flutter_app/DetailView2Oct.dart';
import 'package:flutter_app/ExamWidget.dart';
import 'package:flutter_app/MainDetailPage.dart';
import 'package:flutter_app/PropertyService.dart';
import 'package:flutter_app/TitleViewDetail.dart';
import 'AttachmentFileView.dart';
import 'DescriptionCustomView.dart';
import 'EventWidget.dart';
import 'ExamWidget2.dart';
import 'HeaderContainer.dart';
import 'MarkWidget.dart';
import 'TypeView.dart';



class DescriptionOption extends StatelessWidget {


  static PropertyService propertyService = new PropertyService();
  static List<Widget> detailWidget = [EventWidget(),];
  static List<Widget> exWidget = [ExamWidget(),];
  static List<Widget> exWidget2= [ExamWidget2(),];
  List<Widget> eventWidget = [
  // HeaderContainer.init("Event Detail"),     // For Appbar of evenry page.It constructor contains title which i displayed on header.
    CardDetail2Oct(detailWidget),            // It display all data in card view with curve corner.the detailwidget is a object of dart file for all details page
    DateWidget(),                     // It display date in blue container
    TitleViewDetail.init(propertyService.getPlaceData()),  // It display title of place and description in listview.
    DescriptionCustomView.init(propertyService.getPlaceData()),  // Alll place data is displayed in container
    TitleViewDetail.init(propertyService.getData()),
    DescriptionCustomView.init(propertyService.getData()),
    AttachmentView(),                                       // It dispay container in water mark
    AttachmentFileView(),                                    // This display all atachment in listview.
  ];

  List<Widget> examWidget = [
    HeaderContainer.init("Unit Test 1",""),     // For Appbar of evenry page.It constructor contains title which i displayed on header.
    CardDetail2Oct(exWidget),            // It display all data in card view with curve corner.the detailwidget is a object of dart file for all details page
   // DateWidget(),                     // It display date in blue container
    TitleViewDetail.init(propertyService.getExamData()),  // It display title of place and description in listview.
    DescriptionCustomView.init(propertyService.getExamData()),  // Alll place data is displayed in container
    TitleViewDetail.init(propertyService.getData()),
    DescriptionCustomView.init(propertyService.getData()),
    ButtonUI(),
   // AttachmentView(),                                       // It dispay container in water mark
   // AttachmentFileView(),                                    // This display all atachment in listview.
  ];
  List<Widget> examWidget2 = [
    HeaderContainer.init("Unit Test 1",""),     // For Appbar of evenry page.It constructor contains title which i displayed on header.
    CardDetail2Oct(exWidget2),            // It display all data in card view with curve corner.the detailwidget is a object of dart file for all details page
    MarkWidget(),
    HeaderContainer.init("Grade Boundry","Grade Level 1"), // It display date in blue container
    TypeView(),
    TitleViewDetail.init(propertyService.getExamData()),  // It display title of place and description in listview.
    DescriptionCustomView.init(propertyService.getExamData()),  // Alll place data is displayed in container
    TitleViewDetail.init(propertyService.getData()),
    DescriptionCustomView.init(propertyService.getData()),
    ButtonUI(),
    // AttachmentView(),                                       // It dispay container in water mark
    // AttachmentFileView(),                                    // This display all atachment in listview.
  ];
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
              child: Text("Card Demo"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DemoCard()),
                );

              },

            ),
            RaisedButton(
              child: Text("Main page"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainDetailPage()),
                );

              },

            ),
            RaisedButton(
              child: Text("Event Page"),
              onPressed: () {
                Navigator.push(
                  context,
                  //DetailView2Oct is a main page with scaffold which render all details widgets.
                  MaterialPageRoute(builder: (context) => DetailView2Oct.init(eventWidget,"Event")),
                );

              },

            ),
            RaisedButton(
              child: Text("Exam Page"),
              onPressed: () {
                Navigator.push(
                  context,
                  //DetailView2Oct is a main page with scaffold which render all details widgets.
                  MaterialPageRoute(builder: (context) => DetailView2Oct.init(examWidget,"Exam")),
                );

              },

            ),
            RaisedButton(
              child: Text("Exam Page 2"),
              onPressed: () {
                Navigator.push(
                  context,
                  //DetailView2Oct is a main page with scaffold which render all details widgets.
                  MaterialPageRoute(builder: (context) => DetailView2Oct.init(examWidget2," ")),
                );

              },

            ),

          ],
        ),
      ),
    );
  }
}