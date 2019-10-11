import 'package:flutter/material.dart';

class TypeDropdownWidget extends StatefulWidget {
  List<String> _type = <String>['Unit Test 1', 'FA Exam', 'Term Exam', 'Class Test', 'Terminal(A)','test-1','test-2','test-3','test-4',];
  @override
  State<StatefulWidget> createState() {
    return ExamAddUIState.init(_type);
  }
}

class ExamAddUIState extends State<TypeDropdownWidget>{
  String typeOf = "Select Type";
  List<String> _type;
  TextEditingController labelText = new TextEditingController();

  ExamAddUIState.init(List<String> _type){
    this._type= _type;

  }
  @override
  Widget build(BuildContext context) {
    return  _getDropDownFormField(Icon(Icons.class_), 'Select Class', 'Class',_type);

  }

  _getDropDownFormField(Icon icon, String hintText, String labelText,List<String> _type) {

    String _color = '';
    return FormField(

        builder: (FormFieldState state){

          return InputDecorator(
            decoration: InputDecoration(
                icon: Icon(Icons.merge_type),

                prefixText:typeOf
            ),
            child: DropdownButtonHideUnderline(
                child: Padding(
                  padding:  EdgeInsets.only(right:8.0,left:8.0),
                  child: DropdownButton(
                    isDense: true,
                    onChanged: (String newValue){
                      setState(() {
                        typeOf = newValue;
                        state.didChange(newValue);
                      });
                    },
                    items: _type.map((String value) {
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
