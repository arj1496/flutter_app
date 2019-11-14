import 'package:flutter/material.dart';
import 'package:flutter_app/src/mo/Student/Student.dart';
import 'package:flutter_app/src/mo/Subject/Subject.dart';
import 'package:flutter_app/src/mo/Subject/SubjectActivity.dart';
import 'package:flutter_app/src/mo/teacher/Teacher.dart';

import '../AppTheme.dart';
import 'AddSubject.dart';

class SubjectList extends StatefulWidget {
  @override
  _SubjectListState createState() => _SubjectListState();
}

class _SubjectListState extends State<SubjectList> {


  @override
  Widget build(BuildContext context) {
    SubjectActivity subjectActivity = new SubjectActivity();
    Future<List<Subject>> subjectList = subjectActivity.getSubjectListFromLocalDB();
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
                      isAddFlag: false,
                    )
                ),
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
                ? _listTileViewSubjects(subjectList[Index])
                : _listNotFound();
          }),
    );
  }

  _listTileViewSubjects(Subject subject) {
    return GestureDetector(
      onTap: () {
        print("hello");
        createAlertDialogBox(context, subject);
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
          child: _listtile(subject),
        ),
      ),
    );
  }

  Widget _listtile(Subject subject) {
    return ListTile(
      title: _subjectName(subject),
      subtitle: _className(subject),
      trailing: _icon(subject),
    );
  }

  Widget _subjectName(Subject subject) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 1, top: 5),
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
        padding: const EdgeInsets.only(right: 2.0),
        child: Container(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  print("Optional");
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 2.0),
                  child: Center(
                    child: subject.isOptional != 0
                          ? Icon(Icons.person)
                          : Container(),
                  ),
                ),
              ),
              GestureDetector(
                  onTap: (){
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
    String subjectName = subject.name;

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(" ${subjectName}"),
            /* content: Container(
              child: getDisplayForm(student),
            ),
            actions: <Widget>[
              _isEditBtn
                  ? MaterialButton(
                  child: Text("Edit"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => AddStudent(
                              object: student,
                              onCallBack: () {
                                print('hey done');
                              },
                              isUpdateFlag: true)
                        */ /*getStudentEditForm(
                              object: student,
                              onCustCallBack: (){
                                print('hey done');
                              }
                          )*/ /*
                      ),
                    );
                  })
                  : null,*/
            /* MaterialButton(
                  child: Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],*/
          );
        });
  }
}
