import 'package:flutter/cupertino.dart';

/**
 * label for title of cutom widget  like Description,place
 * icondata for fontawesome icon
 * data is place or details of event,exam etc.
 */
class PropertyFile{

  String _label;
  IconData _iconData;
  String _data;
  String _eventName;
  String _eventType;
  String _eventCreated;
  String _startDate;
  String _startTime;
  String _endDate;
  String _endTime;
  String _durication;

   String get label => _label;
   set label( String value ) {
    _label = value;
  }
  String get eventName => _eventName;
  set eventName( String value ) {
    _eventName = value;
  }
  String get eventType => _eventType;
  set eventType( String value ) {
    _eventType = value;
  }
  String get eventCreated => _eventCreated;
  set eventCreated( String value ) {
    _eventCreated = value;
  }

  PropertyFile();

  IconData get iconData => _iconData;

  set iconData( IconData value ) {
    _iconData = value;
  }

  String get data => _data;

  set data( String value ) {
    _data = value;
  }

  String get startDate => _startDate;
  set startDate( String value ) {
    _startDate = value;
  }

  String get startTime => _startTime;
  set startTime( String value ) {
    _startTime = value;
  }

  String get endDate => _endDate;
  set endDate( String value ) {
    _endDate = value;
  }

  String get endTime => _endTime;
  set endTime( String value ) {
    _endTime = value;
  }

  String get durication => _durication;

  set durication( String value ) {
    _durication = value;
  }

}