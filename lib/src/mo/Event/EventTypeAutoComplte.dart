import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:flutter_app/src/mo/Event/EventActivity.dart';
import 'package:flutter_app/src/mo/Event/EventPojo.dart';
import 'package:flutter_app/src/mo/Event/EventType.dart';

class EventTypeAutoComplte extends StatefulWidget {
  @override
  _EventTypeAutoComplteState createState() => _EventTypeAutoComplteState();
  GlobalKey<FormState> formKey;
  GenericModel genericModel;
  EventTypeAutoComplte.init(formKey, _eventPojo) {
    this.formKey = formKey;
    this.genericModel = _eventPojo;
  }

  EventTypeAutoComplte(this.formKey, this.genericModel);
}

class _EventTypeAutoComplteState extends State<EventTypeAutoComplte> {
  AutoCompleteTextField searchTextField;
  GlobalKey<AutoCompleteTextFieldState<EventType>> key = new GlobalKey();
  static List<EventType> eventTypeList = new List<EventType>();

  bool loading = true;

  @override
  void initState() {
    EventActivity eventActivity = new EventActivity();
    eventTypeList = eventActivity.getEventTypeList();
    loading = false;
    super.initState();
  }

 Widget row(EventType eventType) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          eventType.eventType,
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(
          width: 10.0,
        ),
        /*Text(
          eventType.eventType,
        ),*/
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return _getDropDownFormField();

  }

  Widget _getDropDownFormField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        loading
            ? CircularProgressIndicator()
            : searchTextField = AutoCompleteTextField<EventType>(
          key: key,
          clearOnSubmit: false,
          suggestions: eventTypeList,
          style: TextStyle(color: Colors.black, fontSize: 16.0),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
            hintText: "Search Event Type ",
            hintStyle: TextStyle(color: Colors.black),
          ),
          itemFilter: (item, query) {
            return item.eventType
                .toLowerCase()
                .startsWith(query.toLowerCase());
          },
          itemSorter: (a, b) {
            return a.eventType.compareTo(b.eventType);
          },
          itemSubmitted: (item) {
            setState(() {
              searchTextField.textField.controller.text = item.eventType;
              widget.formKey.currentState.save();
              widget.genericModel.eventType = item.eventType;
            });
          },
          itemBuilder: (context, item) {
            // ui for the autocompelete row
            return row(item);
          },
        ),
      ],
    );
  }

  
}
