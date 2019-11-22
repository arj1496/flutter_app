import 'package:flutter/material.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:flutter_app/src/mo/Holiday/DateWidgetForHolyday.dart';
import 'package:flutter_app/src/mo/Holiday/Holiday.dart';
import 'package:flutter_app/src/mo/Holiday/HolidayActivity.dart';


//import 'EndDateWidget.dart';





class HolidayAdd extends StatefulWidget {
  VoidCallback onCallBack;


  @override
  _HolidayAddState createState() => _HolidayAddState();
}

class _HolidayAddState extends State<HolidayAdd> {


  GenericModel genericModel = new GenericModel( );
  FocusNode _focus = new FocusNode();

  Holiday holiday = new Holiday();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>( );
  static HolidayActivity holidayActivity = new HolidayActivity( );
  final GlobalKey<ScaffoldState> scafoldKey = new GlobalKey<ScaffoldState>( );
  bool _autoValidate = false;
  bool _isInAsyncCall = false;
  bool _isAdd = false;
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
            title: Text ( "Add Holiday form" ) ,
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
    List<Widget> widgetList = [
      new Card(
        child: _getTextFormTextField ('name of Holiday','title') ,
      )
      ,
      new Card(
        child: TextField(
          decoration: InputDecoration(
            labelText: holiday.type,
          ),
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
            _displayDialog(context);
          },
        ),

      ),
      new Card(
        child: _getDateAndTime (_formKey , holiday) ,
      )
      ,
      //  _getEndDateAndTime ( _formKey , homework ) ,
      submitButton ( _formKey) ,
    ];
    return widgetList;
  }

  // For single line textfield
  _getTextFormTextField(paramenter,labletext ) {
    return TextFormField (
      onSaved: (val) => holiday.name = val ,

      decoration: InputDecoration(
        labelText: labletext
      ),

      autovalidate: true ,

      validator: ( String value ) {
        if (paramenter == 'name') {
          if (value.isEmpty) {
            return 'Please Enter ${paramenter}';
          }
        } else if (paramenter == 'type') {
          if (value.length < 3) {
            return 'Please Enter ${paramenter}';
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

  /*_getPopup( Icon icon , hintText , labelText , paramenter ) {
    return _displayDialog(context);


  }
*/
  _displayDialog(BuildContext context) async {
    var _id;
    return showDialog(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 100.0,
            width: 100.0,
            child: AlertDialog(

              content: new ListView.builder
                (
                  itemCount: holidaysItem.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    //final holydayName =holidaysItem[index];
                    return Container(
                        child: Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap:(){
                                setState(() {
                                  holiday.type = holidaysItem[index];
                                  Navigator.pop(context);
                                });
                              },
                              child: ListTile(
                                leading: Text(holidaysItem[index]),
                              ),
                            )
                          ],
                        )
                    );
                  }
              ),

              /*  actions: <Widget>[

                new RaisedButton(
                    child: Text( "Done" ,style: TextStyle(fontSize: 10.0,color: Colors.white),),
                    color: Colors.green,
                    onPressed: () {
                      Navigator.pop( context );
                    } )
              ],*/
            ),
          );
        } );
  }


  // Date and time textfield
  _getDateAndTime( GlobalKey<FormState> formKey , Holiday holiday ) {
    return DateWidgetForHolyday.init ( _formKey , holiday );
  }


  void _submit( ) {
    if (this._formKey.currentState.validate ( )) {
      this._formKey.currentState.save ( );
      final snackBar = SnackBar(content: Text('Holiday added sucessfully!'));
      HolidayActivity holidayActivity = new HolidayActivity();
      holidayActivity.addHolidayToServer(holiday, (){
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
            child: new Text( "Save" ,
                style: new TextStyle(
                    fontSize: 12.0 , color: AppTheme.nearlyBlue ) ) ,
            onPressed: ( ) async {

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
              child: new Text( "Cancel" ,
                  style: new TextStyle(
                      fontSize: 12.0 , color: AppTheme.nearlyBlue ) ) ,
              onPressed: ( ) async {

                Navigator.pop ( context );
              } ,
            ) ,
          ) ,

        ] ,
      ) ,
    );

    //return ButtonUI2.init(_formKey, genericModel,'DRAFT','PUBLISH','CLOSE',exam);

  }
  String initVal = "Type of holiday";

  List<String> holidaysItem = [
    "VACATION",
    "OTHERS",
    "PUBLIC HOLIDAY",
    "EXTRA HOLIDAY",
    "READING",
    "EXAM"
  ];

  _showAlert(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 100.0,
            width: 100.0,
            child: AlertDialog(

              content: new ListView.builder
                (
                  itemCount: holidaysItem.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    //final holydayName =holidaysItem[index];
                    return Container(
                        child: Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                setState( () {
                                  initVal = holidaysItem[index];
                                  Navigator.pop( context );
                                } );
                              },
                              child: ListTile(
                                leading: Text( holidaysItem[index] ),
                              ),
                            )
                          ],
                        )
                    );
                  }
              ),

              /*  actions: <Widget>[

                new RaisedButton(
                    child: Text( "Done" ,style: TextStyle(fontSize: 10.0,color: Colors.white),),
                    color: Colors.green,
                    onPressed: () {
                      Navigator.pop( context );
                    } )
              ],*/
            ),
          );
        });

  }
}
