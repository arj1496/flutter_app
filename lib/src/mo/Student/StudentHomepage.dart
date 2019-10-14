import 'package:flutter/material.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_app/src/mo/Student/Student.dart';
import 'StudentService.dart';

class StudentHomePage extends StatefulWidget {
  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  List<Student> studentList = null;

  @override
  Widget build(BuildContext context) {
    return appBar();
  }

  appBar() {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Students'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.sync),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
      body: getListViewBuilder(context),
    );
  }

  Widget getListViewBuilder(BuildContext context) {
    StudentService ss = StudentService();
    studentList = ss.getStudentsForTest();
    return Container(
      color: AppTheme.background,
      child: ListView.builder(
          itemCount: studentList != null ? studentList.length : 0,
          itemBuilder: (BuildContext ctxt, int Index) {
            return studentList != null && studentList.length > 0
                ? _listTileViewStudents2(studentList[Index])
                : _listNotFound();
          }),
    );
  }

  _listTileViewStudents2(Student student) {
    return GestureDetector(
      onTap: () {
        // showEventDetail(data);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
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
          child: ListTile(
            leading: _icon(student),
            title: _studentFullName(student),
            subtitle: _details(student),
          ),
        ),
      ),
    );
  }

  Widget _icon(Student student) {
    return CircleAvatar(
      backgroundColor: Colors.blueAccent,
      child: Text(student.firstName.substring(0, 1)),
    );
  }

  Widget _studentFullName(Student student) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 1, top: 5),
        ),
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
                    student.firstName + " " + student.lastName,
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
    );
  }

  Widget _details(Student student) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 8, bottom: 8),
          child: Container(
            height: 2,
            decoration: BoxDecoration(
              color: AppTheme.background,
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 8),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      student.standard.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: AppTheme.robotoFontName,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        letterSpacing: -0.2,
                        color: AppTheme.darkText,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        'Standard',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: AppTheme.robotoFontName,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: AppTheme.grey.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          student.rollNo,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: AppTheme.robotoFontName,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            letterSpacing: -0.2,
                            color: AppTheme.darkText,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            'Roll Number',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: AppTheme.robotoFontName,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: AppTheme.grey.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              //'02 Oct 2019',
                              student.studentId,
                              //data.startDate.toString(),

                              style: TextStyle(
                                fontFamily: AppTheme.robotoFontName,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                letterSpacing: -0.2,
                                color: AppTheme.darkText,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Text(
                                'Student Id',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: AppTheme.robotoFontName,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: AppTheme.grey.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ]),
                    ]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/*
Widget _listTileViewStudents(Student student) {
    return ListTile(
      leading: Icon(Icons.person),
      title: _listTileViewStudents1(student),
    );
  }

  Widget _listTileViewStudents1(Student data) {
    return GestureDetector(
      onTap: (){
       // showEventDetail(data);
      },
      child: Padding(
        padding: const EdgeInsets.only(
            left: 10, right: 10, top: 3, bottom: 3
        ),
        // This is the Main Table Container
        child: Container(
          // given Box Shadow to the Container
          decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
                topRight: Radius.circular(8.0)
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: AppTheme.grey.withOpacity(0.2),
                  offset: Offset(1.1, 1.1),
                  blurRadius: 10.0
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                const EdgeInsets.only(top: 5, left: 5, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 4, bottom: 1,top: 5),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 4, bottom: 3
                              ),
                              child: Text(
                                //'Gandhi Jayanti Gandhi Jayanti',
                                data.firstName + " " + data.lastName,
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
              // this Padding is Used to render the Horizontal line Starts
              Padding(
                padding: const EdgeInsets.only(
                    left: 5, right: 5, top: 8, bottom: 8
                ),
                child: Container(
                  height: 2,
                  decoration: BoxDecoration(
                    color: AppTheme.background,
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                ),
              ),
              // this Padding is Used to render the Horizontal line Ends

              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 3, bottom: 8
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            //'Fastival',
                            data.standard.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: AppTheme.robotoFontName,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              letterSpacing: -0.2,
                              color: AppTheme.darkText,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              'Standard',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: AppTheme.robotoFontName,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: AppTheme.grey.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                data.rollNo,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: AppTheme.robotoFontName,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  letterSpacing: -0.2,
                                  color: AppTheme.darkText,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Text(
                                  'Roll Number',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: AppTheme.robotoFontName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: AppTheme.grey
                                        .withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,

                            children: <Widget>[
                              Text(
                                //'02 Oct 2019',
                                data.studentId,
                                //data.startDate.toString(),

                                style: TextStyle(
                                  fontFamily: AppTheme.robotoFontName,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  letterSpacing: -0.2,
                                  color: AppTheme.darkText,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Text(
                                  'Student Id',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: AppTheme.robotoFontName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: AppTheme.grey.withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

*/

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
