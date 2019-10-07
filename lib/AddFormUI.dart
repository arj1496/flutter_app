import 'package:flutter/material.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:intl/intl.dart';

class AddFormUI extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return AddFormUIState();
  }

}

class AddFormUIState extends State<AddFormUI>{

  DateTime _todayDate = new DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        backgroundColor: AppTheme.background,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppTheme.background,
          title: Text("Add form"),
        ),
        //body: _getContainerBody(),
        body: _getSafeAreaBody(),
      ),
    );
  }

  _getSafeAreaBody() {
    return SafeArea(
      top: false,
      bottom: false,
      child: Form(
        autovalidate: true,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: <Widget>[
              // This method is Accepts 2 parameter
              // 0 : Icon, 1 : hintText , 2 : Label Text
              _getTextFormTextField(Icon(Icons.event), 'Enter Event Title', 'Title'),
              _getTextFormTextField(Icon(Icons.event_seat), 'Enter Event Type', 'Type'),
              _getTextFormTextField(Icon(Icons.description), 'Enter Description', 'Description'),
              _getTextFormTextField(Icon(Icons.place), 'Enter Place', 'Place'),
              _getDropDownFormField(Icon(Icons.event_seat), '', 'Color'),
            ],
          )
      ),
    );
  }

  _getDropDownFormField(Icon icon, String hintText, String labelText) {
    List<String> _eventTypes = <String>['','Event', 'Teacher Meeting', 'Parent Meeting', 'StudentMeeting', 'On on One Meeting'];
    String _color = '';
    return FormField(
        builder: (FormFieldState state){
          return InputDecorator(
            decoration: InputDecoration(
              icon: icon,
              labelText: labelText
            ),
            child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  isDense: true,
                  onChanged: (String newValue){
                    setState(() {
                      _color = newValue;
                      state.didChange(newValue);
                    });
                  },
                  items: _eventTypes.map((String value) {
                    return new DropdownMenuItem(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                )
            ),
          );
        }
    );
  }

  _getTextFormTextField(Icon icon , hintText, labelText){
    return TextFormField(
      autovalidate: true,
      decoration: InputDecoration(
          icon: icon,
          hintText: hintText,
          labelText: labelText
      ),
    );
  }

  _getContainerBody(){
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // _getLabelText('Event Title'),
          _getTextFieldWidget('Event Title'),
          _getTextFieldWidget('Event Type'),
          _getDatePicker('Start Date', context),
        ],
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: TextField(
        onTap: (){
          _selectDate(context);
        },
        style: TextStyle(
          fontWeight: FontWeight.w100,
          fontSize: 16,
        ),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            hintText: "Select Date",
            labelText: '${_todayDate.toString()}',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0)
            )
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




}
