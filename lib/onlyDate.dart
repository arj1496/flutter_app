import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  Icon icon;
  String label;
  GenericModel genericModel=new GenericModel();
  GlobalKey<FormState> formKey;
  @override
  State<StatefulWidget> createState() {
    return BirthdateAdd();
  }
  DatePicker(Icon icon,String label, {Label}){
    this.icon=icon;
    this.label=label;
  }
}
class BirthdateAdd extends State<DatePicker> {
  GenericModel genericModel=new GenericModel();
  DateTime _todayDate = new DateTime.now();
  TextEditingController labelText = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      top: false,
      bottom: false,
      child: Form(
          autovalidate: true,
          child: Column(
            children: <Widget>[
              _getDatePicker("date", context),
            ],
          )
      ),
    );
  }


  _getTextFormTextField(Icon icon, hintText, labelText) {
    return TextFormField(
      autovalidate: true,
      decoration: InputDecoration(
        icon: icon,
        hintText: hintText,
        // labelText: labelText
      ),
    );
  }


  _getLabelText(String labelTitle) {
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
    var myFormat = DateFormat('dd-MM-yyyy');
    return Padding(
      padding: EdgeInsets.only(top: 0, bottom: 0),

      child: TextFormField(
        //onSaved: (val) =>  genericModel.birthDate = val ,
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context);
        },
        style: TextStyle(
          fontWeight: FontWeight.w100,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          icon: widget.icon,
          hintText: "Select Date",
          labelText: '${myFormat.format(_todayDate)}'
        ),
      ),
    );
  }


  _selectDate(BuildContext context) async {
    final dateTime = await showDatePicker(
        context: context,
        initialDate: _todayDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2099)
    );
    if (dateTime != null && dateTime != _todayDate) {
      print('date Selected : ${_todayDate.toString()} ');
      setState(() {
        _todayDate = dateTime;
       // widget.formKey.currentState.save();
        widget.genericModel.birthDate = dateTime.millisecondsSinceEpoch.toString();
      });
    }
  }

}




/*
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatelessWidget {
  const DatePicker(
      {Key key,
        this.labelText,
        this.selectedDate,
        this.selectedTime,
        this.selectDate,
       // this.selectTime
  })
      : super(key: key);

  final String labelText;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  final ValueChanged<DateTime> selectDate;
 // final ValueChanged<TimeOfDay> selectTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: new DateTime(1970, 8),
        lastDate: new DateTime(2101));
    if (picked != null && picked != selectedDate) selectDate(picked);
  }

*/
/*  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked =
    await showTimePicker(context: context, initialTime: selectedTime);
    if (picked != null && picked != selectedTime) selectTime(picked);
  }*//*


  @override
  Widget build(BuildContext context) {
    final TextStyle valueStyle = Theme.of(context).textTheme.body1;
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        new Expanded(
          flex: 4,
          child: new _InputDropdown(
            labelText: labelText,
            valueText: new DateFormat.yMMMd().format(selectedDate),
            valueStyle: valueStyle,
            onPressed: () {
              _selectDate(context);
            },
          ),
        ),
        */
/*const SizedBox(width: 12.0),
        new Expanded(
          flex: 3,
          child: new _InputDropdown(
            valueText: selectedTime.format(context),
            valueStyle: valueStyle,
            onPressed: () {
              _selectTime(context);
            },
          ),
        ),*//*

      ],
    );
  }
}

class _InputDropdown extends StatelessWidget {
  const _InputDropdown(
      {Key key,
        this.child,
        this.labelText,
        this.valueText,
        this.valueStyle,
        this.onPressed})
      : super(key: key);

  final String labelText;
  final String valueText;
  final TextStyle valueStyle;
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: onPressed,
      child: new InputDecorator(
        decoration: new InputDecoration(
          labelText: labelText,
        ),
        baseStyle: valueStyle,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Text(valueText, style: valueStyle),
            new Icon(Icons.arrow_drop_down,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey.shade700
                    : Colors.white70),
          ],
        ),
      ),
    );
  }
}*/
