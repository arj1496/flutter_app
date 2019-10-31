import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:flutter_app/src/mo/Parent/Parent.dart';
import 'package:flutter_app/src/mo/Student/Student.dart';
import 'package:flutter_app/src/mo/Student/StudentActivity.dart';
import 'package:flutter_app/src/mo/Student/StudentService.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'addStudent.dart';

class StudentDetailWithDialog extends StatefulWidget {

  @override
  _StudentDetailWithDialogState createState() =>
      _StudentDetailWithDialogState();
}

class _StudentDetailWithDialogState extends State<StudentDetailWithDialog> {
  // maintains validators and state of form fields
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  List<Student> studentList = null;
  bool _isUpdateBtn = true;
  bool _isEditBtn = true;

  String _fatherFirstName;
  String _fatherLastName;

  // manage state of modal progress HUD widget
  bool _isInAsyncCall = false;



  @override
  Widget build(BuildContext context) {
    /*return appBar();
  }*/
    StudentActivity studentActivity = new StudentActivity();
    Future<List<Student>> studentList1 = studentActivity.getAllStudent();
    var futureBuilder = new FutureBuilder(
        future: studentList1,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return _getListViewWithBuilder(context, snapshot);
        }
    );

    // appBar() {
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => AddStudent()),
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
    studentList = snapshot.data;
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

  Future<String> createAlertDialogBox(BuildContext context, Student student) {
    setState(() {
      _isEditBtn = true;
    });
    String studentName = student.firstName + ' ' + student.lastName;

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Parent details of ${studentName}"),
            content: Container(
              child: //getEditForm(student),
              getDisplayForm(student),
            ),
            actions: <Widget>[
              _isEditBtn
                  ? MaterialButton(
                  child: Text("Edit"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => getStudentEditForm(
                              object: student,
                              onCustCallBack: (){
                                print('hey done');
                              }
                          )),
                    );

                  }) : null,
              MaterialButton(
                  child: Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }

  _listTileViewStudents2(Student student) {
    return GestureDetector(
      onTap: () {
        createAlertDialogBox(context, student);
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
          child: _listtile(student),
        ),
      ),
    );
  }

  Widget _icon(Student student) {
    Parent father;
    Parent mother;

    List<Parent> parentlist = student.parentList;
    for (var i = 0; i < parentlist.length; i++){
      Parent parent = parentlist[i];
      if(parent.relation == 'FATHER'){
        father =  parent;
      }
      else if(parent.relation == 'MOTHER'){
        mother =  parent;
      }
    }

    return Container(
      width: 30.0,
      // alignment: Alignment.topCenter,
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
              padding: EdgeInsets.only(top: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child:
                        father != null ?
                        Icon(
                          FontAwesomeIcons.male,
                          color: Colors.lightBlue,
                          size: 25.0,
                        )  : null,
                      )
                  ),
                  Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child:
                        mother != null ?
                        Icon(
                          FontAwesomeIcons.female,
                          color: Colors.pinkAccent,
                          size: 25.0,
                        ) : null,
                      )
                  ),
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
                      student.standard != null   ?  student.standard.name : "Class - 1",
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
                          student.rollNo != null   ?  student.rollNo.toString() : " ",
                          // student.rollNo.toString(),
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
    );
  }

  Widget getEditForm(Student student) {
    String studentName = student.firstName + ' ' + student.lastName;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Parent details of ${studentName}",
          style: TextStyle(
            fontSize: 17.0,
          ),
          textAlign: TextAlign.start,
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: _isInAsyncCall,
        color: Colors.white,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 20.0),
          child: Form(
            key: this._loginFormKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 0.0, left: 10.0),
                  child: Container(
                      alignment: Alignment.topLeft,
                      child: Text("Father details",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold))),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: TextFormField(
                    autocorrect: true,
                    decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Father First Name',
                        labelText: 'Enter father firstName'),
                    onSaved: (value) => _fatherFirstName = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: TextFormField(
                    autocorrect: true,
                    decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Father Last Name',
                        labelText: 'Enter father lastName'),
                    onSaved: (value) => _fatherLastName = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: TextFormField(
                    autocorrect: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        icon: Icon(Icons.alternate_email),
                        hintText: 'Father Email Id',
                        labelText: 'Enter father emailId'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: TextFormField(
                    autocorrect: true,
                    keyboardType: TextInputType.phone,
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(12),
                    ],
                    decoration: InputDecoration(
                        icon: Icon(Icons.phone),
                        hintText: 'Phone Number',
                        labelText: 'Enter Father phoneNumber'),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 10.0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text("Mother details",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: TextFormField(
                    autocorrect: true,
                    decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Mother First Name',
                        labelText: 'Enter mother firstName'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: TextFormField(
                    autocorrect: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Mother Last Name',
                      labelText: 'Enter mother lastName',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: TextFormField(
                    autocorrect: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        icon: Icon(Icons.alternate_email),
                        hintText: 'Mother Email Id',
                        labelText: 'Enter mother emailId'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: TextFormField(
                    autocorrect: true,
                    keyboardType: TextInputType.phone,
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(12),
                    ],
                    decoration: InputDecoration(
                        icon: Icon(Icons.phone),
                        hintText: 'Mother Phone Number',
                        labelText: 'Enter mother phoneNumber'),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 40.0, left: 50.0, right: 40.0, bottom: 30.0),
                        child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            color: Colors.lightBlueAccent,
                            child: Text(
                              "Update",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {
                              //_submit();
                            }),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 40.0, left: 50.0, right: 40.0, bottom: 30.0),
                        child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            color: Colors.lightBlueAccent,
                            child: Text(
                              "Close",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  } //getEditForm

  Widget getDisplayForm(Student student) {

    Parent father;
    Parent mother;


    List<Parent> parentList = student.parentList;

    // parentList
    for(int i=0;i<parentList.length;i++){
      Parent parent = parentList[i];
      if(parent.relation == "FATHER"){
        father = parent;
      }else if(parent.relation == "MOTHER"){
        mother = parent;
      }
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(1.0),
      child: Column(
        children: <Widget>[
          Container(
              alignment: Alignment.topLeft,
              child: Text("Father details",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold))),
          Container(
            padding:
            EdgeInsets.only(top: 2.0, bottom: 2.0, right: 2.0, left: 20.0),
            alignment: Alignment.topLeft,
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: "First Name: ",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: father != null && father.firstName != "" ? father.firstName : '',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding:
            EdgeInsets.only(top: 2.0, bottom: 2.0, right: 2.0, left: 20.0),
            alignment: Alignment.topLeft,
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: "Last Name: ",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: father != null && father.lastName != "" ? father.lastName : '',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding:
            EdgeInsets.only(top: 2.0, bottom: 2.0, right: 2.0, left: 20.0),
            alignment: Alignment.topLeft,
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: "Email: ",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: father != null && father.email != "" ? father.email : '',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding:
            EdgeInsets.only(top: 2.0, bottom: 2.0, right: 2.0, left: 20.0),
            alignment: Alignment.topLeft,
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: "Contact: ",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: father != null && father.mobileNumber != "" ? father.mobileNumber : '',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text("Mother details",
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            padding:
            EdgeInsets.only(top: 2.0, bottom: 2.0, right: 2.0, left: 20.0),
            alignment: Alignment.topLeft,
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: "First Name: ",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: mother != null && mother.firstName != "" ? mother.firstName : '',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding:
            EdgeInsets.only(top: 2.0, bottom: 2.0, right: 2.0, left: 20.0),
            alignment: Alignment.topLeft,
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: "Last Name: ",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: mother != null && mother.lastName != "" ? mother.lastName : '',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding:
            EdgeInsets.only(top: 2.0, bottom: 2.0, right: 2.0, left: 20.0),
            alignment: Alignment.topLeft,
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: "Email: ",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: mother != null && mother.email != "" ? mother.email : '',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding:
            EdgeInsets.only(top: 2.0, bottom: 2.0, right: 2.0, left: 20.0),
            alignment: Alignment.topLeft,
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: "Contact: ",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: mother != null && mother.mobileNumber != "" ? mother.mobileNumber : '',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  } //getDisplayForm
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


class getStudentEditForm extends StatefulWidget {

  VoidCallback onCustCallBack;
  Student student;

  getStudentEditForm({Student object,  @required onCustCallBack}) :
        assert (onCustCallBack != null),
        student = object,
        onCustCallBack = onCustCallBack;

  @override
  _getStudentEditFormState createState() => _getStudentEditFormState();
}

class _getStudentEditFormState extends State<getStudentEditForm> {

  // maintains validators and state of form fields
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // manage state of modal progress HUD widget
  bool _isInAsyncCall = false;

  GenericModel genericmodel = new GenericModel();

  Parent father;
  Parent mother;




  bool _isUpdate = false;

  void _submit() {
    if (this._formKey.currentState.validate()) {
      this._formKey.currentState.save();

      setState(() {
        _isInAsyncCall = true;
      });

      // call activity

      StudentActivity studentActivity = new StudentActivity();
      studentActivity.saveStudentDetail(genericmodel, (){
        setState(() {
          _isUpdate = true;
          _isInAsyncCall = false;
        });
        if (_isUpdate) {
          widget.onCustCallBack();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Parent> parentList = widget.student.parentList;

    // parentList
    for(int i=0;i<parentList.length;i++){
      Parent parent = parentList[i];
      if(parent.relation == "FATHER"){
        this.father = parent;
      }else if(parent.relation == "MOTHER"){
        this.mother = parent;
      }
    }

    String studentName = widget.student.firstName + ' ' + widget.student.lastName;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Parent details of ${studentName}",
          style: TextStyle(
            fontSize: 17.0,
          ),
          textAlign: TextAlign.start,
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: _isInAsyncCall,
        color: Colors.white,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 20.0),
          child: Form(
            key: this._formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 0.0, left: 10.0),
                  child: Container(
                      alignment: Alignment.topLeft,
                      child: Text("Father details",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold))),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: TextFormField(
                    initialValue: this.father != null && this.father.firstName != "" ? this.father.firstName : '',
                    autocorrect: true,
                    decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Father First Name',
                        labelText: 'Enter father firstName'
                    ),
                    onSaved: (value) => genericmodel.fatherFirstName = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: TextFormField(
                    initialValue: this.father != null && this.father.lastName != "" ? this.father.lastName : '',
                    autocorrect: true,
                    decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Father Last Name',
                        labelText: 'Enter father lastName'),
                    onSaved: (value) => genericmodel.fatherLastName = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: TextFormField(
                    initialValue: this.father != null && this.father.email != "" ? this.father.email : '',
                    autocorrect: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        icon: Icon(Icons.alternate_email),
                        hintText: 'Father Email Id',
                        labelText: 'Enter father emailId'),
                    onSaved: (value) => genericmodel.fatherEmail = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: TextFormField(
                    initialValue: this.father != null && this.father.mobileNumber != "" ? this.father.mobileNumber : '',
                    autocorrect: true,
                    keyboardType: TextInputType.phone,
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(12),
                    ],
                    decoration: InputDecoration(
                        icon: Icon(Icons.phone),
                        hintText: 'Phone Number',
                        labelText: 'Enter Father phoneNumber'),
                    onSaved: (value) => genericmodel.fatherContact = value,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 10.0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text("Mother details",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: TextFormField(
                    initialValue: this.mother != null && this.mother.firstName != "" ? this.mother.firstName : '',
                    autocorrect: true,
                    decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Mother First Name',
                        labelText: 'Enter mother firstName'),
                    onSaved: (value) => genericmodel.moherFirstName = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: TextFormField(
                    initialValue: this.mother != null && this.mother.lastName != "" ? this.mother.lastName : '',
                    autocorrect: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Mother Last Name',
                      labelText: 'Enter mother lastName',
                    ),
                    onSaved: (value) => genericmodel.motherLastName = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: TextFormField(
                    initialValue: this.mother != null && this.mother.email != "" ? this.mother.email : '',
                    autocorrect: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        icon: Icon(Icons.alternate_email),
                        hintText: 'Mother Email Id',
                        labelText: 'Enter mother emailId'),
                    onSaved: (value) => genericmodel.motherEmail= value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: TextFormField(
                    initialValue: this.mother != null && this.mother.mobileNumber != "" ? this.mother.mobileNumber : '',
                    autocorrect: true,
                    keyboardType: TextInputType.phone,
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(12),
                    ],
                    decoration: InputDecoration(
                        icon: Icon(Icons.phone),
                        hintText: 'Mother Phone Number',
                        labelText: 'Enter mother phoneNumber'),
                    onSaved: (value) => genericmodel.motherContact = value,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 40.0, left: 50.0, right: 40.0, bottom: 30.0),
                        child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            color: Colors.lightBlueAccent,
                            child: Text(
                              "Update",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {
                              _submit();
                            }),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 40.0, left: 50.0, right: 40.0, bottom: 30.0),
                        child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            color: Colors.lightBlueAccent,
                            child: Text(
                              "Close",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
