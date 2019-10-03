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
   String get label => _label;

   set label( String value ) {
    _label = value;
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

}