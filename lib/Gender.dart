import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Gender extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _genderState();
  }

  GlobalKey<FormState> formKey;
  GenericModel genericModel = new GenericModel();

  Gender.init(formKey, _eventPojo) {
    this.formKey = formKey;
    this.genericModel = _eventPojo;
  }

  Gender(this.formKey, this.genericModel);
}

class _genderState extends State<Gender> {
  int _selected = 0;

  void storeValue(value, state) {
    setState(() {
      _selected = value;
      state.didChange(value);
      widget.genericModel.gender = value.id;
    });
    print('value = $value');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
          children: gender()
      ),
    );
  }

  List<Widget> gender() {
    List<Widget> list = new List<Widget>();

    var gendervalue = getGenderWidget();
    list.add(gendervalue);


    return list;

}

  Widget getGenderWidget() {
   return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Icon(
            FontAwesomeIcons.transgender,
            color: Colors.grey,
          ),
          SizedBox(
            width: 20,
          ),
          Text("Male"),
          FormField(builder: (FormFieldState state) {
            return Radio(
                value: 1,
                groupValue: _selected,
                onChanged: (int value) {
                  storeValue(value, state);
                });
          }),
          Text("Female"),
          FormField(
            builder: (FormFieldState state) {
              Radio(
                  value: 2,
                  groupValue: _selected,
                  onChanged: (int value) {
                    storeValue(value, state);
                  });
            },
          )
        ],
      ),
    );
  }
}
