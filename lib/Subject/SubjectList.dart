import 'package:flutter/material.dart';
import 'package:flutter_app/TeacherDropDown.dart';
import 'package:flutter_app/src/mo/HomeWork/SubjectPopup.dart';
import 'package:flutter_app/src/mo/Student/StudentDao.dart';
import 'package:flutter_app/src/mo/Subject/Subject.dart';
import 'package:flutter_app/src/mo/Subject/SubjectActivity.dart';
import 'package:flutter_app/src/mo/Subject/SubjectService.dart';
import 'package:flutter_app/src/mo/teacher/Teacher.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../AppTheme.dart';
import 'AddSubject.dart';

class SubjectList extends StatefulWidget {
  @override
  _SubjectListState createState() => _SubjectListState();
}

class _SubjectListState extends State<SubjectList> {
  bool _isUpdateBtn = true;
  bool _isEditBtn = true;
  bool _isInAsyncCall = false;
  bool sort;
  Future<List<Subject>> subjectList;


  @override
  void initState() {
    sort = false;
    SubjectActivity subjectActivity = new SubjectActivity();
    subjectList = subjectActivity.getSubjectListFromLocalDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var futureBuilder = new FutureBuilder(
        future: subjectList,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return _getListViewWithBuilder(context, snapshot);
        });

