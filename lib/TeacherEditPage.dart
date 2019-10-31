import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/onlyDate.dart';
import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:flutter_app/src/mo/Exam/ExamActivity.dart';
import 'package:flutter_app/src/mo/teacher/Teacher.dart';
import 'package:flutter_app/src/mo/teacher/TeacherActivity.dart';
import 'package:http/http.dart';
import 'Gender.dart';

class TeacherEditPage extends StatefulWidget{

  Teacher teacher = new Teacher();
  TeacherEditPage(Teacher teacher){
    this.teacher = teacher;
    var academicStatus=  teacher.academicType;
  }
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TeacherEditState();
  }
}
class TeacherEditState extends State<TeacherEditPage>{
  GenericModel genericModel = new GenericModel();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TeacherActivity teacherActivity = new TeacherActivity();
  var message =  "Non-Acadmic";
  var sendInvite="Invite";
  var val =false;
  int groupValue;
  var inviteVal=true;
  VoidCallback onCustomCallBack;
  @override
  Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(title:Text("Edit Teacher Details"),backgroundColor: Colors.orangeAccent,),
         body: SingleChildScrollView(
           child:  Form(
             key: _formKey,
             autovalidate: true,
             child: Column(
               /*padding: const EdgeInsets.symmetric(horizontal: 16),*/
               children:getTeacherFields(),
             ),
           ),
         ),
       );
     }
  getFormTextField(Icon icon , hintText, labelText,paramenter,initialvalue) {

    return TextFormField(
      onSaved: (val) =>  genericModel.firstName = val,

      autovalidate: true,
      initialValue: initialvalue,
      decoration: InputDecoration(
          icon: icon,
          hintText: hintText,
          labelText: labelText
      ),

    );
  }
  getFormTextLastName(Icon icon , hintText, labelText,paramenter,initialvalue) {

    return TextFormField(
      onSaved: (val) => genericModel.lastName = val,

      autovalidate: true,
      initialValue: initialvalue,
      decoration: InputDecoration(
          icon: icon,
          hintText: hintText,
          labelText: labelText
      ),

    );
  }
  getFormTextMail(Icon icon , hintText, labelText,paramenter,initialvalue) {

    return TextFormField(
      onSaved: (val) => genericModel.email = val,

      autovalidate: true,
      initialValue: initialvalue,
      decoration: InputDecoration(
          icon: icon,
          hintText: hintText,
          labelText: labelText
      ),

    );
  }
  getFormTextMobile(Icon icon , hintText, labelText,paramenter,initialvalue) {

    return TextFormField(
      onSaved: (val) =>genericModel.mobileNumber = val,
      autovalidate: true,
      initialValue: initialvalue,
      decoration: InputDecoration(
          icon: icon,
          hintText: hintText,
          labelText: labelText
      ),

    );
  }
  Padding chooseGender() {
    return Padding(
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

            new Radio(
              value: 2,
              groupValue: groupValue,
              onChanged: (int e){
                selectGender(e);
                //  genericModel.gender=e.toString();
              },
              activeColor: Colors.lightBlue,
            ),
          ],
        )
    );
  }


  getTeacherFields(){

  List<Widget>teacherFields=[
    Padding(
      padding: EdgeInsets.only(left: 10,right: 10),
      child:  getFormTextField(Icon(Icons.person), 'Enter Teacher name', 'LastName','title',widget.teacher.firstName),
    ),
    Padding(
      padding: EdgeInsets.only(left: 10,right: 10),
        child:  getFormTextLastName(Icon(Icons.person), 'Enter Teacher LastName', 'LastName','title',widget.teacher.lastName),
    ),
    Padding(
      padding: EdgeInsets.only(left: 10,right: 10),
      child:DatePicker(Icon(Icons.cake),"BirthDate"),
    ),
    Padding(
      padding: EdgeInsets.only(left: 10,right: 10),
      child: getFormTextMail(Icon(Icons.alternate_email), 'Enter Teacher Email', 'mail-id','title',widget.teacher.email),
    ),
    Padding(
      padding: EdgeInsets.only(left: 10,right: 10),
      child: getFormTextMobile(Icon(Icons.phone), 'Enter Mobile no', 'Mobile','title',widget.teacher.mobileNumber),
    ),
    Padding(
      padding: EdgeInsets.only(left: 10,right: 10),
      child: chooseGender()
    ),
    SwitchListTile(title: Text(message),
      value:val,

      onChanged:(bool value){selectAcadmic(value);
      genericModel.academicType=  value ? value :int.parse("0");
      },
      secondary: const Icon(Icons.school),
    ),
    SwitchListTile(title: Text(sendInvite),
      value:inviteVal,
      onChanged:(bool val){invite(val);
      genericModel.invitation=sendInvite;
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
                  onPressed: (){
                    setState(() {
                      if(_formKey.currentState.validate()){
                        _formKey.currentState.save();
                        print("Teacher Id : ${genericModel.teacherId}");
                        print("First Name : ${genericModel.firstName}");
                        print("Last Name : ${genericModel.lastName}");
                        print("Email : ${genericModel.email}");
                        print("Contact No : ${genericModel.mobileNumber}");
                        print("Invitation: ${genericModel.invitation}");
                        print("Acamdic type : ${genericModel.academicType}");
                        print("gender : ${genericModel.gender}");
                        TeacherActivity teacherActivity= new TeacherActivity();
                        teacherActivity.addorupdate(genericModel,(){

                        });
                      }
                    });
                  },
                  child: Text("Save",style: TextStyle(fontSize: 20)),
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
                  child: Text("Cancel", style: TextStyle(fontSize: 20)),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
              )
          ),
        ],
      ),
    )//


    //getFormTextMobile(Icon(Icons.phone), 'Enter Mobile no', 'Mobile','title',widget.teacher.mobile),
   // getGenderField(Icon(Icons.person), 'Enter Teacher name', 'Title','title',widget.teacher.firstName),
   // getAcademicTypeField(Icon(Icons.person), 'Enter Teacher name', 'Title','title',widget.teacher.firstName),
    //getInvitationField()

  ];
  return teacherFields;
  }
  getGenderField(Icon icon, String s, String t, String u, String firstName) {
  }

  getAcademicTypeField(Icon icon, String s, String t, String u, String firstName) {
  }

  void selectGender(int select)
  {
    setState(() {
      if(select==1)
      {
        groupValue=1;
        genericModel.gender='1';
      }
      else{
        groupValue=2;
        genericModel.gender="2";
      }
    });
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
  invite(bool select){
    setState(() {
      if(select){
        sendInvite="Invitation-Send";
        inviteVal= select;
        print(inviteVal);
      }
      else{

        sendInvite="Invite";
        inviteVal= select;
        print(inviteVal);
      }
    });

  }
}

