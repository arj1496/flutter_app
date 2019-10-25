import 'package:flutter/material.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_app/CustomAppbar.dart';
import 'package:flutter_app/HeaderContainer.dart';
import 'package:flutter_app/src/mo/Exam/Exam.dart';
import 'package:flutter_app/src/mo/Exam/ExamActivity.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'ButtonUI.dart';
import 'CardDetail2Oct.dart';
import 'DescriptionCustomView.dart';
import 'ExamWidget2.dart';
import 'MarkWidget.dart';
import 'TitleViewDetail.dart';

class DetailView2Oct extends StatefulWidget {
  List<Widget> customWidget = new List();
  String title = null;
  Exam exam = new Exam();
  @override
  State<StatefulWidget> createState() {
    return DetailViewUVState();
  }
  DetailView2Oct.init(List<Widget> customWidget,String title ){
    this.customWidget = customWidget;
    this.title = title;
  }

  DetailView2Oct.examInit(Exam exam ){
    this.exam = exam;

  }


}

class DetailViewUVState extends State<DetailView2Oct>{

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
          children:  _getWidget(widget.exam),
        ),
      ),
    );
  }
  List<Widget> _getWidget(Exam exam){
    ExamActivity examActivity = new ExamActivity();
    List<Widget> examWidget2 = [
      HeaderContainer.init(exam.name,""),     // For Appbar of evenry page.It constructor contains title which i displayed on header.
      CardDetail2Oct(ExamWidget2(exam)),            // It display all data in card view with curve corner.the detailwidget is a object of dart file for all details page
      MarkWidget(exam),
      TitleViewDetail.init("Syllabus",FontAwesomeIcons.book),  // It display title of place and description in listview.
      DescriptionCustomView.init(exam.syllabus),  // Alll place data is displayed in container
      TitleViewDetail.init("Description",FontAwesomeIcons.bookOpen),
      DescriptionCustomView.init(exam.description),
      ButtonUI.init('EDIT','CLOSE',exam),
    ];
      return examWidget2;
  }
}

