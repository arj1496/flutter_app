/**
 * This is the generic container used for description and place in event.
 * To diaplay label and data this container is used.
 * In this property file is accepted in constructor from calling widgets.
 * property contains label,icon and data properties.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_app/PropertyFile.dart';
import 'package:flutter_app/PropertyService.dart';
import 'package:flutter_app/src/mo/Exam/Exam.dart';
import 'package:flutter_app/src/mo/Exam/ExamEditPage.dart';


class ButtonUI extends StatefulWidget {

  Exam exam = new Exam();
  String button1,button2,button3;
  ButtonUI.init(String button1,String button3,Exam exam) {
    this.button1 = button1;
    this.button3 = button3;
    this.exam = exam;
  }



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ButtonUIState();
  }


}
class ButtonUIState extends  State<ButtonUI> {


  @override
  Widget build( BuildContext context ) {

    return getCategoryUI();
  }

  Widget getCategoryUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        /*Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
          child: Text(
            "Category",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: AppTheme.darkerText,
            ),
          ),
        ),*/
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: <Widget>[
              getButtonUI(widget.button1, true),
              SizedBox(
                width: 16,
              ),
              //getButtonUI(widget.button2, false),
              SizedBox(
                width: 16,
              ),
              getButtonUI(widget.button3, false),
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),

      ],
    );
  }

  Widget getButtonUI(String text, bool isSelected) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
        child: Material(  //Wrap with Material
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(24.0),
              side: BorderSide(color: AppTheme.nearlyBlue)
          ),
          //elevation: 16.0,
          clipBehavior: Clip.antiAlias, // Add This
          child: MaterialButton(
            minWidth: 200.0,
            height: 35,
            child: new Text(text,
                style: new TextStyle(fontSize: 12.0, color: AppTheme.nearlyBlue)),
            onPressed: (){
              justClick(text);

//          setState(() {
//            _isNeedHelp = true;
//          });
            },
          ),
        ),
      ),
    );
  }

  justClick(String text) async {
    /*PropertyService propertyService =  new PropertyService();
    PropertyFile propertyFile1 = propertyService.getExamData();
     widget.exam.description = propertyFile1.data;
     propertyFile1 = propertyService.getSyllabusData();
     widget.exam.syllabus = propertyFile1.data;*/
    if(text == "EDIT"){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ExamEditPage(widget.exam),
        ),
      );
    }else if(text == "DELETE"){
      print("PUBLISH");
    }
  }
}

