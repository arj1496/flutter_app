import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class urvesh extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Urvesh Login Page Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: UrveshHome(title: 'Flutter Demo Home Page'),
    );

  }
}

class UrveshHome extends StatefulWidget{

  final String title;

  UrveshHome({Key key, this.title}) : super(key: key);

  @override
  State<UrveshHome> createState() => _UrveshHomePageState();

}

class _UrveshHomePageState extends State<UrveshHome>{

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 15.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }

}