import 'package:flutter/material.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_app/DatePickerDemo.dart';
import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:flutter_app/src/mo/Exam/DropDwonProvider.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../../../TypeDropdownWidget.dart';
import '../../ButtonUI2.dart';
import 'Exam.dart';
import 'ExamActivity.dart';



class ExamAddPage extends StatefulWidget {
  VoidCallback onCallBack;
  Exam  exam;
  @override
  _ExamAddState createState() => _ExamAddState();
  ExamAddPage({@required Exam object, @required onCallBack}) :
        assert (object != null),
        assert (onCallBack != null),
        this.exam = object,
        this.onCallBack = onCallBack;
}

class _ExamAddState extends State<ExamAddPage> {

  //Generic model to get form data.
  GenericModel genericModel = new GenericModel();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  static ExamActivity examActivity = new ExamActivity();
  bool _autoValidate = false;
  bool _isInAsyncCall = false;
  bool _isAdd = false;

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
        body:ModalProgressHUD(
         inAsyncCall: _isInAsyncCall,
         color: Colors.white,
         child:SingleChildScrollView(
          child: _getSafeAreaBody(),
        )

      ),
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
//this method returns the widget list which is assigned to generic model toget data from form
  getWidgetList(){
    List<Widget> widgetList = [
     _getClassDropdownwidget(_formKey,genericModel,null),
      _getExamTypeDropdownwidget(_formKey,genericModel,null),
     _getTextFormTextField(Icon(Icons.title), 'Enter Exam Title', 'Title','title'),
      _getTextFormTextField(Icon(Icons.adjust), 'Enter Totalmark', 'Mark','Mark'),
    _getMultilineTextFormTextField(Icon(Icons.description) , 'Enter Description', 'Description','description'),
    _getMultilineTextFormTextField(Icon(Icons.description) , 'Enter Syllabus', 'Syllabus','Syllabus'),
    _getDateAndTime(_formKey, genericModel,null),
     submitButton(_formKey, genericModel,null),
      ];
    return widgetList;
  }

  // For single line textfield
  _getTextFormTextField(Icon icon , hintText, labelText,paramenter) {
    return TextFormField(
      onSaved: (val) => paramenter == 'title'
          ? genericModel.title = val : paramenter == 'description'
          ? genericModel.description = val :  paramenter == 'totalMarks' ? genericModel.totalMarks = val as int : null,
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
  // For description and syllabus require multiline textfiels
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


  void _submit(){
      if (this._formKey.currentState.validate()) {
        this._formKey.currentState.save();

        setState(() {
          _isInAsyncCall = true;
        });
        final snackBar = SnackBar(content: Text('Exam added sucessfully!'));

        examActivity.addExamToServer_(genericModel, (){
         // Scaffold.of(context).showSnackBar(snackBar);
          setState(() {
            _isAdd = true;
            _isInAsyncCall = false;
          });
          if (_isAdd) {
            Navigator.of(context).pop();
          }
        });
      }
    }



  // 'DRAFT','PUBLISH','CLOSE' UI and pass the generic model to add all data of form to the server as exam data.
  submitButton(_formKey, genericModel,exam){
    return Padding(
        padding: EdgeInsets.only(bottom: 5),
        child: Row(
        children: <Widget>[Material(  //Wrap with Material
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(24.0),
              side: BorderSide(color: AppTheme.nearlyBlue)
          ),
          //elevation: 16.0,
          clipBehavior: Clip.antiAlias, // Add This
          child: MaterialButton(
            minWidth: 120.0,
            height: 35,
            child: new Text("DRAFT",
                style: new TextStyle(fontSize: 12.0, color: AppTheme.nearlyBlue)),
            onPressed: () async {
              genericModel.status = "DRAFT";
              _submit();
            },
          ),
        ),
      Material(  //Wrap with Material
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(24.0),
            side: BorderSide(color: AppTheme.nearlyBlue)
        ),
        //elevation: 16.0,
        clipBehavior: Clip.antiAlias, // Add This
        child: MaterialButton(
          minWidth: 120.0,
          height: 35,
          child: new Text("PUBLISH",
              style: new TextStyle(fontSize: 12.0, color: AppTheme.nearlyBlue)),
          onPressed: () async {
            genericModel.status = "PUBLISH";
            _submit();
          },
        ),
      ),
       Material(  //Wrap with Material
       shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(24.0),
          side: BorderSide(color: AppTheme.nearlyBlue)
          ),
          //elevation: 16.0,
          clipBehavior: Clip.antiAlias, // Add This
          child: MaterialButton(
          minWidth: 120.0,
          height: 35,
          child: new Text("CANCEL",
          style: new TextStyle(fontSize: 12.0, color: AppTheme.nearlyBlue)),
          onPressed: (){
            Navigator.pop(context);
        },
        ),
        ),
        ],
        ),
        );

    //return ButtonUI2.init(_formKey, genericModel,'DRAFT','PUBLISH','CLOSE',exam);

  }

  // drop down for type
  _getExamTypeDropdownwidget(GlobalKey<FormState> formKey, GenericModel genericModel,Exam exam) {
    return TypeDropdownWidget.init(_formKey,genericModel,exam);
  }

  // drop down for class and subject
  _getClassDropdownwidget(GlobalKey<FormState> formKey, GenericModel genericModel,Exam exam) {
    return DropDownProvider.init(_formKey,genericModel,null);
  }

  // Date and time textfield
  _getDateAndTime(GlobalKey<FormState> formKey, GenericModel genericModel,Exam exam ) {
    return DatePickerDemo.init(_formKey,genericModel,exam);
  }
}