    return Scaffold(
      appBar: new AppBar(
        title: Text('Subject List'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.sync),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => AddSubject(
                          object: new Subject(),
                          onCallBack: () {
                            print('hey done on add Subject');
                          },
                          isUpdateFlag: false,
                        )),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
      body: futureBuilder,
    );
  }

  Widget _getListViewWithBuilder(BuildContext context, AsyncSnapshot snapshot) {
    List<Subject> subjectList = snapshot.data;
    return Container(
      color: AppTheme.background,
      child: ListView.builder(
          itemCount: subjectList != null ? subjectList.length : 0,
          itemBuilder: (BuildContext ctxt, int Index) {
            return subjectList != null && subjectList.length > 0
                ? _expansionTileViewSubjects(subjectList[Index])
                : _listNotFound();
          }),
    );
  }

  _expansionTileViewSubjects(Subject subject) {
    return GestureDetector(
      onTap: () {
        print("hello");
        // createAlertDialogBox(context, subject);
      },
      child: Padding(
        padding:
            const EdgeInsets.only(left: 5.0, right: 5.0, top: 3, bottom: 3),
        // This is the Main Table Container
        child: Container(
          // given Box Shadow to the Container
          decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
                topRight: Radius.circular(8.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: AppTheme.grey.withOpacity(0.2),
                  offset: Offset(1.1, 1.1),
                  blurRadius: 10.0),
            ],
          ),
          child: _expansiontile(subject),
        ),
      ),
    );
  }

  Widget _expansiontile(Subject subject) {
    String subjectName = subject.name;
    List<Teacher> teacherList = subject.teacherList;
    return ExpansionTile(
      //ListTile(
      title: _subjectName(subject),
      //subtitle: _className(subject),
      trailing: _icon(subject),
      children: <Widget>[
        Column(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: teacherList != null
              ? DataTable(
                sortAscending: sort,
                sortColumnIndex: 0,
                columns: <DataColumn>[
                  DataColumn(
                      label: Text('Teacher Name'),
                      onSort: (columnIndex, ascending) {
                        setState(() {
                          sort = !sort;
                        });
                        onSortColumn(columnIndex, ascending, teacherList);
                      }),
                  /*DataColumn(label: Text('Subject Name')),*/
                  DataColumn(
                      label: Text('Teaching Hours'),
                    onSort:(columnIndex, ascending) {
                        setState(() {
                      sort = !sort;
                    });
                        onSortHours(columnIndex, ascending);
                    }),
                ],
                rows:getDataRow(teacherList,),
              )
              : Container(
                height: 30.0,
                  child: Text("Assign Teacher Not Available",
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _subjectName(Subject subject) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 0, bottom: 1, top: 5),
              ),
              //child:
              Text(
                subject.name,
                //student.firstName + " " + student.lastName,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: AppTheme.robotoFontName,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: AppTheme.nearlyDarkBlue,
                ),
              ),
            ],
          ),
          _className(subject),
        ],
      ),
    );
  }

  Widget _className(Subject subject) {
    return Row(
      children: <Widget>[
        Text(
          subject.standard != null ? subject.standard.name : "Class - 1",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: AppTheme.robotoFontName,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            letterSpacing: -0.2,
            color: AppTheme.darkText,
          ),
        )
      ],
    );
  }

  Widget _icon(Subject subject) {
    return Padding(
        padding: const EdgeInsets.only(right: 1.0),
        child: Container(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  print("Optional");
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 30.0),
                  child: Center(
                    child: subject.isOptional != 0
                        ? Icon(Icons.person)
                        : Container(),
                  ),
                ),
              ),
              GestureDetector(
                  onTap: () {
                    print("Syllabus");
                  },
                  child: Icon(Icons.format_indent_increase)),
            ],
          ),
        ));
  }

  Widget _listNotFound() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
              topRight: Radius.circular(8.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: AppTheme.grey.withOpacity(0.2),
                offset: Offset(1.1, 1.1),
                blurRadius: 10.0),
          ],
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 5, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 4, bottom: 3),
                            child: Text(
                              'Event Not Found',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: AppTheme.robotoFontName,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: AppTheme.nearlyDarkBlue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> createAlertDialogBox(BuildContext context, Subject subject) {
    setState(() {
      _isEditBtn = true;
    });
    String subjectName = subject.name;

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(" ${subjectName}"),
            content: Container(
              child: getDisplayForm(subject),
            ),
            actions: <Widget>[
              _isEditBtn
                  ? MaterialButton(
                      child: Text("Edit"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => AddSubject(
                                  object: subject,
                                  onCallBack: () {
                                    print('hey done');
                                  },
                                  isUpdateFlag: true)),
                        );
                      })
                  : null,
              MaterialButton(
                  child: Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }

  getDisplayForm(Subject subject) {
    List<Teacher> teacherList = subject.teacherList;

    return ModalProgressHUD(
      inAsyncCall: _isInAsyncCall,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          height: 100,
          width: 250,
          padding: EdgeInsets.only(top: 10.0, right: 2.0, left: 20.0),
          alignment: Alignment.topLeft,
          child: teacherList != null
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: teacherList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(Icons.person),
                      title: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          text: teacherList[index].firstName != " " &&
                                  teacherList[index].lastName != " "
                              ? teacherList[index].firstName +
                                  ' ' +
                                  teacherList[index].lastName
                              : " ",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Text("Assign Teachers Not Available"),
        ),
      ),
    );
  }

  List<DataRow> getDataRow(
    List<Teacher> teacherList,
    /*String subjectName*/
  ) {
    List<DataRow> data = new List<DataRow>();
    for (int i = 0; i < teacherList.length; i++) {
      var teacherlist = teacherList[i];
      DataRow dr = new DataRow(
        cells: <DataCell>[
          DataCell(
            Text(teacherList[i].firstName + ' ' + teacherList[i].lastName),
            /*onTap: ,
              placeholder: ,*/
          ),
          /* DataCell(
            Text(subjectName),
            */ /*onTap: ,
              placeholder: ,
              showEditIcon: ,*/ /*
          ),*/
          DataCell(
            Text("20hrs"),
            /*onTap: ,
              placeholder: ,
              showEditIcon: ,*/
          ),
        ],
      );
      data.add(dr);
    }
    return data;
  }

  onSortColumn(int columnIndex, bool ascending, List<Teacher> teacherList1) {
    try{
      if (columnIndex == 0) {
        if (ascending) {
          teacherList1.sort((a, b){
            return '${a.firstName} ${a.lastName}'.compareTo('${b.firstName} ${b.lastName}');
          });
          //teacherList.sort((a, b) => '${a.firstName} ${a.lastName}'.compareTo('${b.firstName} ${b.lastName}'));
        } else {
          teacherList1.sort((a, b){
            return '${b.firstName} ${b.lastName}'.compareTo('${a.firstName} ${a.lastName}');
          });
          //teacherList.sort((a, b) => '${b.firstName} ${b.lastName}'.compareTo('${a.firstName} ${a.lastName}'));
        }
      }
    }catch(e){
      e.toString();
    }
  }

   onSortHours(int columnIndex, bool ascending) {
    if(columnIndex == 0){
      if(ascending){

      }else{

      }
    }
   }
}
