import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/TeacherDetail.dart';
import 'package:flutter_app/src/mo/Subject/Subject.dart';
import 'package:flutter_app/src/mo/Subject/SubjectActivity.dart';
import 'package:flutter_app/src/mo/teacher/Teacher.dart';
import 'package:flutter_app/src/mo/teacher/TeacherActivity.dart';
import 'AddTeacher.dart';


class TeacherList extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TeacherListState();
  }
}
class TeacherListState extends State<TeacherList>{
  Future<List<Teacher>> getTeacherData() async{
    TeacherActivity teacherActivity = new TeacherActivity();
    List<Teacher> teacherList = await teacherActivity.getJoinDbTeacher();
    return teacherList;
  }
  @override
  Widget build(BuildContext context) {
    var futureBuilder = new FutureBuilder(
        future: getTeacherData(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return _getListViewWithBuilder(context, snapshot);
        }
    );
    return Scaffold(
      drawer: Drawer(
        child:SafeArea(child:
        Column(
          children:<Widget>[
            Container(
              height:200,
                //color: Colors.orangeAccent,
                child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.orange),
              accountName: const Text("username",style: TextStyle(fontSize:18.0)),
              accountEmail: const Text("user@gmail.com",style: TextStyle(fontSize:16.0)),
              currentAccountPicture: new CircleAvatar(backgroundColor: Colors.white,child: Text("jyoti",style: TextStyle(fontSize:20.0),),),
              otherAccountsPictures: <Widget>[
                new CircleAvatar(backgroundColor: Colors.white,child:Text("J"))
              ],
            )
    ),
            new listTileForDrawaer(),
            ListTile(trailing: Icon(Icons.calendar_today),
                title: Text('Todays Teachers birthday'),
                onTap:(){_showDialog(context);}),
            ListTile(trailing: Icon(Icons.search),
                title: Text('Search by Subject'),
                onTap:(){_showDialogSearchSubject(context);}),
            ListTile(trailing: Icon(Icons.search),
                title: Text('Search by Class'),
                onTap:(){_showDialogDropDownClass(context);})

          ]
        )
        )

      ),
      appBar: AppBar(title:Text("TeacherList"),backgroundColor: Colors.orangeAccent,),
       body: futureBuilder,
      floatingActionButton:FloatingActionButton (
        backgroundColor: Colors.orangeAccent,
        child:Icon(Icons.person_add),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTeacher()),
          );
          print("floating button is clicked");
        },
    )
    );
  }
}

Widget _getListViewWithBuilder(BuildContext context, AsyncSnapshot snapshot) {
  List<Teacher> teacherList = snapshot.data;
  return Container(
      child: ListView.builder(
        itemCount: teacherList.length,
        itemBuilder: (BuildContext context, int index) {
          return teacherList != null && teacherList.length > 0 ? ListTileView(context,teacherList[index],) : dataNotFound();
        },
      )
  );
}
Widget ListTileView(context,data){
  return  Card(
      child: Wrap(
          children: <Widget>[
            ExpansionTile(
                leading: GestureDetector(
                  onTap: (){
                   Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => TeacherDetail(data),
                        ));
                  },
                  child: CircleAvatar(backgroundColor: Colors.indigo,child:Text(data.firstName.substring(0,1).toUpperCase())),
                ),
                title: Text(data.firstName +" " +data.lastName,overflow: TextOverflow.ellipsis),
                children:<Widget>[
                  subjectList(),
                ]
            ),
          ]
      )
  );

}

dataNotFound() {
}

class listTileForDrawaer extends StatelessWidget {
  const listTileForDrawaer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(trailing: Icon(Icons.flight),
        title: Text('Todays Leave'),
    onTap:(){_showDialog(context);});
  }
}
/*Widget teacherListView(BuildContext context, Teacher data) {
  return Card(
        child: Wrap(
          children: <Widget>[
            ExpansionTile(
             leading: GestureDetector(
               onTap: (){
                Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (BuildContext context) => TeacherDetail(data),
                     ));
               },
               child: CircleAvatar(backgroundColor: Colors.indigo,child:Text(data.firstName.substring(0,1))),
             ),
              title: Text(data.firstName +" " +data.lastName,overflow: TextOverflow.ellipsis),
              children:<Widget>[
                subjectList(),
              ]
                ),
              ]
              )
  );
}*/
Widget subjectList() {
  SubjectActivity subjectActivity = new SubjectActivity();
  List<Subject> subjectList = subjectActivity.getHardCodedSubjectList();
  return Container(
   height: 300,
   // color: Colors.white,
    child:  ListView.builder(
        itemCount: subjectList.length,
        itemBuilder: (BuildContext ctxt, int index){
          return ListTile(title:Padding(padding: EdgeInsets.only(left: 2.0),
              child: Text(subjectList[index].standard.name)),
          trailing:Padding(padding: EdgeInsets.only(right: 30.0),
          child: Text(subjectList[index].name)),
          );
        }
    ),
  );
}
void _showDialog(BuildContext context){
  showDialog(
    context: context,builder: (BuildContext context){
      return AlertDialog(title: Text("List of Teachers"),
      actions: <Widget>[
        FlatButton(child: new  Text("close"),
        onPressed: (){
          Navigator.of(context).pop();
        },)
      ],);
  }
  );
}
void _showDialogSearchSubject(BuildContext context){
  showDialog(
      context: context,builder: (BuildContext context){
    return AlertDialog(title: Text("Search by Subject"),
      content:TextField(),
      actions: <Widget>[

        FlatButton(child: new  Text("close"),
          onPressed: (){
            Navigator.of(context).pop();
          },),
        FlatButton(child: new  Text("ok"),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TeacherList()),
            );

          },)
      ],);
  }
  );
}
void _showDialogDropDownClass(BuildContext context){
  showDialog(
      context: context,builder: (BuildContext context){
    return AlertDialog(title: Text("Search by Subject"),
      content: DropdownButton<String>(
        items:[
          DropdownMenuItem(
            child: Text("subject"),
          )
        ]
      ),
      actions: <Widget>[
        FlatButton(child: new  Text("close"),
          onPressed: (){
            Navigator.of(context).pop();
          },),
        FlatButton(child: new  Text("ok"),
          onPressed: (){

          },)
      ],);
  }
  );
}

