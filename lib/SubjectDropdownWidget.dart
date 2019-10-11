import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:intl/intl.dart';



class SubjectDropdownWidget extends StatefulWidget {
  List<String> _subject = <String>['Marathi', 'Hindi', 'English', 'Science', 'Maths','History','geography','Geometry','Civics','Marathi', 'Hindi', 'English', 'Science', 'Maths','History'];
  @override
  State<StatefulWidget> createState() {
    return ExamAddUIState.init(_subject);
  }

}

class ExamAddUIState extends State<SubjectDropdownWidget>{


  List<String> _subject;
  String subjectOf = "Select Subject";
  TextEditingController labelText = new TextEditingController();

  ExamAddUIState.init(List<String> _subject){
    this._subject= _subject;

  }
  @override
  Widget build(BuildContext context) {
    return _getDropDownFormField(Icon(Icons.class_),_subject);

  }

  _getDropDownFormField(Icon icon,List<String> _subject) {


    return FormField(

        builder: (FormFieldState state){

          return InputDecorator(
            decoration: InputDecoration(
                icon: Icon(Icons.subject),
                prefixText:subjectOf
            ),
            child: DropdownButtonHideUnderline(
                child: Padding(
                  padding:  EdgeInsets.only(right:8.0,left:8.0),
                  child: DropdownButton(
                    isDense: true,
                    onChanged: (String newValue){
                      setState(() {
                        subjectOf = newValue;
                        state.didChange(newValue);
                      });
                    },
                    items: _subject.map((String value) {
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
