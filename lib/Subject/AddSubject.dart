import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/TeacherDropDown.dart';
import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:flutter_app/src/mo/teacher/Teacher.dart';
import 'package:flutter_app/src/mo/teacher/TeacherActivity.dart';

import '../standardDropDown.dart';



class AddSubject  extends StatefulWidget{
  GenericModel genericModel=new GenericModel();
  GlobalKey<FormState> formKey;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddSubjectState();
  }

}
class AddSubjectState extends State<AddSubject>{
  List<Teacher> teacherList  = new List<Teacher>();

  int currentTeacher;
  Future<List<Teacher>> getTeacherData() async{
   TeacherActivity teacherActivity = new TeacherActivity();
   teacherList = await teacherActivity.getJoinDbTeacher();
    return teacherList;
  }

  //String currentTeacher="Abc";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.orangeAccent,title: Text("Add Subject",textAlign: TextAlign.center,),),
        body: Form(
          child: ListView(
            children: <Widget>[
             /* Padding(
                padding:EdgeInsets.only(left:50.0,right: 10.0),
                child: DropdownButton<String>(
                  items:teacherList.map((String dropDownStringItem){
                    return DropdownMenuItem<String>(

                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  onChanged: (String newSubjectSelected){
                    _dropDownTeacher(newSubjectSelected);

                  },
                  hint: Text('Select Teacher'),
                ),
              ),*/

             Padding(
               padding: EdgeInsets.all(10.0),
               child: StandardDropDown(widget.formKey,widget.genericModel),
             ),
              TeacherDropDown(widget.formKey,widget.genericModel),
              Padding(
                  padding:EdgeInsets.all(10.0),
                  child: subjectName()
              ),
              Padding(
                  padding:EdgeInsets.only(left:10.0,right:10.0),
                  child: subjectShortName()
              ),
              Padding(
                  padding:EdgeInsets.all(10.0),
                  child: subjectCode()
              ),

              Padding(
                padding: const EdgeInsets.only(left:50.0,right: 10.0,top: 10.0),
                child: DropdownButton<int>(
                  items: teacherList.map((Teacher dropDownStringItem){
                    return DropdownMenuItem<int>(
                      value: dropDownStringItem.id,
                      child: Text(dropDownStringItem.firstName + dropDownStringItem.lastName),
                    );
                  }).toList(),
                  onChanged: (int newSubjectSelected){
                    _dropDownItemSelected(newSubjectSelected);

                  },
                  value:currentTeacher,
                  hint: Text('Select Teacher'),
                ),
              ),
              Padding(
                  padding:EdgeInsets.all(10.0),
                  child: teachingHours()
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: buttons(),
              ),



        /// // ButtonUI.init('
            ],
          )

        ),
      ),
    );
  }

  Row buttons() {
    return Row(
                children: <Widget>[
                  Expanded(
                      child:
                      RaisedButton(
                          onPressed: (){
                            setState(() {
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
              );
  }

  TextFormField subjectName() {
    return TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Subject Name',
                    hintText: 'subject name',
                    icon: Icon(Icons.book),
                  ),
                );
  }
  TextFormField subjectShortName() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Subject Short Name',
        hintText: 'subject short name',
        icon: Icon(Icons.book),
      ),
    );
  }
  TextFormField subjectCode() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Subject Code',
        hintText: 'subject Code',
        icon: Icon(Icons.book),
      ),
    );
  }
  TextFormField teachingHours() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Teaching Hours',
        hintText: 'Teaching Hours',
        icon: Icon(Icons.access_time),
      ),
    );
  }

  void _dropDownItemSelected(int newSelectedTeacher) {
    setState(() {
      this.currentTeacher= newSelectedTeacher;
    });
  }
 /* void _dropDownTeacher(String newSelectedTeacher) {
    setState(() {
      this.currentTeacher= newSelectedTeacher;
    });
  }*/
}

