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
  String _placeLabel;
  IconData _placeIconData;
  String _palceData;
  String _descriptionLabel;
  IconData _descriptionIconData;
  String _descriptionData;

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

  String get placeLabel => _placeLabel;
  set placeLabel( String value ) {
    _placeLabel = value;
  }

  IconData get placeIconData => _placeIconData;
  set placeIconData( IconData value ) {
    _placeIconData = value;
  }

  String get palceData => _palceData;
  set palceData( String value ) {
    _palceData = value;
  }

  String get descriptionLabel => _descriptionLabel;
  set descriptionLabel( String value ) {
    _descriptionLabel = value;
  }

  IconData get descriptionIconData => _descriptionIconData;
  set descriptionIconData( IconData value ) {
    _descriptionIconData = value;
  }

  String get descriptionData => _descriptionData;
  set descriptionData( String value ) {
    _descriptionData = value;
  }
}