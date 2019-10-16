import 'package:flutter/material.dart';



class MultipleDropDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _selectedRegion;
  String _selectedSecond;

  @override
  Widget build( BuildContext context ) {
    return Scaffold (
      appBar: AppBar (
        title: Text ( widget.title ) ,
      ) ,
      body: Center (
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center ,
          children: <Widget>[
            Text ( 'Something before' ) ,
            DropdownButton<String> (
              value: _selectedRegion ,
              items: ['Arizona' , 'California']
                  .map ( ( region ) =>
                  DropdownMenuItem<String> (
                      child: Text ( region ) , value: region ) )
                  .toList ( ) ,
              onChanged: ( newValue ) {
                setState ( ( ) {
                  _selectedRegion = newValue;
                } );
              } ,
            ) ,
            _addSecondDropdown ( ) ,
            Text ( 'Something after' ) ,
          ] ,
        ) ,
      ) ,
    );
  }

  Widget _addSecondDropdown( ) {
    return _selectedRegion != null
        ? DropdownButton<String> (
        value: _selectedSecond ,
        items: ['First' , 'Second']
            .map ( ( region ) =>
            DropdownMenuItem<String> (
                child: Text ( region ) , value: region ) )
            .toList ( ) ,
        onChanged: ( newValue ) {
          setState ( ( ) {
            _selectedSecond = newValue;
          } );
        } )
        : Container ( ); // Return an empty Container instead.
  }
}