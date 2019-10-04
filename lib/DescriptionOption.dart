import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/AttachmentView.dart';
import 'package:flutter_app/CardDetail2Oct.dart';
import 'package:flutter_app/DateWidget.dart';
import 'package:flutter_app/DemoCard.dart';
import 'package:flutter_app/DetailView2Oct.dart';
import 'package:flutter_app/MainDetailPage.dart';
import 'package:flutter_app/PropertyService.dart';
import 'package:flutter_app/TitleViewDetail.dart';
import 'AttachmentFileView.dart';
import 'DescriptionCustomView.dart';
import 'EventWidget.dart';
import 'HeaderContainer.dart';



class DescriptionOption extends StatelessWidget {


  static PropertyService propertyService = new PropertyService();
  static List<Widget> detailWidget = [EventWidget(),];
  static List<Widget> dateWidget = [DateWidget(),];
  List<Widget> customWidget = [
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
 // List<Widget> widgetList = [DescriptionCustomView()];
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
              child: Text("Main page 2 oct"),
              onPressed: () {
                Navigator.push(
                  context,
                  //DetailView2Oct is a main page with scaffold which render all details widgets.
                  MaterialPageRoute(builder: (context) => DetailView2Oct.init(customWidget)),
                );

              },

            ),

          ],
        ),
      ),
    );
  }
}