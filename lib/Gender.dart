import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Gender extends StatefulWidget {
  @override
  _genderState createState() => _genderState();
}

class _genderState extends State<Gender> {
int _selected =0;

void onChanged(int value){
  setState(() {
    _selected = value;
  });
  print('value = $value');
}

  List<Widget> gender() {
    List < Widget> list = new List<Widget>();

      list.add(
          Row(
              children: <Widget>[
                Text("Male"),
                Radio(value: 1,groupValue: _selected,onChanged:(int value){onChanged(value);}),
               Text("Female"),
                Radio(value: 2,groupValue: _selected,onChanged:(int value){onChanged(value);})
              ]
          ));
    return list;
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
        children: gender()
    );
  }
}