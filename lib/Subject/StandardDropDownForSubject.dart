import 'package:flutter/material.dart';
import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Standard/StandardActivity.dart';
import 'package:flutter_app/src/mo/Student/Student.dart';
import 'package:flutter_app/src/mo/Subject/Subject.dart';

class StandardDropDownForSubject extends StatefulWidget {
  @override
  _StandardDropDownForSubjectState createState() => _StandardDropDownForSubjectState();
  GlobalKey<FormState> formKey;
  Subject subject;
  Student student;
  StandardDropDownForSubject.init(formKey, _eventPojo, student) {
    this.formKey = formKey;
    this.subject = _eventPojo;
    this.student = student;
  }

  StandardDropDownForSubject({this.formKey, this.subject, this.student});
}

Future<List<Standard>> getStandards() async {
  StandardActivity standardActivity = new StandardActivity();
  List<Standard> _standard = await standardActivity.getStandardListFromLocalDB();
  return _standard;
}


class _StandardDropDownForSubjectState extends State<StandardDropDownForSubject> {
  String classOf;
  bool isStandardDisabled = true;
  String standardOf = "Select Class";
  static int selectedStandardId;
  TextEditingController labelText = new TextEditingController();

  @override
  void initState() {
    if(widget.student!= null && widget.student.standard != null){
      standardOf = widget.student.standard.toString();
      isStandardDisabled = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getStandards(),
        builder: (context , snapshot){
          return Container(
            child: Column(
              children: <Widget>[
                _getDropDownFormField (Icon(Icons.class_), 'Select Class', 'Standard',snapshot ),
              ],
            ),
          );
        }
    );
  }

  _getDropDownFormField(Icon icon, String hintText, String labelText, AsyncSnapshot snapshot) {
    List<Standard> standardList = new List();
    if (snapshot.data != null) {
      standardList = snapshot.data;
    }
    return FormField(
        builder: (FormFieldState state){
          return InputDecorator(
            decoration: InputDecoration(
              icon: Icon(Icons.class_), prefixText: standardOf,
            ),
            child: DropdownButtonHideUnderline(
                child: Padding(
                  padding: EdgeInsets.only(right: 8.0, left: 8.0),
                  child: DropdownButton(
                    isDense: true,
                    onChanged: (newValue) {
                      setState(() {
                        selectedStandardId = newValue.id;
                        standardOf = newValue.name;
                        state.didChange(newValue);
                        widget.subject.standardId = newValue.id;
                      });
                    },
                    items: standardList.map((Standard standard) {
                      return new DropdownMenuItem(
                        value: standard,
                        child: new Text(standard.name),
                      );
                    }).toList(),
                  ),
                )),
          );
        }
    );
  }
}
