import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'PropertyFile.dart';

class AttachmentView extends StatelessWidget {

  var property = new PropertyFile();
  /*DateWidget.init(PropertyFile property){
    this.property = property;
  }*/

  AttachmentView(){

  }
  @override
  Widget build( BuildContext context ) {
    return _getTileViewWidget();

  }



  Widget _getTileViewWidget() {

    return   Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  top: 0, bottom: 24),
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Container(

                      decoration: BoxDecoration(
                        color: HexColor("#D7E0F9"),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0),
                            topRight: Radius.circular(8.0)),

                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 68, bottom: 12, right: 16, top: 12),
                            child: Text(
                              'Prepare your stomach for lunch with one or two glass of water',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: AppTheme.robotoFontName,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                letterSpacing: 0.0,
                                color: AppTheme.nearlyDarkBlue
                                    .withOpacity(0.6),
                              ),
                            ),

                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 68, bottom: 12, right: 16, top: 12),
                            child: Text(
                              '5',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontFamily: AppTheme.robotoFontName,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                letterSpacing: 0.0,
                                color: AppTheme.nearlyDarkBlue
                                    .withOpacity(0.6),
                              ),
                            ),

                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    left: 0,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset("assets/images/clip.png"),
                    ),
                  )
                ],
              ),
            ),
          ],


    );
  }
}

class Vehicle {
  final String title;
  List<String> contents = [];
  final IconData icon;

  Vehicle(this.title, this.contents, this.icon);

}

List<Vehicle> vehicles = [
  new Vehicle(
    'Bike',
    ['Vehicle no. 1', 'Vehicle no. 2', 'Vehicle no. 7', 'Vehicle no. 10'],
    Icons.motorcycle,
  ),
  new Vehicle(
    'Cars',
    ['Vehicle no. 3', 'Vehicle no. 4', 'Vehicle no. 6'],
    Icons.directions_car,
  ),

];