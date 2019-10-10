import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:intl/intl.dart';

class DatePickerDemo extends StatefulWidget {
  List<String> _standard = <String>['Class-1', 'Class-2', 'Class-3', 'Class-4', 'Class-5','Class-6', 'Class-7', 'Class-8', 'Class-9', 'Class-10'];
  List<String> _subject = <String>['Marathi', 'Hindi', 'English', 'Science', 'Maths','History','geography','Geometry','Civics','Marathi', 'Hindi', 'English', 'Science', 'Maths','History'];
  List<String> _type = <String>['Unit Test 1', 'FA Exam', 'Term Exam', 'Class Test', 'Terminal(A)','test-1','test-2','test-3','test-4',];
  @override
  State<StatefulWidget> createState() {
    return ExamAddUIState.init(_standard,_subject,_type);
  }

}

class ExamAddUIState extends State<DatePickerDemo>{

  DateTime _todayDate = new DateTime.now();
  TimeOfDay  _pickedTime = TimeOfDay.now();
  List<String> _standard;
  List<String> _subject;
  List<String> _type;
  TextEditingController labelText = new TextEditingController();
  String classOf = "Select Classes";
  String subjectOf = "Select Subject";
  String typeOf = "Select Type";
  String valuesOf = "Select Type";
  ExamAddUIState.init(List<String> _standard,List<String> _subject,List<String> _type){
    this._standard= _standard;
    this._subject= _subject;
    this._type = _type;
  }
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
      child: TextField(
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context);
        },
        style: TextStyle(
          fontWeight: FontWeight.w100,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          icon: Icon(Icons.date_range),
          hintText: "Select Date",
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
      child: TextField(
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
      });
    }
  }




}
