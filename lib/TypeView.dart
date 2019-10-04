import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/AppTheme.dart';


import 'PropertyFile.dart';

class TypeView extends StatelessWidget {

  var property = new PropertyFile();
  /*DateWidget.init(PropertyFile property){
    this.property = property;
  }*/

  TypeView(){

  }
  @override
  Widget build( BuildContext context ) {
    return _getTileViewWidget();

  }
  Widget _getTileViewWidget() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
              left: 10, right: 10, top: 4, bottom: 10),
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: HexColor("#D7E0F9"),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                        topRight: Radius.circular(8.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: AppTheme.grey.withOpacity(0.2),
                          offset: Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, bottom: 12, right: 16, top: 12),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(right:165.0),
                            child: Text(
                              'Type',
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
                        ),

                      ),

                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
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

