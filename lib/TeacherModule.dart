import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Subject/AddSubject.dart';
import 'TeacherList.dart';

class TeacherModule extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TeacherModuleState();
  }

}
class TeacherModuleState extends State<TeacherModule>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title:Text("Teacher Module"),
      backgroundColor: Colors.orangeAccent,),
      body: Column(
        children: <Widget>[
          Padding(padding:EdgeInsets.only(left:120.0,top: 50),
          child:
          RaisedButton(
            child: Text("Teacher Module"),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TeacherList()),
              );

            },
          )
    ),
          Padding(padding:EdgeInsets.only(left:120.0,top: 20),
              child:
              RaisedButton(
                child: Text("Subject Module"),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddSubject()),
                  );

                },
              )
          )
        ],
      ),
    );
  }

}

