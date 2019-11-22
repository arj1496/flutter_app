import 'package:flutter/material.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_app/src/mo/Event/EventActivity.dart';
import 'package:flutter_app/src/mo/Event/EventTypeAutoComplte.dart';
import 'package:flutter_app/src/mo/Event/ParticipantUI.dart';
import 'DateWidgetForEvent.dart';
import 'Event.dart';

class EventEdit extends StatefulWidget {

  Event event = new Event();
  @override
  _EventAddState createState() => _EventAddState();
  EventEdit(event){
    this.event = event;
  }
}

class _EventAddState extends State<EventEdit> {

//  Event event = new Event();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
   EventActivity eventActivity = new EventActivity();
  final GlobalKey<ScaffoldState> scafoldKey = new GlobalKey<ScaffoldState>( );

  _EventAddState(){
   // this.event = event;
  }

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
          title: Text("Edit Event form"),
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
          children: getWidgetList(),
          ),
      ),
    );
  }

  getWidgetList( ) {
    List<Widget> widgetList = new List();

    Widget widgetLocal;
    widgetLocal =  _getTextFormTextField(Icon(Icons.event), 'Enter Event Title', 'Title',widget.event.name);
    widgetList.add(widgetLocal);


    if(widget.event.type != null){
      widgetLocal= _getTextFormTextField(Icon(Icons.event), 'Enter Event type', 'Type',widget.event.type);
          widgetList.add(widgetLocal);

    } else{
      widgetLocal= _getTextFormTextField(Icon(Icons.merge_type), 'Enter Event type', 'Type',null);
      widgetList.add((widgetLocal));
    }


    if(widget.event.description != null) {
      widgetLocal =  _getTextFormTextField(Icon(Icons.description), 'Enter Description', 'Description',widget.event.description);
      widgetList.add(widgetLocal);
    }else{
      widgetLocal = _getTextFormTextField(Icon(Icons.description), 'Enter Description', 'Description',null);
      widgetList.add(widgetLocal);
    }

    if(widget.event.description != null) {
      widgetLocal =_getTextFormTextField(Icon(Icons.place), 'Enter place', 'place',widget.event.place);
      widgetList.add(widgetLocal);
    }else{
      widgetLocal =_getTextFormTextField(Icon(Icons.place), 'Enter Place', 'Place',null);
      widgetList.add(widgetLocal);
    }

    if(widget.event.startDate != null && widget.event.endDate != null) {
      widgetLocal =  _getDateAndTime ( _formKey , widget.event );
      widgetList.add(widgetLocal);
    }else{
      widgetLocal =  _getDateAndTime ( _formKey , widget.event );
      widgetList.add(widgetLocal);
    }

   // if(event.eventParticipant != null){
  /*  widgetLocal =  _getParticipantUI ( _formKey,widget.event);
    widgetList.add(widgetLocal);*/
   // }
    //  _getEndDateAndTime ( _formKey , homework ) ,
    widgetLocal =   _submitButton();
    widgetList.add(widgetLocal);
    return widgetList;
  }

  _getTextFormTextField(Icon icon , hintText, labelText,paramenter) {
    return TextFormField(
      onSaved: (val) => paramenter == 'title'
          ? widget.event.name = val : paramenter == 'description'
          ? widget.event.description = val :  widget.event.place = val ,
      autovalidate: true,
      initialValue: paramenter,
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
              child: new Text( "UPDATE" ,
                  style: new TextStyle(
                      fontSize: 12.0 , color: AppTheme.nearlyBlue ) ) ,
              onPressed: ( ) async {
                if(_formKey.currentState.validate()){
                  _formKey.currentState.save();
                }
                EventActivity eventActivity = new EventActivity();
                //widget.event.description ="test";
               /* Future<int> eventObject = eventActivity.addOrUpdateEvent(widget.event);
                if(eventObject != null){
                  final snackBar = SnackBar(content: Text('Event added sucessfully!'));
                  scafoldKey.currentState.showSnackBar(snackBar);
                }*/
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

 /* _getParticipantUI(_formKey,event) {
    return ParticipantUI(_formKey,event);
  }*/

  // Date and time textfield
  _getDateAndTime( GlobalKey<FormState> formKey , Event event ) {
    return DateWidgetForEvent.init ( _formKey , event );
  }
}

