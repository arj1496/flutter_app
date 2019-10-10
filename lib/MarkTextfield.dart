import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:intl/intl.dart';



class MarkTextfield extends StatefulWidget {

  String hint;
  Icon icon;

  MarkTextfield.init(Icon icon,String hint){
    this.hint = hint;
    this.icon = icon;
  }
  @override
  State<StatefulWidget> createState() {
    return ExamAddUIState.init(hint,icon);
  }

}

class ExamAddUIState extends State<MarkTextfield>{


  String hint;
  Icon icon;
  ExamAddUIState.init(String hint,Icon icon){
    this.hint = hint;
    this.icon = icon;
  }
  @override
  Widget build(BuildContext context) {
    return _getMultiLineTextfield(icon,hint);
  }

  _getMultiLineTextfield(Icon icon,String hint) {


    return Container(
      child: TextFormField(
        keyboardType:  TextInputType.number,
        decoration: InputDecoration(
          icon: icon,
          hintText: hint,
          // labelText: labelText
        ),
      ),
    );


  }

}

