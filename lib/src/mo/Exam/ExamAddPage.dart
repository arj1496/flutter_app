import 'package:flutter/material.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_app/DatePickerDemo.dart';
import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:flutter_app/src/mo/Event/EventActivity.dart';

import 'package:flutter_app/src/mo/Event/EventTypeAutoComplte.dart';
import 'package:flutter_app/src/mo/Exam/DropDwonProvider.dart';

import '../../../TypeDropdownWidget.dart';
import '../../ButtonUI2.dart';
import 'ExamActivity.dart';



class ExamAddPage extends StatefulWidget {
  @override
  _ExamAddState createState() => _ExamAddState();
}

class _ExamAddState extends State<ExamAddPage> {
  //EventPojo eventPojo = new EventPojo();
  GenericModel genericModel = new GenericModel();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  static ExamActivity examActivity = new ExamActivity();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        backgroundColor: AppTheme.background,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppTheme.background,
          title: Text("Add Exam form"),
        ),
        //body: _getContainerBody(),
        body:SingleChildScrollView(
          child: _getSafeAreaBody(),
        )

      ),
    );
  }

  _getSafeAreaBody() {
    return SafeArea(
      top: false,
      bottom: false,
      maintainBottomViewPadding: true,
      child: Form(
        key: _formKey,
        autovalidate: true,
        child: Column(
          /*padding: const EdgeInsets.symmetric(horizontal: 16),*/
          children: getWidgetList(),
        ),
      ),
    );
  }

  getWidgetList(){
    List<Widget> widgetList = [
    _getClassDropdownwidget(_formKey,genericModel),
      _getExamTypeDropdownwidget(_formKey,genericModel),
    _getTextFormTextField(Icon(Icons.title), 'Enter Exam Title', 'Title','title'),
      _getTextFormTextField(Icon(Icons.adjust), 'Enter Totalmark', 'Mark','Mark'),
    _getMultilineTextFormTextField(Icon(Icons.description) , 'Enter Description', 'Description','description'),
    _getMultilineTextFormTextField(Icon(Icons.description) , 'Enter Syllabus', 'Syllabus','Syllabus'),
    _getDateAndTime(_formKey, genericModel),
    submitButton(_formKey, genericModel),
      ];
    return widgetList;
  }

  _getTextFormTextField(Icon icon , hintText, labelText,paramenter) {
    return TextFormField(
      onSaved: (val) => paramenter == 'title'
          ? genericModel.title = val : paramenter == 'description'
          ? genericModel.description = val :  paramenter == 'marks' ? genericModel.totalMarks = val as int : null,
      autovalidate: true,
      decoration: InputDecoration(
          icon: icon,
          hintText: hintText,
          labelText: labelText
      ),
      validator: (String value){
        if(paramenter == 'title'){
          if(value.isEmpty){
            return 'Please Enter ${paramenter}';
          }
        }else if(paramenter == 'description'){
          if(value.length < 3 ){
            return 'Please Enter 3 charater in ${paramenter}';
          }
        }else if(paramenter == 'place'){
          if(value.length < 5){
            return 'Please Enter 5 charater in  ${paramenter}';
          }
        }
        return null;
      },
    );
  }

  _getMultilineTextFormTextField(Icon icon , hintText, labelText,paramenter) {
    return TextFormField(
      onSaved: (val) => paramenter == 'title'
          ? genericModel.title = val : paramenter == 'description'
          ? genericModel.description = val :  genericModel.syllabus = val ,
      autovalidate: true,
      maxLines: null,
      keyboardType:  TextInputType.multiline,
      decoration: InputDecoration(
          icon: icon,
          hintText: hintText,
          labelText: labelText
      ),
      validator: (String value){
        if(paramenter == 'title'){
          if(value.isEmpty){
            return 'Please Enter ${paramenter}';
          }
        }else if(paramenter == 'description'){
          if(value.length < 3 ){
            return 'Please Enter 3 charater in ${paramenter}';
          }
        }else if(paramenter == 'place'){
          if(value.length < 5){
            return 'Please Enter 5 charater in  ${paramenter}';
          }
        }
        return null;
      },
    );
  }

  _submitButton() {
    return MaterialButton(
      minWidth: 200.0,
      height: 35,

      child: new Text("Add Exam",
          style: new TextStyle(fontSize: 12.0, color: AppTheme.nearlyBlue)),
      onPressed: (){
        // Event eventObject = eventActivity.addEventToServer(event);
        if(_formKey.currentState.validate()){
          _formKey.currentState.save();
        }
        print("standard : ${genericModel.classId}");
        print("subject : ${genericModel.subjectId}");
        print("type : ${genericModel.examType}");
        print("Titile : ${genericModel.title}");
        print("Description : ${genericModel.description}");
        print("syllabus : ${genericModel.syllabus}");
        print("exam Type : ${genericModel.examType}");
        print("exam date : ${genericModel.date}");
        print("exam time : ${genericModel.time}");

      },
    );
  }

  submitButton(_formKey, genericModel){
    return ButtonUI2.init(_formKey, genericModel,'DRAFT','PUBLISH','CLOSE');

  }

  _getExamTypeDropdownwidget(GlobalKey<FormState> formKey, GenericModel genericModel) {
    return TypeDropdownWidget(_formKey,genericModel);
  }

  _getClassDropdownwidget(GlobalKey<FormState> formKey, GenericModel genericModel) {
    return DropDownProvider(_formKey,genericModel);
  }

  _getDateAndTime(GlobalKey<FormState> formKey, GenericModel genericModel) {
    return DatePickerDemo.init(_formKey,genericModel);
  }
}

