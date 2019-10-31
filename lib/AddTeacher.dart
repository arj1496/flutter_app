import 'package:flutter/material.dart';
import 'package:flutter_app/DatePickerDemo.dart';
import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:flutter_app/src/mo/teacher/TeacherActivity.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'ButtonUI.dart';
import 'onlyDate.dart';

class AddTeacher extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddTeacherState();
  }
}
class AddTeacherState extends State<AddTeacher> {
  var formKey = GlobalKey<FormState>();
  bool isInAsyncCall = false;
  GenericModel genericModel = new GenericModel();
  bool male = false;
  var message = "Non-Acadmic";
  var val = false;
  var inviteVal = true;
  var sendInvite = "Invite";
  VoidCallback onCustomCallBack;
  final FocusNode _firstInputFocusNode = new FocusNode();
  final FocusNode _lastInputFocusNode = new FocusNode();
  final FocusNode _emailInputFocusNode = new FocusNode();
  final FocusNode _mobileInputFocusNode = new FocusNode();
  final FocusNode _genderInputFocusNode = new FocusNode();

  //DatePickerDemo datePickerDemo= new DatePickerDemo();
  int groupValue;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

        appBar: AppBar(backgroundColor: Colors.orangeAccent,),
        body:ModalProgressHUD(
            inAsyncCall: isInAsyncCall,
            child:
            Form(
              key: formKey,
              child: ListView(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        focusNode: _firstInputFocusNode,
                        textInputAction: TextInputAction.next,
                        // decoration: InputDecoration(hintText: "First Text Field"),
                        onEditingComplete: () =>
                            FocusScope.of(context).requestFocus(
                                _lastInputFocusNode),
                        onSaved: (val) => genericModel.firstName = val,
                        autovalidate: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter Name';
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'First Name',
                          hintText: 'Prof  S.Jadhav6 ',
                          icon: Icon(Icons.person),
                        ),
                      )
                  ),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        focusNode: _lastInputFocusNode,
                        // decoration: InputDecoration(hintText: "Second Text Field"),
                        onEditingComplete: () =>
                            FocusScope.of(context).requestFocus(
                                _emailInputFocusNode),

                        onSaved: (val) => genericModel.lastName = val,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'please Enter value';
                          }
                        },
                        decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: 'Last name',
                          hintText: 'Prof  S.Jadhav6 ',
                        ),
                      )

                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: DatePicker(Icon(Icons.cake), "BirthDate"),
                  ),

                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      focusNode: _emailInputFocusNode,
                      // decoration: InputDecoration(hintText: "Second Text Field"),
                      onEditingComplete: () =>
                          FocusScope.of(context).requestFocus(
                              _mobileInputFocusNode),

                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        icon: Icon(Icons.alternate_email),
                        labelText: 'Email-id',
                      ),
                      onSaved: (val) => genericModel.email = val,

                    ),

                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      focusNode: _mobileInputFocusNode,
                      // decoration: InputDecoration(hintText: "Second Text Field"),
                      onEditingComplete: () =>
                          FocusScope.of(context).requestFocus(
                              _genderInputFocusNode),
                      onSaved: (val) {
                        genericModel.mobileNumber = val;
                      },
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      // textInputAction: TextInputAction.next,

                      decoration: InputDecoration(
                        icon: Icon(Icons.contacts),
                        labelText: 'Contact No.',

                      ),
                    ),
                  ),

                  chooseGender(),
                  SwitchListTile(title: Text(message),

                    value: val,

                    onChanged: (bool value) {
                      selectAcadmic(value);
                      genericModel.academicType =
                      value ? int.parse("1") : int.parse("0");
                    },
                    secondary: const Icon(Icons.school),
                  ),
                  SwitchListTile(
                    title: Text(sendInvite),
                    value: inviteVal,
                    onChanged: (bool val) {
                      invite(val);
                      genericModel.invitation = sendInvite;
                    },
                    activeColor: Colors.lightBlue,
                    secondary: const Icon(Icons.send),
                  ),

                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child:
                            RaisedButton(
                                onPressed: () {
                                  submit();
                                },
                                child: Text("Add", style: TextStyle(fontSize: 20)),
                                shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(30.0))
                            )
                        ),
                        Container(
                          width: 20,
                        ),
                        Expanded(
                            child:
                            RaisedButton(
                                onPressed: () {
                                  setState(() {
                                    Navigator.of(context).pop();
                                  });
                                },
                                child: Text(
                                    "Cancle", style: TextStyle(fontSize: 20)),
                                shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(30.0))
                            )
                        ),
                      ],
                    ),
                  ) // ButtonUI.init('DRAFT','PUBLISH','CLOSE')


                ],
              ),
            )
        )
    );
  }

  Padding chooseGender() {
    return Padding(
        padding: EdgeInsets.only(left: 50.0),
        child:
        Row(

          children: <Widget>[
            Text("Gender"),
            Container(
              width: 10.0,
            ),
            Text("Male"),
            new Radio(

              value: 1,
              groupValue: groupValue,
              onChanged: (int e) => selectGender(e),
              activeColor: Colors.lightBlue,
            ),
            Text("Female"),

            new Radio(
              value: 2,
              groupValue: groupValue,
              onChanged: (int e) {
                selectGender(e);
                //  genericModel.gender=e.toString();

              },
              activeColor: Colors.lightBlue,
            ),
          ],
        )
    );
  }

  void selectAcadmic(bool select) {
    setState(() {
      if (select) {
        message = "Acadmic";
        val = select;
        print(message);
      }
      else {
        message = "Non-Acadmic";
        val = select;
        print(message);
      }
    });
  }

  void selectGender(int select) {
    setState(() {
      if (select == 1) {
        groupValue = 1;
        genericModel.gender = "male";
      }
      else {
        groupValue = 2;
        genericModel.gender = "female";
      }
    });
  }
  invite(bool select) {
    setState(() {
      if (select) {
        sendInvite = "Invitation-Send";
        inviteVal = select;
        print(inviteVal);
      }
      else {
        sendInvite = "Invite";
        inviteVal = select;
        print(inviteVal);
      }
    });
  }
  saveStatus(int select) {
    setState(() {
      if (select == 1) {
        genericModel.gender = "male";
      }
      else if (select == 2) {
        genericModel.gender = "female";
      }
    });
  }
  bool  isUpdate=false;
  void submit() {
    if (this.formKey.currentState.validate()) {
      this.formKey.currentState.save();
      setState(() {
        isInAsyncCall=true;
      });

      print("First Name : ${genericModel.firstName}");
      print("Last Name : ${genericModel.lastName}");
      print("birthDate : ${genericModel.birthDate}");
      print("Email : ${genericModel.email}");
      print("Contact No : ${genericModel.mobileNumber}");
      print("Invitation: ${genericModel.invitation}");
      print("Acamdic type : ${genericModel.academicType}");
      print("Acamdic type : ${genericModel.gender}");
      TeacherActivity teacherActivity = new TeacherActivity();
      teacherActivity.addorupdate(genericModel, (){
        setState(() {
          isUpdate = true;
          isInAsyncCall = false;
        });
      });
    }
  }
}
