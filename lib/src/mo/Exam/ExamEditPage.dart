import 'package:flutter/material.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_app/DatePickerDemo.dart';
import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:flutter_app/src/mo/Exam/DropDwonProvider.dart';
import '../../../TypeDropdownWidget.dart';
import '../../ButtonUI2.dart';
import 'Exam.dart';
import 'ExamActivity.dart';



class ExamEditPage extends StatefulWidget {
  @override
  _ExamAddState createState() => _ExamAddState();
  Exam exam = new Exam();
  ExamEditPage(Exam exam){
    this.exam = exam;
  }
}

class _ExamAddState extends State<ExamEditPage> {
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

  // Pass Data to Exam edit page form the fill exam details in form which is previously created .
  getWidgetList(){
    List<Widget> widgetList = [
      _getClassDropdownwidget(_formKey,genericModel,widget.exam),
      _getExamTypeDropdownwidget(_formKey,genericModel),
      _getTextFormTextField(Icon(Icons.title), 'Enter Exam Title', 'Title','title',widget.exam.name),
      _getTextFormTextField(Icon(Icons.adjust), 'Enter Totalmark', 'Mark','Mark',widget.exam.totalMark.toString()),
      _getMultilineTextFormTextField(Icon(Icons.description) , 'Enter Description', 'Description','description',widget.exam.description),
      _getMultilineTextFormTextField(Icon(Icons.description) , 'Enter Syllabus', 'Syllabus','Syllabus',widget.exam.syllabus),
      _getDateAndTime(_formKey, genericModel,widget.exam),
      submitButton(_formKey, genericModel,widget.exam),
    ];
    return widgetList;
  }

  _getTextFormTextField(Icon icon , hintText, labelText,paramenter,initialvalue) {
    return TextFormField(
      onSaved: (val) => paramenter == 'title'
          ? genericModel.title = val : paramenter == 'description'
          ? genericModel.description = val :  paramenter == 'marks' ? genericModel.totalMarks = val as int : null,
      autovalidate: true,
      initialValue: initialvalue,
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

  _getMultilineTextFormTextField(Icon icon , hintText, labelText,paramenter,String initialValue) {
    return TextFormField(
      onSaved: (val) => paramenter == 'title'
          ? genericModel.title = val : paramenter == 'description'
          ? genericModel.description = val :  genericModel.syllabus = val ,
      autovalidate: true,
      maxLines: null,
      keyboardType:  TextInputType.multiline,
      initialValue: initialValue,
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

  submitButton(_formKey, genericModel,exam){
    return ButtonUI2.init(_formKey, genericModel,'DRAFT','PUBLISH','CLOSE',exam);

  }

  _getExamTypeDropdownwidget(GlobalKey<FormState> formKey, GenericModel genericModel) {
    return TypeDropdownWidget(_formKey,genericModel);
  }

  _getClassDropdownwidget(GlobalKey<FormState> formKey, GenericModel genericModel,Exam exam) {
    return DropDownProvider.init(_formKey,genericModel,exam);
  }

  _getDateAndTime(GlobalKey<FormState> formKey, GenericModel genericModel,Exam exam) {
    return DatePickerDemo.init(_formKey,genericModel,exam);
  }
}

