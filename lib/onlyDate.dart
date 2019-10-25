import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  Icon icon;
  String label;
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
              // This method is Accepts 2 parameter
              // 0 : Icon, 1 : hintText , 2 : Label Text
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
      child: TextField(
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
        lastDate: DateTime(2100)
    );
    if (dateTime != null && dateTime != _todayDate) {
      print('date Selected : ${_todayDate.toString()} ');
      setState(() {
        _todayDate = dateTime;
      });
    }
  }

}