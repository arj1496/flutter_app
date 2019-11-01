import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/src/mo/Student/Student.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'src/mo/CommanCode/GenericModel.dart';
import 'src/mo/Parent/Parent.dart';
import 'src/mo/Student/StudentActivity.dart';

class getStudentEditForm extends StatefulWidget {

  VoidCallback onCustCallBack;
  Student student;

  getStudentEditForm({Student object,  @required onCustCallBack}) :
        assert (onCustCallBack != null),
        student = object,
        onCustCallBack = onCustCallBack;

  @override
  _getStudentEditFormState createState() => _getStudentEditFormState();
}

class _getStudentEditFormState extends State<getStudentEditForm> {

  // maintains validators and state of form fields
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // manage state of modal progress HUD widget
  bool _isInAsyncCall = false;

  GenericModel genericmodel = new GenericModel();

  Parent father;
  Parent mother;

  bool _isUpdate = false;

  void _submit() {
    if (this._formKey.currentState.validate()) {
      this._formKey.currentState.save();

      setState(() {
        _isInAsyncCall = true;
      });

      // call activity

      StudentActivity studentActivity = new StudentActivity();
      studentActivity.saveStudentDetail(genericmodel, (){
        setState(() {
          _isUpdate = true;
          _isInAsyncCall = false;
        });
        if (_isUpdate) {
          widget.onCustCallBack();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Parent> parentList = widget.student.parentList;

    // parentList
    for(int i=0;i<parentList.length;i++){
      Parent parent = parentList[i];
      if(parent.relation == "FATHER"){
        this.father = parent;
      }else if(parent.relation == "MOTHER"){
        this.mother = parent;
      }
    }

    String studentName = widget.student.firstName + ' ' + widget.student.lastName;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Parent details of ${studentName}",
          style: TextStyle(
            fontSize: 17.0,
          ),
          textAlign: TextAlign.start,
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: _isInAsyncCall,
        color: Colors.white,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 20.0),
          child: Form(
            key: this._formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 0.0, left: 10.0),
                  child: Container(
                      alignment: Alignment.topLeft,
                      child: Text("Father details",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold))),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: TextFormField(
                    initialValue: this.father != null && this.father.firstName != "" ? this.father.firstName : '',
                    autocorrect: true,
                    decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Father First Name',
                        labelText: 'Enter father firstName'
                    ),
                    onSaved: (value) => genericmodel.fatherFirstName = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: TextFormField(
                    initialValue: this.father != null && this.father.lastName != "" ? this.father.lastName : '',
                    autocorrect: true,
                    decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Father Last Name',
                        labelText: 'Enter father lastName'),
                    onSaved: (value) => genericmodel.fatherLastName = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: TextFormField(
                    initialValue: this.father != null && this.father.email != "" ? this.father.email : '',
                    autocorrect: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        icon: Icon(Icons.alternate_email),
                        hintText: 'Father Email Id',
                        labelText: 'Enter father emailId'),
                    onSaved: (value) => genericmodel.fatherEmail = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: TextFormField(
                    initialValue: this.father != null && this.father.mobileNumber != "" ? this.father.mobileNumber : '',
                    autocorrect: true,
                    keyboardType: TextInputType.phone,
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(12),
                    ],
                    decoration: InputDecoration(
                        icon: Icon(Icons.phone),
                        hintText: 'Phone Number',
                        labelText: 'Enter Father phoneNumber'),
                    onSaved: (value) => genericmodel.fatherContact = value,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 10.0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text("Mother details",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: TextFormField(
                    initialValue: this.mother != null && this.mother.firstName != "" ? this.mother.firstName : '',
                    autocorrect: true,
                    decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Mother First Name',
                        labelText: 'Enter mother firstName'),
                    onSaved: (value) => genericmodel.moherFirstName = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: TextFormField(
                    initialValue: this.mother != null && this.mother.lastName != "" ? this.mother.lastName : '',
                    autocorrect: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Mother Last Name',
                      labelText: 'Enter mother lastName',
                    ),
                    onSaved: (value) => genericmodel.motherLastName = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: TextFormField(
                    initialValue: this.mother != null && this.mother.email != "" ? this.mother.email : '',
                    autocorrect: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        icon: Icon(Icons.alternate_email),
                        hintText: 'Mother Email Id',
                        labelText: 'Enter mother emailId'),
                    onSaved: (value) => genericmodel.motherEmail= value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: TextFormField(
                    initialValue: this.mother != null && this.mother.mobileNumber != "" ? this.mother.mobileNumber : '',
                    autocorrect: true,
                    keyboardType: TextInputType.phone,
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(12),
                    ],
                    decoration: InputDecoration(
                        icon: Icon(Icons.phone),
                        hintText: 'Mother Phone Number',
                        labelText: 'Enter mother phoneNumber'),
                    onSaved: (value) => genericmodel.motherContact = value,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 40.0, left: 50.0, right: 40.0, bottom: 30.0),
                        child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            color: Colors.lightBlueAccent,
                            child: Text(
                              "Update",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {
                              _submit();
                            }),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 40.0, left: 50.0, right: 40.0, bottom: 30.0),
                        child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            color: Colors.lightBlueAccent,
                            child: Text(
                              "Close",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}