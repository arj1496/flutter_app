import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'PropertyFile.dart';

class DateWidget extends StatelessWidget {

  var property = new PropertyFile( );


  DateWidget( ) {

  }

  @override
  Widget build( BuildContext context ) {
    return _getTileViewWidget ( );
  }

  /* List<Widget> _getWidget(){
    List<Widget> list = [
      DescriptionCustomView.init(propertyService.getData())
    ];
    return list;
  }*/

  Widget _getTileViewWidget( ) {
    return Padding (
      padding: const EdgeInsets.only(
          left: 10 , right: 10,bottom: 8
      ) ,
      child: Container (
        decoration: BoxDecoration (
          gradient: LinearGradient ( colors: [
            AppTheme.nearlyDarkBlue ,
            HexColor ( "#6F56E8" )
          ] , begin: Alignment.topLeft , end: Alignment.bottomRight ) ,
          borderRadius: BorderRadius.only (
              topLeft: Radius.circular ( 8.0 ) ,
              bottomLeft: Radius.circular ( 8.0 ) ,
              bottomRight: Radius.circular ( 8.0 ) ,
              topRight: Radius.circular ( 8.0 ) ) ,
          boxShadow: <BoxShadow>[
            BoxShadow (
                color: AppTheme.grey.withOpacity ( 0.6 ) ,
                offset: Offset ( 1.1 , 1.1 ) ,
                blurRadius: 10.0 ) ,
          ] ,
        ) ,
        child: _getDateViewWidget ( ) ,
        /*Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Next ',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: AppTheme.robotoFontName,
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  letterSpacing: 0.0,
                  color: AppTheme.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Legs Toning and\nGlutes Workout at Home',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: AppTheme.robotoFontName,
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    letterSpacing: 0.0,
                    color: AppTheme.white,
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Icon(
                        Icons.timer,
                        color: AppTheme.white,
                        size: 16,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(
                        '68 min',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: AppTheme.robotoFontName,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          letterSpacing: 0.0,
                          color: AppTheme.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppTheme.nearlyWhite,
                        shape: BoxShape.circle,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: AppTheme.nearlyBlack
                                  .withOpacity(0.4),
                              offset: Offset(8.0, 8.0),
                              blurRadius: 8.0),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Icon(
                          Icons.arrow_right,
                         // color: HexColor("#6F56E8"),
                          size: 44,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),*/
      ) ,
    );
  }

  Widget _getDateViewWidget( ) {
    return Padding (
      padding: const EdgeInsets.only(
          left: 6 , right:  6, top: 8 , bottom: 8 ) ,
      child: Row (
        children: <Widget>[
          Expanded (
            child: Column (
              mainAxisAlignment: MainAxisAlignment.center ,
              crossAxisAlignment: CrossAxisAlignment.start ,
              children: <Widget>[
                Padding (
                  padding: const EdgeInsets.only (left: 7.0 ) ,
                  child: Text (
                    'Start Date' ,
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
                Padding (
                  padding: const EdgeInsets.only( top: 1 , left: 4 ) ,
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
                  padding: const EdgeInsets.only( top: 2 , left: 8 ) ,
                  child: Text (
                    '12 Oct' ,
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
                  padding: const EdgeInsets.only( top: 5 , left: 8 ) ,
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
                     Padding(
                       padding: const EdgeInsets.only(left:5.0,bottom:4),
                       child: SizedBox(
                          width: 20,
                          height: 25,
                          child: IconButton(
                              icon:new Icon(FontAwesomeIcons.clock),
                            color: Colors.red,
                          ),

                        ),
                     ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text (
                        '2 hrs' ,
                        textAlign: TextAlign.center ,
                        style: TextStyle (
                          fontFamily: AppTheme.robotoFontName ,
                          fontWeight: FontWeight.w600 ,
                          fontSize: 12 ,
                          color: AppTheme.white
                              .withOpacity ( 0.5 ) ,
                        ) ,
                      ),
                    ) ,
                    /*Padding (
                      padding: const EdgeInsets.only( top: 1 ) ,
                      child: Container (
                        height: 4 ,
                        width: 70 ,
                        decoration: BoxDecoration (
                          *//*color: HexColor('#F56E98')
                                                                    .withOpacity(0.2),*//*
                          borderRadius: BorderRadius.all (
                              Radius.circular ( 4.0 ) ) ,
                        ) ,
                        child: Row (
                          children: <Widget>[
                            Container (
                              width: ((70 / 2)) , *//* *
                                                                        animationController.value),*//*
                              height: 4 ,
                              decoration: BoxDecoration (
                                *//* gradient:
                                                                      LinearGradient(colors: [
                                                                        HexColor('#F56E98')
                                                                            .withOpacity(0.1),
                                                                        HexColor('#F56E98'),
                                                                      ]),*//*
                                borderRadius: BorderRadius.all (
                                    Radius.circular ( 4.0 ) ) ,
                              ) ,
                            ) ,

                          ] ,
                        ),

                      ) ,
                    ) ,*/

                   /* Padding (
                      padding: const EdgeInsets.only( top: 1 ) ,
                      child: Text (
                        '2 hrs' ,
                        textAlign: TextAlign.center ,
                        style: TextStyle (
                          fontFamily: AppTheme.robotoFontName ,
                          fontWeight: FontWeight.w500 ,
                          fontSize: 16 ,
                          //  letterSpacing: -0.2 ,
                          color: AppTheme.white ,
                        ) ,
                      ) ,
                    ) ,*/
                  ] ,
                ) ,
              ] ,
            ) ,
          ) ,
          Expanded (
            child: Column (
              mainAxisAlignment: MainAxisAlignment.start ,
              crossAxisAlignment: CrossAxisAlignment.start ,
              children: <Widget>[
                Padding (
                  padding: const EdgeInsets.only( left: 28.0 ) ,
                  child: Text (
                    'End Date' ,
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
                Padding (
                  padding: const EdgeInsets.only( top: 1 , left: 24 ) ,
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
                  padding: const EdgeInsets.only( top: 2 , left: 28 ) ,
                  child: Text (
                    '12 Oct' ,
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
                  padding: const EdgeInsets.only( top: 5 , left: 28 ) ,
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
          )
        ] ,
      ) ,
    );
  }
}