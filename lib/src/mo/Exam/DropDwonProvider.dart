import 'package:flutter/material.dart';
import 'package:flutter_app/StandardDropdownWidget.dart';
import 'package:flutter_app/src/mo/Exam/StandardSelectModel.dart';
import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Subject/Subject.dart';
import 'package:provider/provider.dart';

import '../../../SubjectDropdownWidget.dart';
class DropDownProvider extends StatefulWidget  {
  @override
  _DropDownProviderState createState() => _DropDownProviderState();

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
            StandardDropdownWidget(),
            SubjectDropdownWidget(),
          ],
        ),
      ),
    );
  }
}


