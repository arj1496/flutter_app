/**
 * This is the generic container used for description and place in event.
 * To diaplay label and data this container is used.
 * In this property file is accepted in constructor from calling widgets.
 * property contains label,icon and data properties.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/AppTheme.dart';
import '../PropertyFile.dart';
import 'mo/CommanCode/GenericModel.dart';
import 'mo/Exam/Exam.dart';
import 'mo/Exam/ExamActivity.dart';
import 'mo/Exam/ExamService.dart';

class ButtonUI2 extends StatefulWidget {

  GlobalKey<FormState> formKey;
  GenericModel genericModel;
  String button1,button2,button3;
  Exam exam = new Exam();
  ButtonUI2.init(formKey, _eventPojo,String button1,String button2,String button3,exam) {
    this.formKey = formKey;
    this.genericModel = _eventPojo;
    this.button1 = button1;
    this.button2 = button2;
    this.button3 = button3;
    this.exam = exam;
  }

  ButtonUI2(this.formKey, this.genericModel);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ButtonUIState();
  }


}
class ButtonUIState extends  State<ButtonUI2> {
  var property = new PropertyFile();

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
              getButtonUI(widget.button2, false),
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
    ExamActivity examActivity = new ExamActivity();

   if(text == "DRAFT"){
     if(widget.formKey.currentState.validate()){
       widget.formKey.currentState.save();
     }
     widget.genericModel.status = "DRAFT";
     if(widget.exam != null) {
       widget.genericModel.examId = widget.exam.id;
     }
     int examObject = await examActivity.addExamToServer_(widget.formKey, widget.genericModel);
     if(examObject != null){
       final snackBar = SnackBar(content: Text('Exam added sucessfully!'));
       Scaffold.of(context).showSnackBar(snackBar);
     }
   }else if(text == "PUBLISH"){
     widget.genericModel.status = "PUBLISH";
     if(widget.exam != null) {
       widget.genericModel.examId = widget.exam.id;
     }
     int examObject = await examActivity.addExamToServer_(widget.formKey, widget.genericModel);
     if(examObject != null){
       final snackBar = SnackBar(content: Text('Exam added sucessfully!'));
       Scaffold.of(context).showSnackBar(snackBar);
     }
   }
  }
}

