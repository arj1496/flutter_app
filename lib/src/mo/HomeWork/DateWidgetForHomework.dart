import 'package:flutter/material.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_app/src/fr/SchoolUtils.dart';

import 'package:flutter_app/src/mo/Exam/Exam.dart';
import 'package:flutter_app/src/mo/HomeWork/HomeWork.dart';
import 'package:intl/intl.dart';

class DateWidgetForHomework extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return HWAddUIState.init();
  }
  GlobalKey<FormState> formKey;
 HomeWork homeWork = new HomeWork();

  DateWidgetForHomework.init(formKey, _eventPojo) {
    this.formKey = formKey;
    this.homeWork = _eventPojo;
  }
}

class HWAddUIState extends State<DateWidgetForHomework>{

  DateTime _startDate = new DateTime.now();
  DateTime _endDate = new DateTime.now();
  TimeOfDay  _pickedTime = TimeOfDay.now();
  TextEditingController labelText = new TextEditingController();
  SchoolUtils schoolUtils = new SchoolUtils();

  @override
  void initState() {
     if(widget.homeWork!= null && widget.homeWork.startDate != null && widget.homeWork.endDate !=null){
      _startDate = new DateTime.fromMicrosecondsSinceEpoch(widget.homeWork.startDate );
      _endDate = new DateTime.fromMicrosecondsSinceEpoch(widget.homeWork.endDate );
      widget.homeWork.startDate = widget.homeWork.startDate ;
      widget.homeWork.endDate = widget.homeWork.endDate ;
    }
  }
  HWAddUIState.init(){}

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      top: false,
      bottom: false,
      child: Form(
          autovalidate: true,
        child: Column(
            children: <Widget>[
              Row(
              children: <Widget>[
                Expanded(
                    child:  _getDatePicker("date", context),
                ),
                Container(
                  width: 20,
                ),
                Expanded(
                    child:  _getTimePicker("time", context),
                ),
              ],
            ),
              Row(
                children: <Widget>[
                  Expanded(
                    child:  _getEndDatePicker("date", context),
                  ),
                  Container(
                    width: 20,
                  ),
                  Expanded(
                    child:  _getTimePicker("time", context),
                  ),
                ],
              ),
           ],
          ),
          ),
    );

  }



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
          hintText: '${myFormat.format(_startDate)}',
          labelText: '${myFormat.format(_startDate)}',
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
      padding:  EdgeInsets.only(top: 0, bottom: 0),
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

  _getEndDatePicker(String title, BuildContext context) {
    var myFormat = DateFormat('d-MM-yyyy');
    return Padding(
      padding:  EdgeInsets.only(top: 0, bottom: 0),
      child: TextFormField(
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectEndDate(context);
        },
        //initialValue:  widget.exam.examDate.toString(),     //schoolUtils.getDateStringFromLongWithOutSchoolTimeZone(widget.exam.examDate),
        style: TextStyle(
          fontWeight: FontWeight.w100,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          icon: Icon(Icons.date_range),
          hintText: '${myFormat.format(_endDate)}',
          labelText: '${myFormat.format(_endDate)}',
          /*border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0)
            )*/
        ),
      ),
    );
  }

  _selectEndDate(BuildContext context) async{
    final dateTime =  await showDatePicker(
        context: context,
        initialDate: _endDate,
        firstDate: DateTime(2000),

        lastDate: DateTime(2100)
    );

    if(dateTime != null && dateTime != _endDate){
      print('date Selected : ${_endDate.toString()} ');
      setState(() {
        _endDate = dateTime;
        widget.formKey.currentState.save();
        widget.homeWork.endDate = dateTime.millisecondsSinceEpoch;
      });
    }
  }

  _selectDate(BuildContext context) async{
    final dateTime =  await showDatePicker(
        context: context,
        initialDate: _startDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100)
    );

    if(dateTime != null && dateTime != _startDate){
      print('date Selected : ${_startDate.toString()} ');
      setState(() {
        _startDate = dateTime;
        widget.formKey.currentState.save();
        widget.homeWork.startDate = dateTime.millisecondsSinceEpoch;
        _endDate = _startDate.add(Duration(days: 1));
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
        widget.homeWork.duration = time.minute;
      });
    }
  }

  _selectEndTime(BuildContext context) async{
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
        widget.homeWork.duration = time.minute;
      });
    }
  }




}
