import 'package:flutter/material.dart';
import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Standard/StandardActivity.dart';
import 'package:flutter_app/src/mo/teacher/Teacher.dart';
import 'package:flutter_app/src/mo/teacher/TeacherActivity.dart';

class TeacherDropDown extends StatefulWidget {

  /*List<String> _standard = null;*/

  @override
  State<StatefulWidget> createState() {
    return TeacherdropdownState();
  }

  GlobalKey<FormState> formKey;
  GenericModel genericModel;
  TeacherDropDown.init(formKey, _eventPojo) {
    this.formKey = formKey;
    this.genericModel = _eventPojo;
  }

  TeacherDropDown(this.formKey, this.genericModel);

}

List<Teacher> teacherList  = new List<Teacher>();

int currentTeacher;
Future<List<Teacher>> getTeacherData() async{
  TeacherActivity teacherActivity = new TeacherActivity();
  teacherList = await teacherActivity.getJoinDbTeacher();
  return teacherList;}

class TeacherdropdownState extends State<TeacherDropDown> {
  String _class;

  String teacher = "Select Teacher";
  static int selectedTeacherId;
  TextEditingController labelText = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getTeacherData(),
      builder: (context , snapshot){
        return Container(
          child: Column(
            children: <Widget>[
              _getDropDownFormField (Icon(Icons.class_), 'Select Teacher', 'Teacher',snapshot ),
            ],
          ),
        );
      },
    );
  }

  _getDropDownFormField(Icon icon, String hintText, String labelText, AsyncSnapshot snapshot) {
    String _color = '';
    List<Teacher> TeacherList = new List();
    if(snapshot.data != null){
      TeacherList = snapshot.data;
    }
    return FormField(
      // validator: classValidation,
        builder: (FormFieldState state) {
          return InputDecorator(
            decoration: InputDecoration(
                icon: Icon(Icons.class_), prefixText: teacher),
            child: DropdownButtonHideUnderline(
                child: Padding(
                  padding: EdgeInsets.only(right: 8.0, left: 8.0),
                  child: DropdownButton(
                    isDense: true,
                    onChanged: (newValue) {
                      setState(() {
                        selectedTeacherId = newValue.id;
                       teacher = newValue.firstName;
                        state.didChange(newValue.firstName);
                        //widget.formKey.currentState.save();
                        widget.genericModel.teacherId = newValue.id;
                      });
                    },
                    items: teacherList.map((Teacher teacher) {
                      return new DropdownMenuItem(
                        value: teacher,
                        child: new Text(teacher.firstName),
                      );
                    }).toList(),
                  ),
                )),
          );
        });
  }
  getSelectedStandard() async {
    return selectedTeacherId;
  }
}
