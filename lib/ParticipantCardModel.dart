import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/EventDetails.dart';
import 'package:flutter_app/src/mo/Participant/Participant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ParticipantCardModel extends StatefulWidget {
  List<Widget> customWidget = new List();
  String title = null;
  List<Participant> participant = new List();
  @override
  State<StatefulWidget> createState() {
    return ParticipantModelState();
  }

  ParticipantCardModel(this.participant);
}

class ParticipantModelState extends State<ParticipantCardModel> {
  var label = 'Participant: ';
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueAccent,
      child: new Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                icon: new Icon(FontAwesomeIcons.users),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: new Text(
                  label,
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
          getParticipantChip(widget.participant),
        ],
      ),
    );
  }
}

getParticipantUI(participantList) {
  return ListView.builder(
      shrinkWrap: true,
      itemCount: participantList.length,
      itemBuilder: (BuildContext context, int index) {


        return new Column(
          children: <Widget>[
            new Text(
              "class-1",
              style: new TextStyle(
                fontSize: 20.0,
                fontFamily: 'Roboto',
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        );
      });
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

/*getValues(){
  Map _values = new Map();
  _values["value1"]="Class-1";
  _values["value2"]="Class-2";
  _values["value3"]="Class-3";
  _values["value4"]="Class-4";


  return _values;
}*/

// replace this function with the code in the examples
Widget _myListView(BuildContext context) {
  return ListView();
}
