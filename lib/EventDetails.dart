import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EventDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: "Event Details",
     theme: ThemeData(
       primarySwatch: Colors.lightGreen
     ),
      home: EventDetailsStructure(title:'Event Details'),

    );

  }
}

class EventDetailsStructure extends StatefulWidget {
  String title;
  EventDetailsStructure({Key key, this.title}) : super(key: key);
  @override
  _EventDetailsStructureState createState() => _EventDetailsStructureState();
}

class _EventDetailsStructureState extends State<EventDetailsStructure> {
  @override
  Widget build(BuildContext context) {
    final description = Container(
      color: Colors.white,
      child: FlatButton(

      ),
    );
  }
}
