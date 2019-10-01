/**
 * label for title of cutom widget  like Description,place
 * icondata for fontawesome icon
 * data is place or details of event,exam etc.
 */
class PropertyFile{

  var _label;

  get label => _label;

  set label( value ) {
    _label = value;
  }

  get iconData => _iconData;

  set iconData( value ) {
    _iconData = value;
  }

  var _iconData;
  var _data;

  get data => _data;

  set data( value ) {
    _data = value;
  }
}