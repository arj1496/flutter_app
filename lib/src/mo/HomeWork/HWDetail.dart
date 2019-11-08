import 'package:flutter/material.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_app/CustomAppbar.dart';
import 'package:flutter_app/DateWidget2.dart';
import 'package:flutter_app/HeaderContainer.dart';
import 'package:flutter_app/src/mo/Event/HWWidget.dart';
import 'package:flutter_app/src/mo/Exam/Exam.dart';
import 'package:flutter_app/src/mo/Exam/ExamActivity.dart';
import 'package:flutter_app/src/mo/HomeWork/HomeWork.dart';
import 'package:flutter_app/src/mo/HomeWork/SubmissionPageUI.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../ButtonUI.dart';
import '../../../CardDetail2Oct.dart';
import '../../../DescriptionCustomView.dart';
import '../../../TitleViewDetail.dart';
import 'HomeworkEdit.dart';


class HWDetail extends StatefulWidget {
  List<Widget> customWidget = new List();
  String title = null;
  HomeWork homeWork = new HomeWork();
  @override
  State<StatefulWidget> createState() {
    return DetailViewUVState();
  }


  HWDetail(HomeWork homeWork ){
    this.homeWork = homeWork;

  }
}

class DetailViewUVState extends State<HWDetail> {

  List<Widget> customWidget = new List( );
  String title = null;

  /* DetailViewUVState(List<Widget> customWidget,title){
    this.customWidget = customWidget;
    this.title = title;
  }*/


  @override
  Widget build( BuildContext context ) {
    return _getContainerWidget ( );
  }

  Widget _getContainerWidget( ) {
    return Container (
      color: AppTheme.background ,
      child: _getNormalScaffold ( ) ,
    );
  }

  _getNormalScaffold( ) {
    return Scaffold (
      appBar: CustomAppbar.init ( " " ) ,
      //backgroundColor: Colors.transparent,
      body: SingleChildScrollView (
        child: Column (
          children: _getWidget ( widget.homeWork ) ,
        ) ,
      ) ,
    );
  }

  List<Widget> _getWidget( HomeWork homeWork ) {
    ExamActivity examActivity = new ExamActivity( );
    List<Widget> examWidget2 = [
      HeaderContainer.init ( homeWork.title , "" ) ,
      // For Appbar of evenry page.It constructor contains title which i displayed on header.
      CardDetail2Oct ( HWWidget ( homeWork ) ) ,
      // It display all data in card view with curve corner.the detailwidget is a object of dart file for all details page
      DateWidget2 ( homeWork ) ,
      TitleViewDetail.init ( "Description" , FontAwesomeIcons.bookOpen ) ,
      DescriptionCustomView.init ( homeWork.description ) ,
      getSubmisionContainer ( ) ,
      getSubmissionButton( )
      // submitButton(homeWork),
    ];
    return examWidget2;
  }


  submitButton( homeWork ) {
    return Padding (
      padding: EdgeInsets.only ( bottom: 5 , top: 30 , left: 10 , right: 10 ) ,
      child: Row (
        children: <Widget>[Material ( //Wrap with Material
          shape: RoundedRectangleBorder (
              borderRadius: new BorderRadius.circular( 24.0 ) ,
              side: BorderSide ( color: AppTheme.nearlyBlue )
          ) ,
          //elevation: 16.0,
          clipBehavior: Clip.antiAlias , // Add This
          child: MaterialButton (
            minWidth: 150.0 ,
            height: 35 ,
            child: new Text( "EDIT" ,
                style: new TextStyle(
                    fontSize: 12.0 , color: AppTheme.nearlyBlue ) ) ,
            onPressed: ( ) {
              Navigator.push (
                context ,
                MaterialPageRoute (
                    builder: ( context ) => HomeworkEdit ( homeWork ) ) ,
              );
            } ,
          ) ,
        ) ,

          Padding (
            padding: const EdgeInsets.all( 8.0 ) ,
            child: Material ( //Wrap with Material
              shape: RoundedRectangleBorder (
                  borderRadius: new BorderRadius.circular( 24.0 ) ,
                  side: BorderSide ( color: AppTheme.nearlyBlue )
              ) ,
              //elevation: 16.0,
              clipBehavior: Clip.antiAlias , // Add This
              child: MaterialButton (
                minWidth: 150.0 ,
                height: 35 ,
                child: new Text( "CANCEL" ,
                    style: new TextStyle(
                        fontSize: 12.0 , color: AppTheme.nearlyBlue ) ) ,
                onPressed: ( ) {
                  Navigator.pop ( context );
                } ,
              ) ,
            ) ,
          ) ,
        ] ,
      ) ,
    );

    //return ButtonUI2.init(_formKey, genericModel,'DRAFT','PUBLISH','CLOSE',exam);

  }

