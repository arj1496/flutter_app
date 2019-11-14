import 'package:flutter/material.dart';
import 'package:flutter_app/StandardDropdownWidget.dart';
import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:flutter_app/src/mo/Exam/StandardSelectModel.dart';
import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Subject/Subject.dart';
import 'package:provider/provider.dart';

import '../../../Subject/SubjectDropdownWidget.dart';
import 'Exam.dart';
class DropDownProvider extends StatefulWidget  {
  @override
  _DropDownProviderState createState() => _DropDownProviderState();
  GlobalKey<FormState> formKey;
  GenericModel genericModel;
  Exam exam = new Exam();
  DropDownProvider.init(formKey, _eventPojo,exam) {
    this.formKey = formKey;
    this.genericModel = _eventPojo;
    this.exam = exam;
  }
  DropDownProvider(this.formKey, this.genericModel,this.exam);
}

class _DropDownProviderState extends State<DropDownProvider>  with SingleTickerProviderStateMixin{
  /*List<Standard> _standardList = [];
  List<Subject> _subjectList = [];
  Standard _selectedStandard = null;
  String _selectedSubject= null;*/
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => StandardSelectModel(),
      child: Container(
        child: Column(
          children: <Widget>[
            StandardDropdownWidget.init(widget.formKey, widget.genericModel,widget.exam),
            SubjectDropdownWidget.init(widget.formKey, widget.genericModel,widget.exam),
          ],
        ),
      ),
    );
  }
}


