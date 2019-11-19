import 'package:flutter/material.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:flutter_app/src/mo/Event/EventActivity.dart';

import 'package:flutter_app/src/mo/Event/EventTypeAutoComplte.dart';
import 'package:flutter_app/src/mo/Event/ParticipantUI.dart';

import 'DateWidgetForEvent.dart';
import 'Event.dart';

class AddEventForm extends StatefulWidget {
  @override
  _EventAddState createState() => _EventAddState();
}

class _EventAddState extends State<AddEventForm> {
  //EventPojo eventPojo = new EventPojo();
 Event event = new Event();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  static EventActivity eventActivity = new EventActivity();
 final GlobalKey<ScaffoldState> scafoldKey = new GlobalKey<ScaffoldState>( );
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        key: scafoldKey,
        backgroundColor: AppTheme.background,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppTheme.background,
          title: Text("Add Event form"),
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
            _getEventTypeAutoCompte(_formKey,event),
            _getDateAndTime(_formKey, event),
            _getParticipantUI(_formKey,event),
            _submitButton(),
          ],
        ),
      ),
    );
  }

  _getTextFormTextField(Icon icon , hintText, labelText,paramenter) {
    return TextFormField(
      onSaved: (val) => paramenter == 'title'
          ? event.name = val : paramenter == 'description'
          ? event.description = val :  event.place = val ,
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
    return Padding (
      padding: EdgeInsets.only ( bottom: 0 , top: 30 ) ,
        child:Container(
          child:Row (
            children: <Widget>[Material ( //Wrap with Material
              shape: RoundedRectangleBorder (
                  borderRadius: new BorderRadius.circular( 0.0 ) ,
                  side: BorderSide ( color: AppTheme.nearlyBlue )
              ) ,
              //elevation: 16.0,
              clipBehavior: Clip.antiAlias , // Add This
              child: MaterialButton (
                minWidth: 160.0 ,
                height: 35 ,
                child: new Text( "ADD" ,
                    style: new TextStyle(
                        fontSize: 12.0 , color: AppTheme.nearlyBlue ) ) ,
                onPressed: ( ) async {
                   EventActivity eventActivity = new EventActivity();
                   Future<int> eventObject = eventActivity.addOrUpdateEvent(event);
                   if(eventObject != null){
                     final snackBar = SnackBar(content: Text('Event added sucessfully!'));
                     scafoldKey.currentState.showSnackBar(snackBar);
                   }
                  } ,
              ) ,
            ) ,
              Material ( //Wrap with Material
                shape: RoundedRectangleBorder (
                    borderRadius: new BorderRadius.circular( 0.0 ) ,
                    side: BorderSide ( color: AppTheme.nearlyBlue )
                ) ,
                //elevation: 16.0,
                clipBehavior: Clip.antiAlias , // Add This
                child: MaterialButton (
                  minWidth: 160.0 ,
                  height: 35 ,
                  child: new Text( "CANCEL" ,
                      style: new TextStyle(
                          fontSize: 12.0 , color: AppTheme.nearlyBlue ) ) ,
                   onPressed: ( ) async {
                    Navigator.pop(context);
                  } ,
                ) ,
              ) ,

            ] ,
          ) ,
        ),);
  }

  _getEventTypeAutoCompte(GlobalKey<FormState> formKey, Event event) {
    return EventTypeAutoComplte(_formKey,event);
  }

  _getParticipantUI(_formKey,event) {
     return ParticipantUI(_formKey,event);
   }

 // Date and time textfield
 _getDateAndTime( GlobalKey<FormState> formKey , Event event ) {
   return DateWidgetForEvent.init ( _formKey , event );
 }
}

