
import 'package:flutter/material.dart';


// Generic standard drop down list

class StandardDropdownWidget extends StatefulWidget {
  List<String> _standard = <String>['Class-1', 'Class-2', 'Class-3', 'Class-4', 'Class-5','Class-6', 'Class-7', 'Class-8', 'Class-9', 'Class-10'];
  @override
  State<StatefulWidget> createState() {
    return ExamAddUIState.init(_standard);
  }
}

class ExamAddUIState extends State<StandardDropdownWidget>{
  List<String> _standard;
  TextEditingController labelText = new TextEditingController();
  String classOf = "Select Class";
  ExamAddUIState.init(List<String> _standard){
    this._standard= _standard;
  }
  @override
  Widget build(BuildContext context) {
    return _getDropDownFormField(Icon(Icons.class_),_standard);
  }

  _getDropDownFormField(Icon icon,List<String> _standard) {
    String _color = '';
    return FormField(
        builder: (FormFieldState state){
          return InputDecorator(
            decoration: InputDecoration(
                icon: icon,
                prefixText:classOf
            ),
            child: DropdownButtonHideUnderline(
                child: Padding(
                  padding:  EdgeInsets.only(right:8.0,left:8.0),
                  child: DropdownButton(
                    isDense: true,
                    onChanged: (String newValue){
                      setState(() {
                        classOf = newValue;
                        state.didChange(newValue);
                      });
                    },
                    items: _standard.map((String value) {
                      return new DropdownMenuItem(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                  ),
                )
            ),
          );
        }
    );
  }
}
