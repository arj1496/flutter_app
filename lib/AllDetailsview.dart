import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/EventDetails.dart';

class AllDetailsview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color:Colors.black12,
      margin: const EdgeInsets.only(bottom:15.0),
      padding: const EdgeInsets.all(3.0),

      child: DetailList(),
    );
  }
}

class DetailList extends StatelessWidget {
  Map _values = getValues();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _values.length,
          itemBuilder: (BuildContext context, int index){
            String key = _values.keys.elementAt(index);
        return new Row(
          children: <Widget>[
            new Text('${key} : ',
              textAlign: TextAlign.right,
              style: new TextStyle(
                fontSize: 20.0,
                fontFamily: 'Roboto',
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),) ,
            new Text(_values[key])
          ],
        );
  }
      ),
    );

}
}
getValues(){
  Map _values = new Map();
  _values["Name"]="Test Grade 1";
  _values["class"]="Class-1";
  _values["subject"]="Marathi";
  _values["created by"]="A T";
  _values["type"]="Unit test";
  _values["date"]="18/9/2019";
  _values["status"]="Draft";

  return _values;
}

// replace this function with the code in the examples
Widget _myListView(BuildContext context) {
  return ListView();
}




