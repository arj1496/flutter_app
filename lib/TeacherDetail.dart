import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/TeacherEditPage.dart';
import 'package:flutter_app/src/mo/Subject/Subject.dart';
import 'package:flutter_app/src/mo/Subject/SubjectActivity.dart';
import 'package:flutter_app/src/mo/teacher/Teacher.dart';

import 'AddTeacher.dart';
import 'Contacts.dart';
import 'TeacherList.dart';

class TeacherDetail extends StatefulWidget{
  Teacher teacher;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TeacherDetailState.init(teacher);
  }
  TeacherDetail(Teacher teacher){
    this.teacher = teacher;
  }
}
class TeacherDetailState extends State<TeacherDetail> {
  Teacher teacher;
  TeacherList teacherList;
  List<Contacts> contactList;
  List<Subject> subjectList;
  TeacherDetailState.init(Teacher teacher) {
    this.teacher = teacher;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body:SafeArea(
      child:CustomScrollView(
         slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.orangeAccent[400],
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle:true,
                background:Padding(
                  padding:EdgeInsets.all(60),
                  child: CircleAvatar(backgroundColor:Colors.white,child: Text(teacher.firstName.substring(0,1).toUpperCase(),style: TextStyle(fontSize: 40),),),
                ),
                 //CircleAvatar(backgroundColor:Colors.white,child: Text(teacher.firstName.substring(0,1),style: TextStyle(fontSize: 50.0),),),
                /*Image.network(
                  "https://ollari.com/wp-content/uploads/2015/06/teammember-5.jpg",
                  fit: BoxFit.cover,),*/
                title: Text(teacher.firstName +" "+ teacher.lastName),
              ),),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("contacts",style: TextStyle(fontSize: 20.0),),
                        )
                      ],
                    ),
                    ListTile(
                      leading:Icon(Icons.phone),
                     title: Text(teacher.mobileNumber),
                      subtitle:Text("mobile no"),
                      trailing: Icon(Icons.message),
                    ),
                    ListTile(
                      leading:Icon(Icons.email),
                      title: Text(teacher.email),
                      subtitle:Text("Email id"),
                      trailing: Icon(Icons.message),
                    )
                  ],

                ),
              ),
              Container(
                child:Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child:  Text(
                            "SubjectList",style: TextStyle(fontSize: 20.0),),
                        ),
                      ],
                    ),
                    Container(
                      child:Column(
                        children: <Widget>[
                          subjectList1()
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
              padding:EdgeInsets.only(left:60,right: 60),
                child:RaisedButton(

                  child: Text("Edit"),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TeacherEditPage(teacher)),
                    );
                  },
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                )
              )

            ],
          ),
        )
             // child: _buildExpandableContent(contactList),

              ]  )
    )
    );
  }

}
Widget subjectList1()
{
  SubjectActivity subjectActivity = new SubjectActivity();
  List<Subject> subjectList = subjectActivity.getHardCodedSubjectList();
  return Container(

    height: 400,

    child:  ListView.builder(
        itemCount: subjectList.length,
        itemBuilder: (BuildContext ctxt, int index){
          return ListTile(
            title:Padding(padding: EdgeInsets.only(left: 10.0),
            child:  Text(subjectList[index].name),),
            trailing:Padding(padding: EdgeInsets.only(right: 30.0),
              child: Text(subjectList[index].standard.name))
          );
        }
    ),
  );
}







