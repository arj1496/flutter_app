import 'package:flutter/material.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:flutter_app/src/mo/HomeWork/SubjectPopup.dart';
import 'package:flutter_app/src/mo/Subject/Subject.dart';
import 'DateWidgetForHomework.dart';
import 'EndDateWidget.dart';
import 'HomeWork.dart';
import 'HomeworkActivity.dart';




class HomeworkEdit extends StatefulWidget {
  VoidCallback onCallBack;

  HomeWork homeWork = new HomeWork();
  HomeworkEdit(HomeWork homeWork){
    this.homeWork = homeWork;
  }
  @override
  _HomeworkAddState createState() => _HomeworkAddState(homeWork);
}

class _HomeworkAddState extends State<HomeworkEdit> {

  //Generic model to get form data.
  Subject selectSub;
  GenericModel genericModel = new GenericModel();
  FocusNode _focus = new FocusNode();

  HomeWork homework = new HomeWork();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>( );
  static HomeworkActivity examActivity = new HomeworkActivity( );
  final GlobalKey<ScaffoldState> scafoldKey = new GlobalKey<ScaffoldState>( );
  bool _autoValidate = false;
  bool _isInAsyncCall = false;
  bool _isAdd = false;

  _HomeworkAddState(HomeWork homeWork){
    this.homework = homeWork;
  }

  @override
  Widget build( BuildContext context ) {
    return Container (
      color: AppTheme.background ,
      child: Scaffold (
          key: scafoldKey,
          backgroundColor: AppTheme.background ,
          appBar: AppBar (
            elevation: 0.0 ,
            backgroundColor: AppTheme.background ,
            title: Text ( "Edit Homework form" ) ,
          ) ,
          //body: _getContainerBody(),
          body: SingleChildScrollView (
            child: _getSafeAreaBody ( ) ,
          )

      ) ,
    );
  }

  _getSafeAreaBody() {
    return SafeArea (
      top: false ,
      bottom: false ,
      maintainBottomViewPadding: true ,
      child: Form (
        key: _formKey ,
        autovalidate: true ,
        child: Column (
          /*padding: const EdgeInsets.symmetric(horizontal: 16),*/
          children: getWidgetList ( ) ,
        ) ,
      ) ,
    );
  }

//this method returns the widget list which is assigned to generic model toget data from form
  getWidgetList( ) {
    List<Widget> widgetList = new List();

    Widget widget;
    widget = _getTextFormTextField (
        Icon ( Icons.title ) , 'Enter Homework Title' , 'Title' , 'title',homework.title );
    widgetList.add(widget);

    widget = _getPopup (
        Icon ( Icons.subject ) , 'Enter Subject' , 'Subject'  , 'Subject',homework.subjectName + "("+homework.className+")" ) ;
    widgetList.add(widget);
    if(homework.type != null){
      widget=_getTextFormTextField (
          Icon ( Icons.merge_type ) , 'Enter Type' , 'Type' , 'Type',homework.type);

    } else{
      widget=_getTextFormTextField (
          Icon ( Icons.merge_type ) , 'Enter Type' , 'Type' , 'Type',null);
      widgetList.add((widget));
    }
    widget = _getTextFormTextField (
        Icon ( Icons.adjust ) , 'Enter Mark' , 'Mark', 'Mark' , homework.mark.toString());
    widgetList.add(widget);
    if(homework.description != null) {
      widget = _getMultilineTextFormTextField (
          Icon ( Icons.description ) , 'Enter Description' , 'Description' ,
          'description',homework.description );
      widgetList.add(widget);
    }else{
      widget = _getMultilineTextFormTextField (
          Icon ( Icons.description ) , 'Enter Description' , 'Description' ,
          'description',null);
      widgetList.add(widget);
    }
    if(homework.startDate != null && homework.endDate != null) {
      widget =  _getDateAndTime ( _formKey , homework );
      widgetList.add(widget);
    }else{
      widget =  _getDateAndTime ( _formKey , homework );
      widgetList.add(widget);
    }
    //  _getEndDateAndTime ( _formKey , homework ) ,
    widget = submitButton ( _formKey);
    widgetList.add(widget);
    return widgetList;
  }

