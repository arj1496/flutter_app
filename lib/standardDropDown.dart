import 'package:flutter/material.dart';

class StandardDropDown extends StatefulWidget {
  List<String> _standard = <String>[
    'First',
    'Second',
    'Third',
    'Fourth',
    'Fifth',
    'Sixth',
    'Seventh',
    'Eighth',
    'Ninth',
  ];

  @override
  State<StatefulWidget> createState() {
    return _StandardDropDown.init(_standard);
  }
}

class _StandardDropDown extends State<StandardDropDown> {
  String _class;

  String standardOf = "Select Standard";
  List<String> _standard;
  TextEditingController labelText = new TextEditingController();

  _StandardDropDown.init(List<String> _standard) {
    this._standard = _standard;
  }

  @override
  Widget build(BuildContext context) {
    return _getDropDownFormField(
        Icon(Icons.class_), 'Select Class', 'Standard', _standard);
  }

  _getDropDownFormField(
      Icon icon, String hintText, String labelText, List<String> _standard) {
    String _color = '';
    return FormField(
       // validator: classValidation,
        builder: (FormFieldState state) {
          return InputDecorator(
            decoration: InputDecoration(
                icon: Icon(Icons.class_), prefixText: standardOf),
            child: DropdownButtonHideUnderline(
                child: Padding(
              padding: EdgeInsets.only(right: 8.0, left: 8.0),
              child: DropdownButton(
                isDense: true,
                onChanged: (String newValue) {
                  setState(() {
                    standardOf = newValue;
                    state.didChange(newValue);
                   /* onSaved: (String val) {
                      _class = val;
                    };*/
                  });
                },
                items: _standard.map((String value) {
                  return new DropdownMenuItem(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
              ),
            )),
          );
        });
  }
}

/*String classValidation(value) {
  if (value.isEmpty) {
    return 'Please Select Standard';
  }
}*/
