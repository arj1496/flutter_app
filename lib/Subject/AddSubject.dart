import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/TeacherDropDown.dart';
import 'package:flutter_app/src/mo/Student/Student.dart';
import 'package:flutter_app/src/mo/Subject/Subject.dart';
import 'package:flutter_app/src/mo/Subject/SubjectActivity.dart';
import 'package:flutter_app/src/mo/teacher/Teacher.dart';
import 'package:flutter_app/src/mo/teacher/TeacherActivity.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'StandardDropDownForSubject.dart';

class AddSubject extends StatefulWidget {
  VoidCallback onCallBack;
  Subject subject = new Subject();
  bool isUpdateFlag;
  Student student = new Student();

  AddSubject(
      {@required Subject object, @required onCallBack, this.isUpdateFlag})
      : assert(object != null),
        assert(onCallBack != null),
        this.subject = object,
        this.onCallBack = onCallBack;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddSubjectState();
  }
}

class AddSubjectState extends State<AddSubject> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<Teacher> teacherList = new List<Teacher>();
  Subject subject = new Subject();

  int currentTeacher;
  var selectVal = true;
  var whichSubject = "isOptional Subject";

  bool _isInAsyncCall = false;
  bool _isAdd = false;

  final FocusNode _subName = FocusNode();
  final FocusNode _subShortName = FocusNode();
  final FocusNode _subLevel = FocusNode();
  final FocusNode _subCode = FocusNode();

  Future<List<Teacher>> getTeacherData() async {
    TeacherActivity teacherActivity = new TeacherActivity();
    teacherList = await teacherActivity.getJoinDbTeacher();
    return teacherList;
  }

  //String currentTeacher="Abc";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Subject",
            textAlign: TextAlign.center,
          ),
        ),
        body: ModalProgressHUD(
          inAsyncCall: _isInAsyncCall,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    /* Padding(
                    padding:EdgeInsets.only(left:50.0,right: 10.0),
                    child: DropdownButton<String>(
                      items:teacherList.map((String dropDownStringItem){
                        return DropdownMenuItem<String>(

                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      onChanged: (String newSubjectSelected){
                        _dropDownTeacher(newSubjectSelected);

                      },
                      hint: Text('Select Teacher'),
                    ),
                  ),*/
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: StandardDropDownForSubject(
                          formKey: formKey,
                          subject: subject,
                          student: widget.student),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TeacherDropDown(formKey, subject),
                    ),
                    Padding(padding: EdgeInsets.all(5.0), child: subjectName()),
                    Padding(
                        padding: EdgeInsets.all(5.0),
                        child: subjectShortName()),
                    Padding(padding: EdgeInsets.all(5.0), child: level()),
                    Padding(padding: EdgeInsets.all(5.0), child: subjectCode()),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: SwitchListTile(
                        title: Text(whichSubject),
                        value: selectVal,
                        onChanged: (bool val) {
                          select(val);
                        },
                        activeColor: Colors.lightBlue,
                        secondary: const Icon(Icons.subject),
                      ),
                    ),

                    /* Padding(
                  padding:
                      const EdgeInsets.only(left: 50.0, right: 10.0, top: 10.0),*/
                    /*child: DropdownButton<int>(
                    items: teacherList.map((Teacher dropDownStringItem) {
                      return DropdownMenuItem<int>(
                        value: dropDownStringItem.id,
                        child: Text(dropDownStringItem.firstName +
                            dropDownStringItem.lastName),
                      );
                    }).toList(),
                    onChanged: (int newSubjectSelected) {
                      _dropDownItemSelected(newSubjectSelected);
                    },
                    value: currentTeacher,
                    hint: Text('Select Teacher'),
                  ),
                ),*/
                    // Padding(padding: EdgeInsets.all(10.0), child: teachingHours()),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: buttons(),
                    ),

                    /// // ButtonUI.init('
                  ],
                )),
          ),
        ),
      ),
    );
  }

  Row buttons() {
    return Row(children: <Widget>[
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 20.0, left: 30.0, right: 30.0, bottom: 30.0),
          child: widget.isUpdateFlag
              ? MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  color: Colors.lightBlueAccent,
                  child: Text(
                    "Update Subject",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    _submit();
                  })
              : MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  color: Colors.lightBlueAccent,
                  child: Text(
                    "Add Subject",
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
              top: 20.0, left: 30.0, right: 30.0, bottom: 30.0),
          child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              color: Colors.lightBlueAccent,
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
      ),
    ]);
  }

  TextFormField subjectName() {
    return TextFormField(
      initialValue: widget.subject.name != "" ? widget.subject.name : '',
      onSaved: (String val) {
        subject.name = val;
      },
      textInputAction: TextInputAction.next,
      focusNode: _subName,
      onFieldSubmitted: (term) {
        _fieldFocusChange(context, _subName, _subShortName);
      },
      decoration: InputDecoration(
        labelText: 'Subject Name',
        hintText: 'Select Subject Name',
        icon: Icon(Icons.book),
      ),
    );
  }

  TextFormField subjectShortName() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      focusNode: _subShortName,
      onFieldSubmitted: (term) {
        _fieldFocusChange(context, _subShortName, _subLevel);
      },
      decoration: InputDecoration(
        labelText: 'Subject Short Name',
        hintText: 'Select Subject short name',
        icon: Icon(Icons.book),
      ),
    );
  }

  TextFormField level() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      focusNode: _subLevel,
      onFieldSubmitted: (term) {
        _fieldFocusChange(context, _subLevel, _subCode);
      },
      decoration: InputDecoration(
          labelText: 'Level', hintText: 'Select Level', icon: Icon(Icons.book)),
    );
  }

  TextFormField subjectCode() {
    return TextFormField(
      textInputAction: TextInputAction.done,
      focusNode: _subCode,
      onFieldSubmitted: (value) {
        _subCode.unfocus();
        //_submit();
      },
      decoration: InputDecoration(
        labelText: 'Subject Code',
        hintText: 'Select Subject Code',
        icon: Icon(Icons.book),
      ),
    );
  }

  TextFormField teachingHours() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Teaching Hours',
        hintText: 'Select Teaching Hours',
        icon: Icon(Icons.access_time),
      ),
    );
  }

  void _dropDownItemSelected(int newSelectedTeacher) {
    setState(() {
      this.currentTeacher = newSelectedTeacher;
    });
  }

  select(bool val) {
    setState(() {
      if (val) {
        whichSubject = "isOptional Subject";
        selectVal = val;
        print(selectVal);
      } else {
        whichSubject = "isOptional Subject";
        selectVal = val;
        print(selectVal);
      }
    });
  }

  void _submit() {
    if (this.formKey.currentState.validate()) {
      this.formKey.currentState.save();
      setState(() {
        _isInAsyncCall = true;
      });
      SubjectActivity subjectActivity = new SubjectActivity();
      subjectActivity.addSubject(subject, () {
        print("Subject Added Successfully!");
        setState(() {
          _isAdd = true;
          _isInAsyncCall = false;
        });
        if (_isAdd) {
          Navigator.of(context).pop();
        }
      });
    }
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
/* void _dropDownTeacher(String newSelectedTeacher) {
    setState(() {
      this.currentTeacher= newSelectedTeacher;
    });
  }*/
}