  // For single line textfield
  _getTextFormTextField( Icon icon , hintText , labelText , paramenter ,initialVal) {
    return TextFormField (
      onSaved: (val) => paramenter == 'title'
          ? homework.title = val : paramenter == 'description'
          ? homework.description = val : paramenter == 'Mark'
          ? homework.mark = int.parse(val) : paramenter == 'Type'
          ? homework.type = val : null,

      autovalidate: true ,
      initialValue: initialVal,
      decoration: InputDecoration (
          icon: icon ,
          hintText: hintText ,
          labelText: labelText
      ) ,
      validator: ( String value ) {
        if (paramenter == 'title') {
          if (value.isEmpty) {
            return 'Please Enter ${paramenter}';
          }
        } else if (paramenter == 'description') {
          if (value.length < 3) {
            return 'Please Enter 3 charater in ${paramenter}';
          }
        } else if (paramenter == 'place') {
          if (value.length < 5) {
            return 'Please Enter 5 charater in  ${paramenter}';
          }
        }
        return null;
      } ,
    );
  }

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }
  void _onFocusChange(){
    _showAlert(context);
  }

  _getPopup( Icon icon , hintText , labelText , paramenter ,initialVal) {
    return GestureDetector(
      onTap: () {
        _showAlert(context);
      },
      child:AbsorbPointer(
        child: Padding(
          padding: const EdgeInsets.only(top:18.0),
          child: TextFormField (
            initialValue: initialVal,
            decoration: InputDecoration (
              icon: icon ,
              hintText: hintText ,
              labelText: labelText,

            ) ,
            // focusNode: _focus,

          ),

        ),
      ),
    );


  }

  // For description and syllabus require multiline textfields
  _getMultilineTextFormTextField( Icon icon , hintText , labelText ,
      paramenter,initialVal ) {
    return TextFormField (
      onSaved: (val) => homework.description = val,
      autovalidate: true ,
      maxLines: null ,
      keyboardType: TextInputType.multiline ,
      initialValue: initialVal,
      decoration: InputDecoration (
          icon: icon ,
          hintText: hintText ,
          labelText: labelText
      ) ,
      validator: ( String value ) {
        if (paramenter == 'title') {
          if (value.isEmpty) {
            return 'Please Enter ${paramenter}';
          }
        } else if (paramenter == 'description') {
          if (value.length < 3) {
            return 'Please Enter 3 charater in ${paramenter}';
          }
        } else if (paramenter == 'place') {
          if (value.length < 5) {
            return 'Please Enter 5 charater in  ${paramenter}';
          }
        }
        return null;
      } ,
    );
  }

  // Date and time textfield
  _getDateAndTime( GlobalKey<FormState> formKey , HomeWork homework ) {
    return DateWidgetForHomework.init ( _formKey , homework );
  }


  // Date and time textfield
  _getEndDateAndTime( GlobalKey<FormState> formKey , HomeWork homework ) {
    return EndDateWidget.init ( _formKey , homework );
  }


  void _submit( ) {
    if (this._formKey.currentState.validate ( )) {
      this._formKey.currentState.save ( );
      final snackBar = SnackBar(content: Text('Homework added sucessfully!'));
      HomeworkActivity homeworkActivity = new HomeworkActivity();
      homeworkActivity.updateHomeworkToServer_(homework, (){
        // Scaffold.of(context).showSnackBar(snackBar);
        setState(() {
          _isAdd = true;
          _isInAsyncCall = false;
        });
        if (_isAdd) {
          scafoldKey.currentState.showSnackBar(snackBar);
          //s Navigator.of(context).pop();
        }
      });


      //Scaffold.of(context).showSnackBar(snackBar);
    }
  }


  // 'DRAFT','PUBLISH','CLOSE' UI and pass the generic model to add all data of form to the server as exam data.
  submitButton( _formKey  ) {
    return Padding (
      padding: EdgeInsets.only ( bottom: 5 , top: 30 ) ,
      child: Row (
        children: <Widget>[Material ( //Wrap with Material
          shape: RoundedRectangleBorder (
              borderRadius: new BorderRadius.circular( 24.0 ) ,
              side: BorderSide ( color: AppTheme.nearlyBlue )
          ) ,
          //elevation: 16.0,
          clipBehavior: Clip.antiAlias , // Add This
          child: MaterialButton (
            minWidth: 120.0 ,
            height: 35 ,
            child: new Text( "DRAFT" ,
                style: new TextStyle(
                    fontSize: 12.0 , color: AppTheme.nearlyBlue ) ) ,
            onPressed: ( ) async {
              //genericModel.status = "DRAFT";
              _submit ( );
            } ,
          ) ,
        ) ,
          Material ( //Wrap with Material
            shape: RoundedRectangleBorder (
                borderRadius: new BorderRadius.circular( 24.0 ) ,
                side: BorderSide ( color: AppTheme.nearlyBlue )
            ) ,
            //elevation: 16.0,
            clipBehavior: Clip.antiAlias , // Add This
            child: MaterialButton (
              minWidth: 120.0 ,
              height: 35 ,
              child: new Text( "PUBLISH" ,
                  style: new TextStyle(
                      fontSize: 12.0 , color: AppTheme.nearlyBlue ) ) ,
              onPressed: ( ) async {
                genericModel.status = "PUBLISH";
                _submit ( );
              } ,
            ) ,
          ) ,
          Material ( //Wrap with Material
            shape: RoundedRectangleBorder (
                borderRadius: new BorderRadius.circular( 24.0 ) ,
                side: BorderSide ( color: AppTheme.nearlyBlue )
            ) ,
            //elevation: 16.0,
            clipBehavior: Clip.antiAlias , // Add This
            child: MaterialButton (
              minWidth: 120.0 ,
              height: 35 ,
              child: new Text( "CANCEL" ,
                  style: new TextStyle(
                      fontSize: 12.0 , color: AppTheme.nearlyBlue ) ) ,
              onPressed: ( ) {
                Navigator.pop ( context );
              } ,
            ) ,
          ) ,
        ] ,
      ) ,
    );

    //return ButtonUI2.init(_formKey, genericModel,'DRAFT','PUBLISH','CLOSE',exam);

  }

  _showAlert(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SubjectPopup(
              callback: (List<Subject> value){
                homework.subjectId = value[0].id;
                homework.classId = value[0].standardId;
                print("callBack Return ${value.length}");
              }
          );
        }
    );
  }
}
