import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'PropertyFile.dart';


class Datewidget3 extends StatelessWidget {

  var property = new PropertyFile();
  /*DateWidget.init(PropertyFile property){
    this.property = property;
  }*/

  Datewidget3(){

  }
  @override
  Widget build( BuildContext context ) {
    return _getTileViewWidget();

  }

  /* List<Widget> _getWidget(){
    List<Widget> list = [
      DescriptionCustomView.init(propertyService.getData())
    ];
    return list;
  }*/

  Widget _getTileViewWidget() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24, right: 24 ,bottom:20,
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            AppTheme.nearlyDarkBlue,
            HexColor("#6F56E8")
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
              topRight: Radius.circular(8.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: AppTheme.grey.withOpacity(0.6),
                offset: Offset(1.1, 1.1),
                blurRadius: 10.0),
          ],
        ),
        child:_getDateViewWidget(),

      ),
    );

  }
  Widget _getDateViewWidget() {
    return Padding (
      padding: const EdgeInsets.only(
          left: 10 , right: 10 , top: 8 , bottom: 16 ) ,
      child: Row (
        children: <Widget>[
          Expanded (
            child: Column (
              mainAxisAlignment: MainAxisAlignment.center ,
              crossAxisAlignment: CrossAxisAlignment.start ,
              children: <Widget>[
                Padding (
                  padding: const EdgeInsets.only( top: 4 ) ,
                  child: Container (
                    height: 4 ,
                    width: 70 ,
                    decoration: BoxDecoration (
                      /*color:
                                                                    HexColor('#87A0E5').withOpacity(0.2),*/
                      borderRadius: BorderRadius.all (
                          Radius.circular ( 4.0 ) ) ,
                    ) ,
                    child: Row (
                      children: <Widget>[
                        Container (
                          width: ((70 / 1.2)) , //* animation.value),
                          height: 4 ,
                          decoration: BoxDecoration (
                            /*gradient: LinearGradient(colors: [
                                                                            HexColor('#87A0E5'),
                                                                            HexColor('#87A0E5')
                                                                                .withOpacity(0.5),
                                                                          ]),*/
                            borderRadius: BorderRadius.all (
                                Radius.circular ( 4.0 ) ) ,
                          ) ,
                        )
                      ] ,
                    ) ,
                  ) ,
                ) ,
                Padding (
                  padding: const EdgeInsets.only( top: 6 ) ,
                  child: Text (
                    '2 Oct 2019 ' ,
                    textAlign: TextAlign.center ,
                    style: TextStyle (
                      fontFamily: AppTheme.robotoFontName ,
                      fontWeight: FontWeight.w500 ,
                      fontSize: 16 ,
                      //  letterSpacing: -0.2 ,
                      color: AppTheme.white ,
                    ) ,
                  ) ,
                ) ,


                Padding (
                  padding: const EdgeInsets.only( top: 16,left:8 ) ,
                  child: Text (
                    '8:00 AM' ,
                    textAlign: TextAlign.center ,
                    style: TextStyle (
                      fontFamily: AppTheme.robotoFontName ,
                      fontWeight: FontWeight.w600 ,
                      fontSize: 12 ,
                      color: AppTheme.white
                          .withOpacity ( 0.5 ) ,
                    ) ,
                  ) ,
                ) ,

              ] ,
            ) ,
          ) ,
          Expanded (
            child: Row (
              mainAxisAlignment: MainAxisAlignment.center ,
              crossAxisAlignment: CrossAxisAlignment.center ,
              children: <Widget>[
                Column (
                  mainAxisAlignment: MainAxisAlignment.center ,
                  crossAxisAlignment: CrossAxisAlignment.start ,
                  children: <Widget>[
                    Text (
                      'Duration' ,
                      textAlign: TextAlign.center ,
                      style: TextStyle (
                        fontFamily: AppTheme.robotoFontName ,
                        fontWeight: FontWeight.w600 ,
                        fontSize: 12 ,
                        color: AppTheme.white
                            .withOpacity ( 0.5 ) ,
                      ) ,
                    ) ,
                    Padding (
                      padding: const EdgeInsets.only( top: 4 ) ,
                      child: Container (
                        height: 4 ,
                        width: 70 ,
                        decoration: BoxDecoration (
                          /*color: HexColor('#F56E98')
                                                                    .withOpacity(0.2),*/
                          borderRadius: BorderRadius.all (
                              Radius.circular ( 4.0 ) ) ,
                        ) ,
                        child: Row (
                          children: <Widget>[
                            Container (
                              width: ((70 / 2)) , /* *
                                                                        animationController.value),*/
                              height: 4 ,
                              decoration: BoxDecoration (
                                /* gradient:
                                                                      LinearGradient(colors: [
                                                                        HexColor('#F56E98')
                                                                            .withOpacity(0.1),
                                                                        HexColor('#F56E98'),
                                                                      ]),*/
                                borderRadius: BorderRadius.all (
                                    Radius.circular ( 4.0 ) ) ,
                              ) ,
                            ) ,
                          ] ,
                        ) ,
                      ) ,
                    ) ,
                    Padding (
                      padding: const EdgeInsets.only( top: 6 ) ,
                      child: Text (
                        '2 hours' ,
                        textAlign: TextAlign.center ,
                        style: TextStyle (
                          fontFamily: AppTheme.robotoFontName ,
                          fontWeight: FontWeight.w500 ,
                          fontSize: 16 ,
                          //  letterSpacing: -0.2 ,
                          color: AppTheme.white ,
                        ) ,
                      ) ,
                    ) ,
                  ] ,
                ) ,
              ] ,
            ) ,
          ) ,
          Expanded (
            child: Row (
              mainAxisAlignment: MainAxisAlignment.end ,
              crossAxisAlignment: CrossAxisAlignment.center ,
              children: <Widget>[
                Column (
                  mainAxisAlignment: MainAxisAlignment.center ,
                  crossAxisAlignment: CrossAxisAlignment.start ,
                  children: <Widget>[

                    Padding (
                      padding: const EdgeInsets.only(
                          right: 0 , top: 4 ) ,
                      child: Container (
                        height: 4 ,
                        width: 70 ,
                        decoration: BoxDecoration (
                          /*color: HexColor('#F1B440')
                                                                    .withOpacity(0.2),*/
                          borderRadius: BorderRadius.all (
                              Radius.circular ( 4.0 ) ) ,
                        ) ,
                        child: Row (
                          children: <Widget>[
                            Container (
                              width: ((70 / 2.5)) ,
                              height: 4 ,
                              decoration: BoxDecoration (
                                /* gradient:
                                                                      LinearGradient(colors: [
                                                                        HexColor('#F1B440')
                                                                            .withOpacity(0.1),
                                                                        HexColor('#F1B440'),
                                                                      ]),*/
                                borderRadius: BorderRadius.all (
                                    Radius.circular ( 4.0 ) ) ,
                              ) ,
                            ) ,
                          ] ,
                        ) ,
                      ) ,
                    ) ,
                    Padding (
                      padding: const EdgeInsets.only( top: 6 ) ,
                      child: Text (
                        '2 Oct 2019' ,
                        textAlign: TextAlign.center ,
                        style: TextStyle (
                          fontFamily: AppTheme.robotoFontName ,
                          fontWeight: FontWeight.w500 ,
                          fontSize: 16 ,
                          //  letterSpacing: -0.2 ,
                          color: AppTheme.white ,
                        ) ,
                      ) ,
                    ) ,
                    Padding (
                      padding: const EdgeInsets.only( top: 16,left:8 ) ,
                      child: Text (
                        '11:45 PM' ,
                        textAlign: TextAlign.center ,
                        style: TextStyle (
                          fontFamily: AppTheme.robotoFontName ,
                          fontWeight: FontWeight.w600 ,
                          fontSize: 12 ,
                          color: AppTheme.white
                              .withOpacity ( 0.5 ) ,
                        ) ,
                      ) ,
                    ) ,
                  ] ,
                ) ,
              ] ,
            ) ,
          )
        ] ,
      ) ,
    );
  }
}