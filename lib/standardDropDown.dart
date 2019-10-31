import 'package:flutter/material.dart';
import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Standard/StandardActivity.dart';

class StandardDropDown extends StatefulWidget {

  /*List<String> _standard = null;*/

  @override
  State<StatefulWidget> createState() {
    return StandardropdownState();
  }

  GlobalKey<FormState> formKey;
  GenericModel genericModel;
  StandardDropDown.init(formKey, _eventPojo) {
    this.formKey = formKey;
    this.genericModel = _eventPojo;
  }

  StandardDropDown(this.formKey, this.genericModel);

}

Future<List<Standard>> getStandards() async {
  StandardActivity standardActivity = new StandardActivity();
  List<Standard> _standard = await standardActivity.getStandardListFromLocalDB();

  return _standard;
}

class StandardropdownState extends State<StandardDropDown> {
  String _class;

  String standardOf = "Select Class";
  static int selectedStandardId;
  TextEditingController labelText = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getStandards(),
      builder: (context , snapshot){
        return Container(
          child: Column(
            children: <Widget>[
              _getDropDownFormField (Icon(Icons.class_), 'Select Class', 'Standard',snapshot ),
            ],
          ),
        );
      },
    );
  }

  _getDropDownFormField(Icon icon, String hintText, String labelText, AsyncSnapshot snapshot) {
    String _color = '';
    List<Standard> standardList = new List();
    if(snapshot.data != null){
      standardList = snapshot.data;
    }
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
                onChanged: (newValue) {
                  setState(() {
                    selectedStandardId = newValue.id;
                    standardOf = newValue.name;
                    state.didChange(newValue);
                    widget.formKey.currentState.save();
                    widget.genericModel.studentDBId = newValue.id;
                  });
                },
                items: standardList.map((Standard standard) {
                  return new DropdownMenuItem(
                    value: standard,
                    child: new Text(standard.name),
                  );
                }).toList(),
              ),
            )),
          );
        });
  }
  getSelectedStandard() async {
    return selectedStandardId;
  }
}

/*String classValidation(value) {
  if (value.isEmpty) {
    return 'Please Select Standard';
  }
}*/
