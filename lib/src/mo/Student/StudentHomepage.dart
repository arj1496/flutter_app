import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/src/mo/Student/Student.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'StudentService.dart';

class StudentHomePage extends StatefulWidget {
  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  List<Student> studentList = null;
  bool _isUpdateBtn = true;
  bool _isEditBtn = true;
  var index = null;

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
            //? StudentModelBox(studentList[Index])
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
          child: ExpansionTile(
            key: UniqueKey(),
            title: _listtile(student),
            children: <Widget>[
              //_expansionDetail(),
              ExpansionModel(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _icon(Student student) {
    return Container(
      width: 30.0,
      alignment: Alignment.topCenter,
      child: Stack(
          fit: StackFit.passthrough,
          alignment: AlignmentGeometry.lerp(
              Alignment.topRight, Alignment.topLeft, 20.0),
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Text(student.firstName.substring(0, 1)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 35.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                        onTap: () {},
                        child: Icon(
                          FontAwesomeIcons.male,
                          size: 30.0,
                        )),
                  ),
                  Expanded(
                      child: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            FontAwesomeIcons.female,
                            size: 30.0,
                          ))),
                ],
              ),
            )
          ]),
    );
  }

  Widget _studentFullName(Student student) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 1, top: 5),
          ),
          //child:
          Text(
            student.firstName + " " + student.lastName,
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

  Widget _details(Student student) {
    return Column(
      children: <Widget>[
        // this code for line
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
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _listtile(Student student) {
    return ListTile(
      leading: GestureDetector(
        onTap: () {},
        child: _icon(student),
      ),
      title: GestureDetector(
        onTap: () {},
        child: _studentFullName(student),
      ),
      subtitle: GestureDetector(
        onTap: () {},
        child: _details(student),
      ),
      // trailing: _expansionIcon(),
    );
  }

  Widget _expansionDetail() {

    return Column(
      children: <Widget>[
        Container(
          child: _isEditBtn ? RaisedButton(
            onPressed: () {
              print("Click");
            },
            color: Colors.red,
            child: Text("Edit"),
          ) : Container()
        ),
        Container(
            child: _isUpdateBtn ? RaisedButton(
              onPressed: () {
                print("Click");
              },
              color: Colors.blue,
              child: Text("Update"),
            ): Container()
        ) ,

        Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 90.0, right: 80.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        _isUpdateBtn = false;
                        _isEditBtn = true;
                      });

                    },

                    child: Text("Edit"),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: (){
                      setState(() {
                        _isEditBtn = false;
                        _isUpdateBtn = true;
                      });
                    },
                    child: Text("Update"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Widget _expansionIcon() {
  return Padding(
    padding: EdgeInsets.only(top: 0.0),
    child: Container(
      width: 10.0,
      alignment: Alignment.center,
      child: Icon(Icons.expand_more),
    ),
  );
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

class  StudentModelBox extends StatefulWidget {

  Student student;
  StudentModelBox(this.student);

  @override
  _StudentModelBox createState() => _StudentModelBox();

}

class _StudentModelBox extends State<StudentModelBox> {
  bool _isUpdateBtn = true;
  bool _isEditBtn = true;
  @override
  Widget build(BuildContext context) {
    return _listTileViewStudents2(widget.student);
  }

  _listTileViewStudents2(Student student) {
    return GestureDetector(
      onTap: () {
        // showEventDetail(data);
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
          child: ExpansionTile(
            title: _listtile(student),
            children: <Widget>[
              _expansionDetail(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listtile(Student student) {
    return ListTile(
      leading: GestureDetector(
        onTap: () {},
        child: _icon(student),
      ),
      title: GestureDetector(
        onTap: () {},
        child: _studentFullName(student),
      ),
      subtitle: GestureDetector(
        onTap: () {},
        child: _details(student),
      ),
      // trailing: _expansionIcon(),
    );
  }

  Widget _expansionDetail() {

    return Column(
      children: <Widget>[
        Container(
            child: _isEditBtn ? RaisedButton(
              onPressed: () {
                print("Click");
              },
              color: Colors.red,
              child: Text("Edit"),
            ) : Container()
        ),
        Container(
            child: _isUpdateBtn ? RaisedButton(
              onPressed: () {
                print("Click");
              },
              color: Colors.blue,
              child: Text("Update"),
            ): Container()
        ) ,

        Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 90.0, right: 80.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        _isUpdateBtn = false;
                        _isEditBtn = true;
                      });

                    },
                    child: Text("Edit"),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: (){
                      setState(() {
                        _isEditBtn = false;
                        _isUpdateBtn = true;
                      });
                    },
                    child: Text("Update"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _icon(Student student) {
    return Container(
      width: 30.0,
      alignment: Alignment.topCenter,
      child: Stack(
          fit: StackFit.passthrough,
          alignment: AlignmentGeometry.lerp(
              Alignment.topRight, Alignment.topLeft, 20.0),
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Text(student.firstName.substring(0, 1)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 35.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                        onTap: () {},
                        child: Icon(
                          FontAwesomeIcons.male,
                          size: 30.0,
                        )),
                  ),
                  Expanded(
                      child: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            FontAwesomeIcons.female,
                            size: 30.0,
                          ))),
                ],
              ),
            )
          ]),
    );
  }

  Widget _studentFullName(Student student) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 1, top: 5),
          ),
          //child:
          Text(
            student.firstName + " " + student.lastName,
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

  Widget _details(Student student) {
    return Column(
      children: <Widget>[
        // this code for line
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
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


class ExpansionModel extends StatefulWidget {
  final TextEditingController controller = new TextEditingController();
  @override
  _ExpansionModelState createState() => _ExpansionModelState();
}

class _ExpansionModelState extends State<ExpansionModel> {
  bool _isEditBtn = true;
  bool _isUpdateBtn = false;

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return _expansionDetail();
  }

  Widget _expansionDetail() {

    return Column(
      children: <Widget>[
       /* Container(
            child: _isEditBtn ? RaisedButton(
              onPressed: () {
                print("Click");
              },
              color: Colors.red,
              child: Text("Edit"),
            ) : Container()
        ),
        Container(
            child: _isUpdateBtn ? RaisedButton(
              onPressed: () {
                print("Click");
              },
              color: Colors.blue,
              child: Text("Update"),
            ): Container()
        ) ,
        Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 90.0, right: 80.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        _isUpdateBtn = false;
                        _isEditBtn = true;
                      });

                    },
                    child: Text("Edit"),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: (){
                      setState(() {
                        _isEditBtn = false;
                        _isUpdateBtn = true;
                      });
                    },
                    child: Text("Update"),
                  ),
                ),
              ],
            ),
          ),
        ),*/
        //1. Container for Parent Label (Static View of Details
        Container(
          //If _isUpdate == true then show this Container.
          // this Container contain 2 ExpansionTile
          // One for Father and other for Mother.
          // Each Expansiontile Contain Label.
          child: _isEditBtn ? Column(
            children: <Widget>[
              //A. Father ExpansionTile
              ExpansionTile(
                title: Text("Father Detail"),
                children: <Widget>[
                  //Father First Name
                  Text("First Name: Dilip"),
                  //Father Last Name
                  Text("Last Name: Kadam"),
                  //Email
                  Text("Email: dilipkadam@gmail.com"),
                  // Conatact
                  Text("Contact: ")
                ],
              ),
              //B. Mother ExapansionTile
              ExpansionTile(
                title: Text("Mother Detail"),
                children: <Widget>[
                  //Mother First Name
                  //Mother Last Name
                  //Email
                  // Conatact
                ],
              ),
              RaisedButton(
                onPressed: (){
                  setState(() {
                    _isEditBtn = false;
                    _isUpdateBtn = true;
                  });
                },
                child: Text("Edit"),
              ),
            ],
          ): null,
        ),

        //2. Coantainer for Parent Edit (Form)
        Container(
          // this Container contain one form
          // Form Contain Two ExpansionTile.
          child: _isUpdateBtn ? Column(
            children: <Widget>[
              //A. For Father
              //First Name
              TextFormField(
                controller: widget.controller,
              ),
              //Last Name
              TextFormField(),
              //Email Name
              TextFormField(),
              //Conatct Name
              TextFormField(),

              //B. For Mother
              //First Name
              TextFormField(),
              //Last Name
              TextFormField(),
              //Email Name
              TextFormField(),
              //Conatct Name
              TextFormField(),
              RaisedButton(
                child: Text("Update"),
                onPressed: (){
                  setState(() {
                    _isEditBtn = true;
                    _isUpdateBtn = false;
                  });
                },
              )
            ],
          ):null,

        )

      ],
    );
  }
}
