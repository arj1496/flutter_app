import 'dart:math';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_app/src/fr/SchoolUtils.dart';
import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:flutter_app/src/mo/Exam/Exam.dart';
import 'package:intl/intl.dart';

class DatePickerDemo extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return ExamAddUIState.init();
  }
  GlobalKey<FormState> formKey;
  GenericModel genericModel;
  Exam exam = new Exam();
  DatePickerDemo.init(formKey, _eventPojo,exam) {
    this.formKey = formKey;
    this.genericModel = _eventPojo;
    this.exam = exam;
  }
}

class ExamAddUIState extends State<DatePickerDemo>{

  DateTime _todayDate = new DateTime.now();
  TimeOfDay  _pickedTime = TimeOfDay.now();
  TextEditingController labelText = new TextEditingController();
  SchoolUtils schoolUtils = new SchoolUtils();

  @override
  void initState() {
   /* if(widget.exam!= null && widget.exam.examDate != null){
      _todayDate = new DateTime.fromMicrosecondsSinceEpoch(widget.exam.examDate );
    }*/
  }
  ExamAddUIState.init(){}

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      top: false,
      bottom: false,
      child: Form(
          autovalidate: true,
          child: Column(
            children: <Widget>[
              // This method is Accepts 2 parameter
              // 0 : Icon, 1 : hintText , 2 : Label Text
              _getDatePicker("date", context),
              _getTimePicker("time", context),
              //  getDateTimeUI(),
            ],
          )
      ),
    );
    }


  /*_getSafeAreaBody() {
    return SafeArea(
      top: false,
      bottom: false,
      child: Form(
          autovalidate: true,
          child: Column(
            children: <Widget>[
              // This method is Accepts 2 parameter
              // 0 : Icon, 1 : hintText , 2 : Label Text
              _getDatePicker("date", context),
              _getTimePicker("time", context),
              //  getDateTimeUI(),
            ],
          )
      ),
    );
  }*/

  getDateTimeUI(){

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          _getDatePicker("date", context),
          _getTimePicker("time", context),
        ],
      ),
    );
  }




  _getTextFormTextField(Icon icon , hintText, labelText){
    return TextFormField(
      autovalidate: true,

      decoration: InputDecoration(
        icon: icon,
        hintText: hintText,
        // labelText: labelText
      ),
    );
  }


  _getLabelText(String labelTitle){
    return Text(
      labelTitle,
      style: TextStyle(
        fontWeight: FontWeight.w100,
        fontSize: 16,
      ),
    );
  }

  _getTextFieldWidget(title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: TextField(
        decoration: InputDecoration(
          labelText: title,
          focusColor: AppTheme.darkerText,
        ),
      ),
    );
  }


  _getDatePicker(String title, BuildContext context) {
    var myFormat = DateFormat('d-MM-yyyy');
    return Padding(
      padding:  EdgeInsets.only(top: 0, bottom: 0),
      child: TextFormField(
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context);
        }, 
        //initialValue:  widget.exam.examDate.toString(),     //schoolUtils.getDateStringFromLongWithOutSchoolTimeZone(widget.exam.examDate),
       style: TextStyle(
          fontWeight: FontWeight.w100,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          icon: Icon(Icons.date_range),
          hintText: '${myFormat.format(_todayDate)}',
          labelText: '${myFormat.format(_todayDate)}',
          /*border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0)
            )*/
        ),
      ),
    );
  }

  _getTimePicker(String title, BuildContext context) {
    var myFormat = DateFormat('hh:mm:ss');

    return Padding(
      padding:  EdgeInsets.only(top: 0, bottom: 40),
      child: TextFormField(

        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectTime(context);
        },
        style: TextStyle(
          fontWeight: FontWeight.w100,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          icon: Icon(Icons.timer),
          hintText: "Select Time",
          labelText: '${_pickedTime.format(context)}',
          /*border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0)
            )*/
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async{
    final dateTime =  await showDatePicker(
        context: context,
        initialDate: _todayDate,
        firstDate: DateTime(2000),

        lastDate: DateTime(2100)
    );

    if(dateTime != null && dateTime != _todayDate){
      print('date Selected : ${_todayDate.toString()} ');
      setState(() {
        _todayDate = dateTime;
        widget.formKey.currentState.save();
        widget.genericModel.date = dateTime.millisecondsSinceEpoch;
      });
    }
  }

  _selectTime(BuildContext context) async{
    final TimeOfDay  time =  await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),

    );

    if(time != null && time != _pickedTime){
      print('time Selected : ${_pickedTime.toString()} ');
      setState(() {
        _pickedTime = time;
        print("_pickedTime = ${time}");
        widget.formKey.currentState.save();
        widget.genericModel.time = time.minute;
      });
    }
  }




}
