import 'package:flutter/material.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_app/CustomAppbar.dart';
import 'package:flutter_app/DateWidget2.dart';
import 'package:flutter_app/HeaderContainer.dart';
import 'package:flutter_app/src/mo/Event/HWWidget.dart';
import 'package:flutter_app/src/mo/Exam/Exam.dart';
import 'package:flutter_app/src/mo/Exam/ExamActivity.dart';
import 'package:flutter_app/src/mo/HomeWork/HomeWork.dart';
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

class DetailViewUVState extends State<HWDetail>{

  List<Widget> customWidget = new List();
  String title = null;
  /* DetailViewUVState(List<Widget> customWidget,title){
    this.customWidget = customWidget;
    this.title = title;
  }*/




  @override
  Widget build(BuildContext context) {
    return _getContainerWidget();
  }

  Widget _getContainerWidget() {
    return Container(
      color: AppTheme.background,
      child: _getNormalScaffold(),
    );
  }

  _getNormalScaffold() {
    return Scaffold(
      appBar: CustomAppbar.init(" "),
      //backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children:  _getWidget(widget.homeWork),
        ),
      ),
    );
  }
  List<Widget> _getWidget(HomeWork homeWork){
    ExamActivity examActivity = new ExamActivity();
    List<Widget> examWidget2 = [
      HeaderContainer.init(homeWork.title,""),     // For Appbar of evenry page.It constructor contains title which i displayed on header.
      CardDetail2Oct(HWWidget(homeWork)),            // It display all data in card view with curve corner.the detailwidget is a object of dart file for all details page
      DateWidget2(homeWork),
      TitleViewDetail.init("Description",FontAwesomeIcons.bookOpen),
      DescriptionCustomView.init(homeWork.description),
      submitButton(homeWork),
    ];
    return examWidget2;
  }


  submitButton(homeWork) {
    return Padding (
      padding: EdgeInsets.only ( bottom: 5 , top: 30,left:10,right:10 ) ,
      child: Row (
        children: <Widget>[Material ( //Wrap with Material
          shape: RoundedRectangleBorder (
              borderRadius: new BorderRadius.circular( 24.0) ,
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeworkEdit(homeWork)),
              );
            },
          ) ,
        ) ,

          Padding(
            padding: const EdgeInsets.all(8.0),
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
            ),
          ) ,
        ] ,
      ) ,
    );

    //return ButtonUI2.init(_formKey, genericModel,'DRAFT','PUBLISH','CLOSE',exam);

  }
}

