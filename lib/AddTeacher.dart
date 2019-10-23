import 'package:flutter/material.dart';
import 'package:flutter_app/DatePickerDemo.dart';
import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';

import 'ButtonUI.dart';

class AddTeacher extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddTeacherState();
  }
}
class AddTeacherState extends State<AddTeacher>{
  var formKey= GlobalKey<FormState>();
  GenericModel genericModel = new GenericModel();
  bool male = false;
  var message =  "Non-Acadmic";
  var val =false;
  var inviteVal=true;
  var sendInvite="Invite";
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
      body:Form(
        key: formKey,
      child:ListView(
      children: <Widget>[
        Padding(
        padding:EdgeInsets.all(10.0),
           child: TextFormField(
             focusNode: _firstInputFocusNode,
             textInputAction: TextInputAction.next,
            // decoration: InputDecoration(hintText: "First Text Field"),
             onEditingComplete: () =>
                 FocusScope.of(context).requestFocus(_lastInputFocusNode),
             onSaved: (val) =>  genericModel.firstName = val ,
             autovalidate: true,
             validator:(value){
               if(value.isEmpty)
                 {
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
            child:TextFormField(
              textInputAction: TextInputAction.next,
              focusNode: _lastInputFocusNode,
             // decoration: InputDecoration(hintText: "Second Text Field"),
              onEditingComplete: () =>
                  FocusScope.of(context).requestFocus(_emailInputFocusNode),

              onSaved: (val) =>  genericModel.lastName = val ,
              validator: (value){
                if(value.isEmpty){
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
          padding: EdgeInsets.only(left:10.0,right:10.0),
          child: Text("date Picker"),
        ),

       Padding(
         padding: EdgeInsets.all(10.0),
         child:  TextFormField(
           textInputAction: TextInputAction.next,
           focusNode: _emailInputFocusNode,
           // decoration: InputDecoration(hintText: "Second Text Field"),
           onEditingComplete: () =>
               FocusScope.of(context).requestFocus(_mobileInputFocusNode),

           keyboardType: TextInputType.emailAddress,
           decoration: InputDecoration(
               icon:Icon(Icons.email),
             labelText: 'Email-id',
           ),
           onSaved: (val) =>  genericModel.email = val ,

         ),

       ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child:  TextFormField(
            textInputAction: TextInputAction.next,
            focusNode: _mobileInputFocusNode,
            // decoration: InputDecoration(hintText: "Second Text Field"),
            onEditingComplete: () =>
                FocusScope.of(context).requestFocus(_genderInputFocusNode),


            onSaved: (val) {
              String test = val;
              return genericModel.contactNo = int.parse(test);
            },
            keyboardType: TextInputType.numberWithOptions(decimal: true),
           // textInputAction: TextInputAction.next,

            decoration: InputDecoration(
              icon: Icon(Icons.contacts),
                labelText: 'Contact No.',

            ),
          ),
        ),

        Padding(
            padding: EdgeInsets.only(left:50.0),
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
                  onChanged: (int e)=>selectGender(e),
                  activeColor: Colors.lightBlue,
                ),
                Text("Female"),
                new Radio(value: 2,
                  groupValue: groupValue,
                  onChanged: (int e)=>selectGender(e),
                  activeColor: Colors.lightBlue,
                ),
              ],
            )
        ),
       SwitchListTile(title: Text(message),
          value:val,
         onChanged:(bool value){selectAcadmic(value);
         genericModel.academicType=message;
          },
          secondary: const Icon(Icons.person),
        ),
        SwitchListTile(title: Text(sendInvite),
          value:inviteVal,
          onChanged:(bool val){invite(val);
          genericModel.invitation=sendInvite;
          },
          activeColor: Colors.lightBlue,
          secondary: const Icon(Icons.person),
        ),

        Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child:
              RaisedButton(
                onPressed: (){
                  setState(() {
                  if(formKey.currentState.validate()){
                    formKey.currentState.save();
                    print("First Name : ${genericModel.firstName}");
                    print("Last Name : ${genericModel.lastName}");
                    print("Email : ${genericModel.email}");
                    print("Contact No : ${genericModel.contactNo}");
                    print("Invitation: ${genericModel.invitation}");
                    print("Acamdic type : ${genericModel.academicType}");

                  }

                });
                },
                child: Text("Add",style: TextStyle(fontSize: 20)),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
              )
              ),
              Container(
                width: 20,
              ),
              Expanded(
                  child:
                  RaisedButton(
                    onPressed: (){
                      setState(() {
                      });
                    },
                    child: Text("Cancle", style: TextStyle(fontSize: 20)),
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                  )
              ),
            ],
          ),
        )// ButtonUI.init('DRAFT','PUBLISH','CLOSE')


    ],
      ),
      )
    );

  }
  void selectAcadmic(bool select){
    setState(() {
      if(select){
        message ="Acadmic";
        val= select;
        print(message);

      }
      else{
        message="Non-Acadmic";
        val= select;
        print(message);

      }

    });

  }
 void selectGender(int select)
  {
    setState(() {
      if(select==1)
      {
        groupValue=1;
      }
      else{
        groupValue=2;
      }
    });
  }
 invite(bool select){
    setState(() {
      if(select){
        sendInvite="Invitation-Send";
        inviteVal= select;
        print(sendInvite);
      }
      else{

       sendInvite="Invite";
        inviteVal= select;
        print(sendInvite);
      }
    });

  }
}