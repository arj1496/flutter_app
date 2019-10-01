import 'package:flutter/cupertino.dart';

/**
 * label for title of cutom widget  like Description,place
 * icondata for fontawesome icon
 * data is place or details of event,exam etc.
 */
class PropertyFile{

  String _label;
  Icon _iconData;
  String _data;
  get label => _label;

  set label( value ) {
    _label = value;
  }

  get iconData => _iconData;

  set iconData( value ) {
    _iconData = value;
  }



  get data => _data;

  set data( value ) {
    _data = value;
  }
}