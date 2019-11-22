import 'package:flutter/material.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:flutter_app/src/mo/Event/EventActivity.dart';

import 'package:flutter_app/src/mo/Event/EventTypeAutoComplte.dart';
import 'package:flutter_app/src/mo/Event/ParticipantUI.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'DateWidgetForEvent.dart';
import 'Event.dart';
import 'EventType.dart';
import 'SubjectPopup.dart';

class AddEventForm extends StatefulWidget {
  @override
  _EventAddState createState() => _EventAddState();
}

class _EventAddState extends State<AddEventForm> {
  //EventPojo eventPojo = new EventPojo();
  Event event = new Event();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

 final GlobalKey<ScaffoldState> scafoldKey = new GlobalKey<ScaffoldState>( );
  bool _isInAsyncCall = false;
  bool _isAdd = false;
 final FocusNode _ageFocus = FocusNode();
 final FocusNode _heightFocus = FocusNode();
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
    return ModalProgressHUD(
      inAsyncCall: _isInAsyncCall,
      color: Colors.white,
      child: SafeArea(
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
              _getMultilineTextFormTextField(Icon(Icons.description), 'Enter Description', 'Description','description'),
              _getMultilineTextFormTextField(Icon(Icons.description), 'Enter Place', 'Place','place'),
              _getDropDownFormField(Icon(Icons.merge_type), 'Select Type', 'Select Type'),
             // _getPopup(Icon(Icons.merge_type), 'Enter Type', 'Type','Type'),
              _getDateAndTime(_formKey,event),
              _getParticipantUI(_formKey,event),
             // getParticipantChip(event.eventParticipant),
              _submitButton(),
            ],
          ),
        ),
      ),
    );
  }

  _getTextFormTextField(Icon icon , hintText, labelText,paramenter) {

    return TextFormField(
      onSaved: (val) =>
           event.name =val,
      autovalidate: true,
      textInputAction: TextInputAction.next,
      focusNode: _ageFocus,
      onFieldSubmitted: (term){
        _fieldFocusChange(context, _ageFocus, _heightFocus);
      },
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

 _fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
   currentFocus.unfocus();
   FocusScope.of(context).requestFocus(nextFocus);
 }


 _getMultilineTextFormTextField(Icon icon , hintText, labelText,paramenter) {
   return TextFormField(
     onSaved: (val) => paramenter == 'place'
         ? event.place = val : paramenter == 'description'
         ? event.description = val :  event.place = val ,
     autovalidate: true,
     maxLines: null,
    // textInputAction: TextInputAction.next,
     focusNode: _heightFocus,
     keyboardType:  TextInputType.multiline,
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
                  setState(() {
                    _isInAsyncCall = true;
                  });
                   EventActivity eventActivity = new EventActivity();
                   eventActivity.addOrUpdateEvent(event, (eventObject){
                     setState(() {
                       _isAdd = true;
                       _isInAsyncCall = false;
                     });
                     if (_isAdd) {
                       Navigator.of(context).pop();
                     }
                     if(eventObject != null){
                       final snackBar = SnackBar(content: Text('Event added sucessfully!'));
                       scafoldKey.currentState.showSnackBar(snackBar);
                     }
                    // Navigator.of(context).pop();
                   });

                  } ,
              ) ,
            ) ,
              Material ( //Wrap with Material
                shape: RoundedRectangleBorder (
                    borderRadius: new BorderRadius.circular( 0.0) ,
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
     return ParticipantUI(
         formKey: _formKey ,
         event: event,
       callback:(participantList){
           getParticipantChip(participantList);

       }
     );
   }

 // Date and time textfield
 _getDateAndTime( GlobalKey<FormState> formKey , Event event ) {
   return DateWidgetForEvent.init ( _formKey , event );
 }

 _getDropDownFormField(Icon icon, String hintText, String labelText) {
    String typeof = "select Type";
   EventActivity eventActivity = new EventActivity();
   List<EventType>  _eventTypes = eventActivity.getEventTypeList();
  // List<String> _eventTypes = <String>['','Event', 'Teacher Meeting', 'Parent Meeting', 'StudentMeeting', 'On on One Meeting'];
   EventType _eventType = new EventType();
   return FormField(
       builder: (FormFieldState state){
         return InputDecorator(
           decoration: InputDecoration(
               icon: icon,
              prefixText: typeof,
           ),
           child: DropdownButtonHideUnderline(
               child: DropdownButton(
                 isDense: true,
                 onChanged: (dynamic newValue){
                   setState(() {
                     labelText = newValue.eventType;
                     typeof = newValue.eventType;
                     event.type = labelText;
                     state.didChange(newValue);
                   });
                 },
                 items: _eventTypes.map((EventType value) {
                   return new DropdownMenuItem(
                     value: value,
                     child: new Text(value.eventType),
                   );
                 }).toList(),
               )
           ),
         );
       }
   );
 }
  _getPopup( Icon icon , hintText , labelText , paramenter ) {
    return GestureDetector(
      onTap: () {
        _showAlert(context);
      },
      child:AbsorbPointer(
        child: Padding(
          padding: const EdgeInsets.only(top:18.0),
          child: TextFormField (

            decoration: InputDecoration (
              icon: icon ,
              hintText: hintText ,
              labelText: labelText,
            ) ,
            // focusNode: _focus,

          ),

        ),
      ),
    );


  }

  EventActivity eventActivity = new EventActivity();
  List<EventType>  _eventTypes = new List();

  getEvents(){
    _eventTypes = eventActivity.getEventTypeList();
  }
  _showAlert(  callback) {
    getEvents();
    return showDialog (
        context: context ,
        builder: ( context ) {
          return AlertDialog (
              title: new Text( "Particpant" ) ,
              content:  Container(
                child: Column (
                  mainAxisSize: MainAxisSize.min ,
                  children: <Widget>[
                    ListView.builder (
                      //physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true ,
                        itemCount: _eventTypes.length ,
                        itemBuilder: ( context , i ) {
                          return  ListTile(
                            title: new Text(
                              _eventTypes[i].eventType,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          );
                        } ),
                  ] ,
                ),
              ),



              actions: <Widget>[
                MaterialButton (
                    child: Text ( "DONE" ) ,
                    onPressed: ( ) {
                    //  callback (selectedSchoolParticipant );
                      Navigator.pop ( context );
                    } ) ,
              ]
          );
        }
    );
  }

  getParticipantChip(participantList) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: participantList.length,
        itemBuilder: (BuildContext context, int index) {


          return new Column(
            children: <Widget>[
              new   ChoiceChip(
                  label: Text("Class-1"),
                  selected: false,
                  /*onSelected: (selected) {
                setState(() {
                  isSelected = selected;
                });
              },*/
                  avatar: Icon(
                    Icons.cancel,
                    color: Colors.red,
                  )
              ),
            ],
          );
        });
  }
}

