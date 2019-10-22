import 'package:flutter/material.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:flutter_app/src/mo/Event/EventActivity.dart';

import 'package:flutter_app/src/mo/Event/EventTypeAutoComplte.dart';

import 'Event.dart';

class EventAdd extends StatefulWidget {
  @override
  _EventAddState createState() => _EventAddState();
}

class _EventAddState extends State<EventAdd> {
  //EventPojo eventPojo = new EventPojo();
  GenericModel genericModel = new GenericModel();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  static EventActivity eventActivity = new EventActivity();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        backgroundColor: AppTheme.background,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppTheme.background,
          title: Text("Add Evnet form"),
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
      maintainBottomViewPadding: true,
      child: Form(
        key: _formKey,
        autovalidate: true,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: <Widget>[
            //Title
            _getTextFormTextField(Icon(Icons.event), 'Enter Event Title', 'Title','title'),
            //Description
            _getTextFormTextField(Icon(Icons.description), 'Enter Description', 'Description','description'),
            //Place
            _getTextFormTextField(Icon(Icons.place), 'Enter Place', 'Place','place'),
            //Event Type
            _getEventTypeAutoCompte(_formKey,genericModel),

            _submitButton(),
          ],
        ),
      ),
    );
  }

  _getTextFormTextField(Icon icon , hintText, labelText,paramenter) {
    return TextFormField(
      onSaved: (val) => paramenter == 'title'
          ? genericModel.title = val : paramenter == 'description'
          ? genericModel.description = val :  genericModel.place = val ,
      autovalidate: true,
      decoration: InputDecoration(
          icon: icon,
          hintText: hintText,
          labelText: labelText
      ),
      validator: (String value){
        if(paramenter == 'title'){
          if(value.isEmpty){
            return 'Please Enter ${paramenter}';
          }
        }else if(paramenter == 'description'){
          if(value.length < 3 ){
            return 'Please Enter 3 charater in ${paramenter}';
          }
        }else if(paramenter == 'place'){
          if(value.length < 5){
            return 'Please Enter 5 charater in  ${paramenter}';
          }
        }
        return null;
      },
    );
  }

  _submitButton() {
    return MaterialButton(
      minWidth: 200.0,
      height: 35,

      child: new Text("Add Event",
          style: new TextStyle(fontSize: 12.0, color: AppTheme.nearlyBlue)),
      onPressed: (){
       // Event eventObject = eventActivity.addEventToServer(event);
        if(_formKey.currentState.validate()){
          _formKey.currentState.save();
        }

        print("Titile : ${genericModel.title}");
        print("Description : ${genericModel.description}");
        print("Place : ${genericModel.place}");
        print("Event Type : ${genericModel.eventType}");

      },
    );
  }

  _getEventTypeAutoCompte(GlobalKey<FormState> formKey, GenericModel genericModel) {
    return EventTypeAutoComplte(_formKey,genericModel);
  }
}

