import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_app/src/fr/SchoolUtils.dart';
import 'package:flutter_app/src/mo/Exam/Exam.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'PropertyFile.dart';

class MarkWidget extends StatelessWidget {

  var property = new PropertyFile( );
  Exam exam = new Exam();
  SchoolUtils schoolUtils = new SchoolUtils();
  MarkWidget( Exam exam) {
   this.exam = exam;
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
                    'Mark' ,
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
                   exam.totalMark.toString() ,
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
                        '3:30 PM' ,
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
                  padding: const EdgeInsets.only( left: 35.0 ) ,
                  child: Text (
                    'Date' ,
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
                    schoolUtils.getDateStringWithoutYear(exam.examDate),
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
          )
        ] ,
      ) ,
    );
  }
}