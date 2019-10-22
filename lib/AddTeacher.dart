import 'package:flutter/material.dart';
import 'package:flutter_app/DatePickerDemo.dart';

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
  bool male = false;
  var message =  "Non-Acadmic";
  var val =false;
  var inviteVal=true;
  var sendInvite="Invite";
  DatePickerDemo datePickerDemo= new DatePickerDemo();
  int groupValue;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();

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
             controller: firstNameController,
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
                 border:OutlineInputBorder(
                   borderRadius: BorderRadius.circular(5.0),)
             ),
           )
          ),
            Padding(
              padding: EdgeInsets.all(10.0),
            child:TextFormField(
              controller: lastNameController,
              validator: (value){
                if(value.isEmpty){
                  return 'please Enter value';
                }
              },
              decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: 'Last name',
                  hintText: 'Prof  S.Jadhav6 ',
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),)
              ),
            )

      ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: DatePickerDemo(),
        ),

       Padding(
         padding: EdgeInsets.all(10.0),
         child:  TextField(

           controller: emailController,
           keyboardType: TextInputType.emailAddress,
           decoration: InputDecoration(
               icon:Icon(Icons.email),
             labelText: 'Email-id',
               border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(5.0))
           ),

         ),

       ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child:  TextField(

            keyboardType: TextInputType.numberWithOptions(decimal: true),
           // textInputAction: TextInputAction.next,

            decoration: InputDecoration(
              icon: Icon(Icons.contacts),
                labelText: 'Contact No.',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                )
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
                new Radio(value: 1, groupValue: groupValue, onChanged: (int e)=>selectGender(e),activeColor: Colors.lightBlue,),
                Text("Female"),
                new Radio(value: 2, groupValue: groupValue, onChanged: (int e)=>selectGender(e),activeColor: Colors.lightBlue,),
              ],
            )
        ),
       SwitchListTile(title: Text(message),
          value:val, onChanged:(bool value){selectAcadmic(value);},
          secondary: const Icon(Icons.person),
        ),
        SwitchListTile(title: Text(sendInvite),
          value:inviteVal, onChanged:(bool val){invite(val);},
          activeColor: Colors.lightBlue,
          secondary: const Icon(Icons.person),
        ),
        Padding(
          padding:EdgeInsets.all(10.0),
          child:DropdownButton<String>(),
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
                        cancleForm();
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
  void cancleForm(){
    firstNameController.text='';
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