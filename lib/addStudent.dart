import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:flutter_app/src/mo/Student/StudentActivity.dart';
import 'package:sqflite/utils/utils.dart';
import 'onlyDate.dart';
import 'standardDropDown.dart';
import 'Gender.dart';

import 'StudentDetailsWithDialog.dart';

class AddStudent extends StatefulWidget {
  AddStudent({Key key}) : super(key: key);

  @override
  _addStudentState createState() => _addStudentState();
}

class _addStudentState extends State<AddStudent> {
  //  _formKey and _autoValidate
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  GenericModel genericModel = new GenericModel();

  bool _autoValidate = false;
  String _firstname;
  String _lastname;
  String _email;
  String _fatheremail;
  String _motheremail;

  final FocusNode _studentFN = FocusNode();
  final FocusNode _studentMN = FocusNode();
  final FocusNode _studentLN = FocusNode();
  final FocusNode _studID = FocusNode();
  final FocusNode _rollNO = FocusNode();
  final FocusNode _studentCONTACT = FocusNode();
  final FocusNode _studentEMAIL = FocusNode();
  final FocusNode _FFN = FocusNode();
  final FocusNode _FLN = FocusNode();
  final FocusNode _FCONTACT = FocusNode();
  final FocusNode _FEMAIL = FocusNode();
  final FocusNode _MFN = FocusNode();
  final FocusNode _MLN = FocusNode();
  final FocusNode _MCONTACT = FocusNode();
  final FocusNode _MEMAIL = FocusNode();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Stuent Details",
          style: TextStyle(
            fontSize: 17.0,
          ),
          textAlign: TextAlign.start,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidate: _autoValidate,
          child: Padding(
            padding: const EdgeInsets.only(left:8.0,right: 8.0),
            child: Column(
              children: <Widget>[
                //Student First Name
                TextFormField(
                  validator: validateFirstName,
                  onSaved: (String val) {
                    genericModel.firstName = val;
                  },
                  autocorrect: true,
                  textInputAction: TextInputAction.next,
                  focusNode: _studentFN,
                  onFieldSubmitted: (term){
                    _fieldFocusChange(context, _studentFN, _studentMN);
                  },
                  decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'First Name',
                      labelText: 'Enter First Name'),
                ),
                //Student Middle Name
                TextFormField(
                  onSaved: (String val) {
                    genericModel.studMiddleName = val;
                  },
                  autocorrect: true,
                  textInputAction: TextInputAction.next,
                  focusNode: _studentMN,
                  onFieldSubmitted: (term){
                    _fieldFocusChange(context, _studentMN, _studentLN);
                  },
                  decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Middle Name',
                      labelText: 'Enter Middle Name'),
                ),
                //Student Last Name
                TextFormField(
                  validator: validateLastName,
                  onSaved: (String val) {
                    genericModel.lastName = val;
                  },
                  autocorrect: true,
                  textInputAction: TextInputAction.next,
                  focusNode: _studentLN,
                  onFieldSubmitted: (term){
                    _fieldFocusChange(context, _studentLN, _studID);
                  },
                  decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Last Name',
                      labelText: 'Enter Last Name'),
                ),
                //Student BirthDate
                DatePicker(Icon(Icons.cake),"BirthDate"),
                //Class of Student
                StandardDropDown(),
                // Joining Date of Student
                DatePicker(Icon(Icons.calendar_today),"Joining Date"),
                //StudentId(School Student Id)
                TextFormField(
                  onSaved: (String val) {
                    genericModel.studId = val;
                  },
                  autocorrect: true,
                  textInputAction: TextInputAction.next,
                  focusNode: _studID,
                  onFieldSubmitted: (term){
                    _fieldFocusChange(context, _studID, _rollNO);
                  },
                  decoration: InputDecoration(
                      icon: Icon(Icons.confirmation_number),
                      hintText: 'School Student Id',
                      labelText: 'Student Id'),
                ),
                //Roll No
                TextFormField(
                  onSaved: (String val) {
                    genericModel.studRollNO = val;
                  },
                  autocorrect: true,
                  textInputAction: TextInputAction.next,
                  focusNode: _rollNO,
                  onFieldSubmitted: (term){
                    _fieldFocusChange(context, _rollNO, _studentCONTACT);
                  },
                  decoration: InputDecoration(
                      icon: Icon(Icons.confirmation_number),
                      hintText: 'Roll Number',
                      labelText: 'Enter Roll Number'),
                ),
                //Student Contact
                TextFormField(
                  onSaved: (String val) {
                    genericModel.contactNo = val;
                  },
                  autocorrect: true,
                  textInputAction: TextInputAction.next,
                  focusNode: _studentCONTACT,
                  onFieldSubmitted: (term){
                    _fieldFocusChange(context, _studentCONTACT, _studentEMAIL);
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      icon: Icon(Icons.phone),
                      hintText: 'Contact',
                      labelText: 'Enter Contact Number'),
                ),
                //Mail Id
                TextFormField(
                  validator: validateEmail,
                  onSaved: (String val) {
                    genericModel.email = val;
                  },
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: true,
                  textInputAction: TextInputAction.next,
                  focusNode: _studentEMAIL,
                  onFieldSubmitted: (term){
                    _fieldFocusChange(context, _studentEMAIL, _FFN);
                  },
                  decoration: InputDecoration(
                      icon: Icon(Icons.alternate_email),
                      hintText: 'Email Id',
                      labelText: 'Enter Email Id'),
                ),
                //Student Gender
                Gender(),
                //Father Details
                Padding(
                  padding: const EdgeInsets.only(bottom:5.0, top:10.0),
                  child: Container(
                      width: 400.0,
                      height: 30.0,
                      alignment: Alignment.topLeft,
                      child: Text("Father Details",
                      style: TextStyle(
                        fontSize: 20.0,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold
                      ),)),
                ),
                //Father First Name
                TextFormField(
                  onSaved: (String val) {
                    genericModel.fatherFirstName = val;
                  },
                  autocorrect: true,
                  textInputAction: TextInputAction.next,
                  focusNode: _FFN,
                  onFieldSubmitted: (term){
                    _fieldFocusChange(context, _FFN, _FLN);
                  },
                  decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Father First Name',
                      labelText: 'Enter Father First Name'),
                ),
                //Father Last Name
                TextFormField(
                  onSaved: (String val) {
                    genericModel.fatherLastName = val;
                  },
                  autocorrect: true,
                  textInputAction: TextInputAction.next,
                  focusNode: _FLN,
                  onFieldSubmitted: (term){
                    _fieldFocusChange(context, _FLN, _FCONTACT);
                  },
                  decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Father Last Name',
                      labelText: 'Enter Father Last Name'),
                ),
                //Father Contact
                TextFormField(
                  keyboardType: TextInputType.phone,
                  onSaved: (String val) {
                    genericModel.fatherContact = val;
                  },
                  autocorrect: true,
                  textInputAction: TextInputAction.next,
                  focusNode: _FCONTACT,
                  onFieldSubmitted: (term){
                    _fieldFocusChange(context, _FCONTACT, _FEMAIL);
                  },
                  decoration: InputDecoration(
                      icon: Icon(Icons.phone),
                      hintText: 'Father Contact',
                      labelText: 'Enter Father Contact Number'),
                ),
                //Father Email Id
                TextFormField(
                  validator: validateEmail,
                  onSaved: (String val) {
                    genericModel.fatherEmail = val;
                  },
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: true,
                  textInputAction: TextInputAction.next,
                  focusNode: _FEMAIL,
                  onFieldSubmitted: (term){
                    _fieldFocusChange(context, _FEMAIL, _MFN);
                  },
                  decoration: InputDecoration(
                      icon: Icon(Icons.alternate_email),
                      hintText: 'Father Email Id',
                      labelText: 'Enter Father Email Id'),
                ),
                //Mother Details
                Padding(
                  padding: const EdgeInsets.only(bottom:2.0, top:25.0),
                  child: Container(
                      width: 370.0,
                      height: 30.0,
                      alignment: Alignment.topLeft,
                      child: Text("Mother Details",
                      style: TextStyle(
                        fontSize: 20.0,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold
                      ),)),
                ),
                //Mother First Name
                TextFormField(
                  onSaved: (String val) {
                    genericModel.moherFirstName = val;
                  },
                  autocorrect: true,
                  textInputAction: TextInputAction.next,
                  focusNode: _MFN,
                  onFieldSubmitted: (term){
                    _fieldFocusChange(context, _MFN, _MLN);
                  },
                  decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Mother First Name',
                      labelText: 'Enter Mother First Name'),
                ),
                //Mother Last Name
                TextFormField(
                  onSaved: (String val) {
                    genericModel.motherLastName = val;
                  },
                  autocorrect: true,
                  textInputAction: TextInputAction.next,
                  focusNode: _MLN,
                  onFieldSubmitted: (term){
                    _fieldFocusChange(context, _MLN, _MCONTACT);
                  },
                  decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Mother Last Name',
                      labelText: 'Enter Mother Last Name'),
                ),
                //Mother Contact
                TextFormField(
                  keyboardType: TextInputType.phone,
                  onSaved: (String val) {
                    genericModel.motherContact = val;
                  },
                  autocorrect: true,
                  textInputAction: TextInputAction.next,
                  focusNode: _MCONTACT,
                  onFieldSubmitted: (term){
                    _fieldFocusChange(context, _MCONTACT, _MEMAIL);
                  },
                  decoration: InputDecoration(
                      icon: Icon(Icons.phone),
                      hintText: 'Mother Contact',
                      labelText: 'Enter Mother Contact Number'),
                ),
                //Mother Email Id
                TextFormField(
                  validator: validateEmail,
                  onSaved: (String val) {
                    genericModel.motherEmail = val;
                  },
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: true,
                  textInputAction: TextInputAction.done,
                  focusNode: _MEMAIL,
                  onFieldSubmitted: (value){
                    _MEMAIL.unfocus();
                   // _submit();
                  },
                  decoration: InputDecoration(
                      icon: Icon(Icons.alternate_email),
                      hintText: 'Mother Email Id',
                      labelText: 'Enter Mother Email Id'),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      color: Colors.blue,
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        _formKey.currentState.save();
                        StudentActivity studentActivity = new StudentActivity();
                        studentActivity.addStudent(genericModel, (){
                          print("Student Added Successfully!");
                        setState(() {
                          _validateInputs();
                          });
                        });
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
      _formKey.currentState.save();
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }

  _fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}

String validateFirstName(String value) {
  if (value.length < 3)
    return 'First Name must be more than 2 charater';
  else
    return null;
}

String validateLastName(String value) {
  if (value.length < 3)
    return 'Last Name must be more than 2 charater';
  else
    return null;
}

String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter Valid Email';
  else
    return null;
}
