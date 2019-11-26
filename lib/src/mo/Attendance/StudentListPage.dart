import 'package:flutter/material.dart';
import 'package:flutter_app/src/mo/Attendance/StudentListBloc.dart';
import 'package:flutter_app/src/mo/Student/Student.dart';

class StudentUIList extends StatefulWidget {
  StudentListBloc studentListBloc = new StudentListBloc();
  DateTime selected;
  StudentUIList(DateTime selected) {
    this.studentListBloc;
    this.selected=selected;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StudentUIList();
  }
}

class _StudentUIList extends State<StudentUIList> {
  String msg="A";
  bool pressAttension=false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: Text(widget.selected.toString()),
        actions: <Widget>[
          //Setting Overflow action items using PopupMenuButton
          GestureDetector(
            child: PopupMenuButton(
              //icon: Icon(Icons.menu),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text("Present All"),
                ),
                PopupMenuItem(
                  child: Text("AbsentAll"),
                ),
                PopupMenuItem(
                  child: Text("SortByRollNumber"),
                ),
                PopupMenuItem(
                  child: Text("SortByName"),
                ),
                PopupMenuItem(
                  child: Text("Refresh"),
                ),
              ],
            ),
            onTap: () {},
          )
        ],
      ),
      body: getListOfWidgets(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            Expanded(
                child: RaisedButton(

                    color: Colors.green,
                    child: Text('Save'),
                    onPressed: () {})),
            Expanded(
                child: RaisedButton(
                    color: Colors.white,
                    child: Text('Present'),
                    onPressed: () {})),
            Expanded(
                child: RaisedButton(
                    color: Colors.white,
                    child: Text('Absent'),
                    onPressed: () {})),
            Expanded(
                child: RaisedButton(
                    color: Colors.red, child: Text('cancel'), onPressed: () {}))
          ],
        ),
      ),
    );
  }

  getListOfWidgets() {
    return StreamBuilder<List<Student>>(
      stream: widget.studentListBloc.allStudent,
      initialData: List<Student>(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          List<Student> studentlist = snapshot.data;
          var length;
          return StreamBuilder<List<Student>>(
              stream: widget.studentListBloc.allStudent,
              initialData: List<Student>(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: studentlist.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: new Card(
                         elevation: 2.0,
                          child: new Container(
                           // alignment: Alignment.center,
                           /* margin:
                                new EdgeInsets.only(top: 5.0, bottom: 5.0),*/
                            child: new ListTile(
                              leading: Icon(Icons.person),
                              title: Text(
                                  '${studentlist[index].firstName}\t ${studentlist[index].lastName}',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              trailing: RaisedButton(
                                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  color: Colors.green,
                                  child: Text(
                                    "A",
                                    style: TextStyle(color: Colors.white),
                                  ),

                      onPressed: () {}),
                            ),
                          ),
                        ),
                        /* onTap:(){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>GridMonthStandard()));
                        }*/

                      );
                    },
                  );
                }
              });
        }
      },
    );
  }

  void clicked(BuildContext context, menu) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(menu),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  _changeText() {
    setState(() {
      if (msg.startsWith('A')) {
        msg = '0';
      } else {
        msg = '1';
      }
    });
  }
}
