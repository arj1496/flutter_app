import 'package:flutter/material.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_app/MarkTextfield.dart';
import 'package:flutter_app/MultilineTextfield.dart';
import 'package:flutter_app/TypeDropdownWidget.dart';
import 'package:flutter_app/src/mo/Exam/DropDwonProvider.dart';
import '../../../ButtonUI.dart';
import '../../../DatePickerDemo.dart';
import '../../../StandardDropdownWidget.dart';
import '../../../SubjectDropdownWidget.dart';
import '../../ButtonUI2.dart';

class ExamAddPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ExamAddUIState.init();
  }
}

class ExamAddUIState extends State<ExamAddPage>{

  ExamAddUIState.init(){}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: AppTheme.background,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppTheme.background,
          title: Text("Add form"),
        ),
        //body: _getContainerBody(),
        body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding:  EdgeInsets.only(left:8.0,right:8),
            child: Column(
               children:  getWidgetList(),
            ),
          ),
        ),
    ),);
  }

  getWidgetList(){
    List<Widget> widgetList = [
      //StandardDropdownWidget(),
      //SubjectDropdownWidget(),
      DropDownProvider(),
      TypeDropdownWidget(),
      MarkTextfield.init(Icon(Icons.adjust), 'TotalMark'),
      MultilineTextfield.init(Icon(Icons.description),'Description'),
      MultilineTextfield.init(Icon(Icons.library_books,),'Syllabus'),
      DatePickerDemo(),
      ButtonUI2.init('DRAFT','PUBLISH','CLOSE'),];

    return widgetList;
  }

}
