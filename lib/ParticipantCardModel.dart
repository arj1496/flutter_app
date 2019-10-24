import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/EventDetails.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ParticipantCardModel extends StatelessWidget {
  var label = 'Participant: ';
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.blueAccent,
      child: new Column (
          children: <Widget>[

      Row(
      children:<Widget>[IconButton(
      icon: new Icon(FontAwesomeIcons.users),

    ),
    Padding(
    padding: const EdgeInsets.only(left:8.0),
    child: new Text (label,

    style: new TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
    decorationStyle: TextDecorationStyle.solid,
    fontFamily: 'Roboto',
    color: Colors.white,

    ),
    ),
    ),

    ],
    ),

   DetailList(),

    ],
    ),
    );
  }
}

class DetailList extends StatelessWidget {
  Map _values = getValues();

  @override
  Widget build(BuildContext context) {
    return
      ListView.builder(
          shrinkWrap: true,
          itemCount: _values.length,
          itemBuilder: (BuildContext context, int index){
            String key = _values.keys.elementAt(index);

            return new Column(
            children: <Widget>[
            new Text(_values[key],
            style: new TextStyle(
            fontSize: 20.0,
            fontFamily: 'Roboto',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            ),
            )
            ],
            );
          }
          );

  }
}
getValues(){
  Map _values = new Map();
  _values["value1"]="Class-1";
  _values["value2"]="Class-2";
  _values["value3"]="Class-3";
  _values["value4"]="Class-4";


  return _values;
}

// replace this function with the code in the examples
Widget _myListView(BuildContext context) {
  return ListView();
}




