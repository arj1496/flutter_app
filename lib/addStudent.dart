import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:flutter_app/src/mo/Parent/Parent.dart';
import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Student/Student.dart';
import 'package:flutter_app/src/mo/Student/StudentActivity.dart';

//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'onlyDate.dart';
import 'standardDropDown.dart';

class AddStudent extends StatefulWidget {
  //AddStudent({Key key}) : super(key: key);

  VoidCallback onCallBack;
  Student student = new Student();
  bool isUpdateFlag;

  AddStudent(
      {@required Student object, @required onCallBack, this.isUpdateFlag})
      : assert(object != null),
        assert(onCallBack != null),
        this.student = object,
        this.onCallBack = onCallBack;

  @override
  _addStudentState createState() => _addStudentState();
}

class _addStudentState extends State<AddStudent> {
  //  _formKey and _autoValidate
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  GenericModel genericModel = new GenericModel();
  Parent father;
  Parent mother;

  bool _autoValidate = false;
  bool _isInAsyncCall = false;
  bool _isAdd = false;

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

  void _submit() {
    if (this._formKey.currentState.validate()) {
      this._formKey.currentState.save();

      setState(() {
        _isInAsyncCall = true;
      });

      StudentActivity studentActivity = new StudentActivity();
      studentActivity.addStudent(genericModel, () {
        print("Student Added Successfully!");
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

  @override
  Widget build(BuildContext context) {
    List<Parent> parentList = widget.student.parentList;
    if (parentList != null) {
      for (int i = 0; i < parentList.length; i++) {
        Parent parent = parentList[i];
        if (parent.relation == "FATHER") {
          this.father = parent;
        } else if (parent.relation == "MOTHER") {
          this.mother = parent;
        }
      }
    }

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
      body: ModalProgressHUD(
        inAsyncCall: _isInAsyncCall,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidate: _autoValidate,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Column(
                children: <Widget>[
                  //Student First Name
                  TextFormField(
                    initialValue: widget.student.firstName != ""
                        ? widget.student.firstName
                        : '',
                    //validator: validateFirstName,
                    onSaved: (String val) {
                      genericModel.firstName = val;
                    },
                    autocorrect: true,
                    textInputAction: TextInputAction.next,
                    focusNode: _studentFN,
                    onFieldSubmitted: (term) {
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
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(context, _studentMN, _studentLN);
                    },
                    decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Middle Name',
                        labelText: 'Enter Middle Name'),
                  ),
                  //Student Last Name
                  TextFormField(
                    initialValue: widget.student.lastName != ""
                        ? widget.student.lastName
                        : '',
                    //validator: validateLastName,
                    onSaved: (String val) {
                      genericModel.lastName = val;
                    },
                    autocorrect: true,
                    textInputAction: TextInputAction.next,
                    focusNode: _studentLN,
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(context, _studentLN, _studID);
                    },
                    decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Last Name',
                        labelText: 'Enter Last Name'),
                  ),
                  //Student BirthDate
                  /*     FlatButton(
                      onPressed: () {
                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(2018, 3, 5),
                            maxTime: DateTime(2019, 6, 7), onChanged: (date) {
                              print('change $date');
                            }, onConfirm: (date) {
                              print('confirm $date');
                            }, currentTime: DateTime.now(), locale: LocaleType.en);
                        return D
                      },
                      child: Text(
                        'show date time picker (Chinese)',
                        style: TextStyle(color: Colors.blue),
                      )
                  ),*/
                  DatePicker(Icon(Icons.cake), "BirthDate"),
                  //Class of Student
                  //StandardDropDown(, , widget.student),
                  StandardDropDown(
                      formKey: _formKey,
                      genericModel: genericModel,
                      student: widget.student),
                  // Joining Date of Student
                  DatePicker(Icon(Icons.calendar_today), "Joining Date"),
                  //StudentId(School Student Id)
                  TextFormField(
                    initialValue: widget.student.studentId != ""
                        ? widget.student.studentId
                        : '',
                    onSaved: (String val) {
                      genericModel.studId = val;
                    },
                    autocorrect: true,
                    textInputAction: TextInputAction.next,
                    focusNode: _studID,
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(context, _studID, _rollNO);
                    },
                    decoration: InputDecoration(
                        icon: Icon(Icons.confirmation_number),
                        hintText: 'School Student Id',
                        labelText: 'Student Id'),
                  ),
                  //Roll No
                  TextFormField(
                    initialValue: widget.student.rollNo != ""
                        ? widget.student.rollNo
                        : '',
                    onSaved: (String val) {
                      genericModel.studRollNO = val;
                    },
                    autocorrect: true,
                    textInputAction: TextInputAction.next,
                    focusNode: _rollNO,
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(context, _rollNO, _studentCONTACT);
                    },
                    decoration: InputDecoration(
                        icon: Icon(Icons.confirmation_number),
                        hintText: 'Roll Number',
                        labelText: 'Enter Roll Number'),
                  ),
                  //Student Contact
                  TextFormField(
                    initialValue: widget.student.mobileNumber != ""
                        ? widget.student.mobileNumber
                        : '',
                    onSaved: (String val) {
                      genericModel.contactNo = val;
                    },
                    autocorrect: true,
                    textInputAction: TextInputAction.next,
                    focusNode: _studentCONTACT,
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(
                          context, _studentCONTACT, _studentEMAIL);
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        icon: Icon(Icons.phone),
                        hintText: 'Contact',
                        labelText: 'Enter Contact Number'),
                  ),
                  //Mail Id
                  TextFormField(
                    initialValue:
                        widget.student.email != "" ? widget.student.email : '',
                    //validator: validateEmail,
                    onSaved: (String val) {
                      genericModel.email = val;
                    },
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: true,
                    textInputAction: TextInputAction.next,
                    focusNode: _studentEMAIL,
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(context, _studentEMAIL, _FFN);
                    },
                    decoration: InputDecoration(
                        icon: Icon(Icons.alternate_email),
                        hintText: 'Email Id',
                        labelText: 'Enter Email Id'),
                  ),
                  //Student Gender
                  /*Padding(
                    padding: const EdgeInsets.only(bottom:5.0, top:10.0),
                    child: Gender(_formKey, genericModel),
                  ),*/
                  //Father Details
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0, top: 10.0),
                    child: Container(
                        width: 400.0,
                        height: 30.0,
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Father Details",
                          style: TextStyle(
                              fontSize: 20.0,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  //Father First Name
                  TextFormField(
                    initialValue:
                        this.father != null && this.father.firstName != ""
                            ? this.father.firstName
                            : '',
                    onSaved: (String val) {
                      genericModel.fatherFirstName = val;
                    },
                    autocorrect: true,
                    textInputAction: TextInputAction.next,
                    focusNode: _FFN,
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(context, _FFN, _FLN);
                    },
                    decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Father First Name',
                        labelText: 'Enter Father First Name'),
                  ),
                  //Father Last Name
                  TextFormField(
                    initialValue:
                        this.father != null && this.father.lastName != ""
                            ? this.father.lastName
                            : '',
                    onSaved: (String val) {
                      genericModel.fatherLastName = val;
                    },
                    autocorrect: true,
                    textInputAction: TextInputAction.next,
                    focusNode: _FLN,
                    onFieldSubmitted: (term) {
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
                    initialValue:
                        this.father != null && this.father.mobileNumber != ""
                            ? this.father.mobileNumber
                            : '',
                    onSaved: (String val) {
                      genericModel.fatherContact = val;
                    },
                    autocorrect: true,
                    textInputAction: TextInputAction.next,
                    focusNode: _FCONTACT,
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(context, _FCONTACT, _FEMAIL);
                    },
                    decoration: InputDecoration(
                        icon: Icon(Icons.phone),
                        hintText: 'Father Contact',
                        labelText: 'Enter Father Contact Number'),
                  ),
                  //Father Email Id
                  TextFormField(
                    initialValue: this.father != null && this.father.email != ""
                        ? this.father.email
                        : '',
                    //validator: validateEmail,
                    onSaved: (String val) {
                      genericModel.fatherEmail = val;
                    },
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: true,
                    textInputAction: TextInputAction.next,
                    focusNode: _FEMAIL,
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(context, _FEMAIL, _MFN);
                    },
                    decoration: InputDecoration(
                        icon: Icon(Icons.alternate_email),
                        hintText: 'Father Email Id',
                        labelText: 'Enter Father Email Id'),
                  ),
                  //Mother Details
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2.0, top: 25.0),
                    child: Container(
                        width: 370.0,
                        height: 30.0,
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Mother Details",
                          style: TextStyle(
                              fontSize: 20.0,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  //Mother First Name
                  TextFormField(
                    initialValue:
                        this.mother != null && this.mother.firstName != ""
                            ? this.mother.firstName
                            : '',
                    onSaved: (String val) {
                      genericModel.moherFirstName = val;
                    },
                    autocorrect: true,
                    textInputAction: TextInputAction.next,
                    focusNode: _MFN,
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(context, _MFN, _MLN);
                    },
                    decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Mother First Name',
                        labelText: 'Enter Mother First Name'),
                  ),
                  //Mother Last Name
                  TextFormField(
                    initialValue:
                        this.mother != null && this.mother.lastName != ""
                            ? this.mother.lastName
                            : '',
                    onSaved: (String val) {
                      genericModel.motherLastName = val;
                    },
                    autocorrect: true,
                    textInputAction: TextInputAction.next,
                    focusNode: _MLN,
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(context, _MLN, _MCONTACT);
                    },
                    decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Mother Last Name',
                        labelText: 'Enter Mother Last Name'),
                  ),
                  //Mother Contact
                  TextFormField(
                    initialValue:
                        this.mother != null && this.mother.mobileNumber != ""
                            ? this.mother.mobileNumber
                            : '',
                    keyboardType: TextInputType.phone,
                    onSaved: (String val) {
                      genericModel.motherContact = val;
                    },
                    autocorrect: true,
                    textInputAction: TextInputAction.next,
                    focusNode: _MCONTACT,
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(context, _MCONTACT, _MEMAIL);
                    },
                    decoration: InputDecoration(
                        icon: Icon(Icons.phone),
                        hintText: 'Mother Contact',
                        labelText: 'Enter Mother Contact Number'),
                  ),
                  //Mother Email Id
                  TextFormField(
                    initialValue: this.mother != null && this.mother.email != ""
                        ? this.mother.email
                        : '',
                    //validator: validateEmail,
                    onSaved: (String val) {
                      genericModel.motherEmail = val;
                    },
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: true,
                    textInputAction: TextInputAction.done,
                    focusNode: _MEMAIL,
                    onFieldSubmitted: (value) {
                      _MEMAIL.unfocus();
                      // _submit();
                    },
                    decoration: InputDecoration(
                        icon: Icon(Icons.alternate_email),
                        hintText: 'Mother Email Id',
                        labelText: 'Enter Mother Email Id'),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 40.0, left: 30.0, right: 30.0, bottom: 30.0),
                          child: widget.isUpdateFlag
                              ? MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(30.0)),
                                  color: Colors.lightBlueAccent,
                                  child: Text(
                                    "Update",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  onPressed: () {
                                    _submit();
                                    /* _formKey.currentState.save();
                                StudentActivity studentActivity = new StudentActivity();
                                studentActivity.addStudent(genericModel, (){
                                  print("Student Added Successfully!");
                                  setState(() {
                                    _validateInputs();
                                  });
                                });*/
                                  })
                              : MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(30.0)),
                                  color: Colors.lightBlueAccent,
                                  child: Text(
                                    "Add Student",
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
                              top: 40.0, left: 30.0, right: 30.0, bottom: 30.0),
                          child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              color: Colors.lightBlueAccent,
                              child: Text(
                                "Cancel",
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

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
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
