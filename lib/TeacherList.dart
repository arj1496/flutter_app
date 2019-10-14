import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/TeacherDetail.dart';
import 'package:flutter_app/src/mo/teacher/Teacher.dart';
import 'package:flutter_app/src/mo/teacher/TeacherActivity.dart';

void main()
{
  runApp(MaterialApp(home:TeacherList()));
}
class TeacherList extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    //
    // TODO: implement createState
    return TeacherListState();
  }
}
class TeacherListState extends State<TeacherList>{



  @override
  Widget build(BuildContext context) {
    TeacherActivity teacherActivity =new TeacherActivity();
    List<Teacher> teacherList = teacherActivity.getAllTeacherList();
    return Scaffold(drawer: Drawer(
      child:Text("jyoti") ,// Populate the Drawer in the next step.
    ),
      appBar: AppBar(title:Text("TeacherList")),
       body: ListView.builder(
        itemCount: teacherList.length,
        itemBuilder: (BuildContext ctxt, int index){
          return (teacherListView(ctxt, teacherList[index]));
        }
    ),);
  }
}
Widget teacherListView(BuildContext context, Teachemain.dartr data) {
  return Card(
        child: Wrap(
          children: <Widget>[
            ListTile(
             leading: CircleAvatar(backgroundColor: Colors.indigo,child:Text(data.firstName.substring(0,1))),
              title: Text(data.firstName + data.lastName),
              subtitle: Text(data.role),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TeacherDetail({object : teacherListView(context, data)})),
                );
              },

            ),
          ],
        ),
  );
}