  getSubmisionContainer( ) {
    return Padding (
      padding: EdgeInsets.only (
          top: 1 ,
          left: 8 ,
          right: 8 ,
          bottom: 8
      ) ,
      child: new Container (
        width: 800 ,
        height: 170 ,
        alignment: Alignment.topLeft ,
        decoration: BoxDecoration (
          color: AppTheme.white ,
          borderRadius: BorderRadius.only (
              topLeft: Radius.circular ( 8.0 ) ,
              bottomLeft: Radius.circular ( 8.0 ) ,
              bottomRight: Radius.circular ( 8.0 ) ,
              topRight: Radius.circular ( 8.0 )
          ) ,
          boxShadow: <BoxShadow>[
            BoxShadow (
                color: AppTheme.grey.withOpacity ( 0.2 ) ,
                offset: Offset ( 1.1 , 1.1 ) ,
                blurRadius: 10.0 ) ,
          ] ,
        ) ,
        child:Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 4
                  ),
                  child: Column(
                    children: <Widget>[

                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 4, bottom: 2),
                                  child: Text(
                                    'Student Corner :--',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily:
                                      AppTheme.robotoFontName,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      letterSpacing: -0.1,
                                      color: AppTheme.nearlyBlack
                                          .withOpacity(0.7),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.end,
                                  children: <Widget>[
                                    /*SizedBox(
                                        width: 28,
                                        height: 28,
                                        child: Image.asset(
                                            "assets/fitness_app/burned.png"),
                                      ),*/
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(
                                          left: 16, bottom: 3),
                                      child: Text(
                                        'Review note for you',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: AppTheme.robotoFontName,
                                          fontWeight:
                                          FontWeight.w600,
                                          fontSize: 12,
                                          color: AppTheme.darkerText,
                                        ),
                                      ),
                                    ),

                                  ],
                                ),


                              ],
                            ),
                          )
                        ],
                      ),


                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        crossAxisAlignment:
                        CrossAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left:10.0),
                            child: Text(
                                              "Status :",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: AppTheme.robotoFontName,
                                              fontWeight:
                                              FontWeight.w700,
                                              fontSize: 18,
                                              color: AppTheme.darkerText,
                                            ),
                                          ),
                          ),

                          Padding(
                            padding:
                             EdgeInsets.only(
                                left: 4),
                            child: Text(
                              "NOPROGRESS",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: AppTheme.robotoFontName,
                                fontWeight:
                                FontWeight.w600,
                                fontSize: 16,
                                color: AppTheme.darkerText,
                              ),
                            ),
                          ),

                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left:0),
                              child: Text("A",

                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily:AppTheme.robotoFontName,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  letterSpacing: -0.1,
                                  color: AppTheme.grey.withOpacity(0.5),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.end,
                              crossAxisAlignment:
                              CrossAxisAlignment.end,
                              children: <Widget>[

                                Padding(
                                  padding:
                                  const EdgeInsets.only(
                                      bottom: 3),
                                  child: MaterialButton (
                                    color:HexColor("#6F56E8"),
                                    minWidth: 100.0 ,
                                    height: 35 ,
                                    child: new Text( "Submission" ,
                                        style: new TextStyle(
                                            fontSize: 12.0 , color: AppTheme.white ) ) ,
                                    onPressed: ( ) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => SubmissionPageUI()),
                                      );
                                    } ,
                                  ) ,
                                ),

                              ],
                            ),
                          ],
                        ),
                      )
           ],
        ),
      ) ,

    ),
    ],
    ),
      ),);


  }

  getSubmissionButton( ) {
    return Padding (
      padding: EdgeInsets.only ( bottom: 0 , top: 30 , left: 5 , right: 0 ) ,
      child: Row (
        children: <Widget>[Material ( //Wrap with Material
          shape: RoundedRectangleBorder (
              /*borderRadius: new BorderRadius.circular( 24.0 ) ,*/
              side: BorderSide ( color: AppTheme.nearlyBlue )
          ) ,
          //elevation: 16.0,
          clipBehavior: Clip.antiAlias , // Add This
          child: MaterialButton (

            minWidth: 350.0 ,
            height: 35 ,
            child: new Text( "Submission" ,
                style: new TextStyle(
                    fontSize: 12.0 , color: AppTheme.nearlyBlue ) ) ,
            onPressed: ( ) {
              /*Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeworkEdit(homeWork)),
              );*/
            } ,
          ) ,
        ) ,
        ] ,
      ) ,
    );
  }
}
