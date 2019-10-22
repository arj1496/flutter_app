
import 'package:flutter/material.dart';
import 'package:flutter_app/StandardDropdownWidget.dart';
import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:flutter_app/src/mo/Exam/StandardSelectModel.dart';
import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Standard/StandardService.dart';
import 'package:flutter_app/src/mo/Subject/Subject.dart';
import 'package:flutter_app/src/mo/Subject/SubjectActivity.dart';
import 'package:flutter_app/src/mo/Subject/SubjectService.dart';
import 'package:provider/provider.dart';

// Generic standard drop down list

class SubjectDropdownWidget extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return ExamAddUIState.init();
  }
  GlobalKey<FormState> formKey;
  GenericModel genericModel;
  SubjectDropdownWidget.init(formKey, _eventPojo) {
    this.formKey = formKey;
    this.genericModel = _eventPojo;
  }

  SubjectDropdownWidget(this.formKey, this.genericModel);
}
class SubjectDropdownWidget1 extends StatelessWidget {
  TextEditingController labelText = new TextEditingController( );
  String subjectOf = "Select Subject";
  @override
  Widget build(BuildContext context) {
    return   Container(
      child:  Consumer<StandardSelectModel>(
        //context, todos, child) => TaskList(tasks: todos.allTasks,
        builder: (context,_standardSubkectList,child){
          List<Subject> subList = _standardSubkectList.standardSubjectClass;
          return _getDropDownFormField(  Icon ( Icons.subject ) ,subList );
        },
      ),
    );
  }
  _getDropDownFormField( Icon icon,List<Subject> subjectList) {
    //List<Subject> subjectList = new List();
    /*if(snapshot.data != null){
      subjectList = snapshot.data;
    }*/
    return FormField (
        builder: ( FormFieldState state ) {
          return InputDecorator (
            decoration: InputDecoration (
                icon: icon ,
                prefixText: subjectOf
            ) ,
            child: DropdownButtonHideUnderline (
                child: Padding (
                  padding: EdgeInsets.only ( right: 8.0 , left: 8.0 ) ,
                  child: DropdownButton (
                    isDense: true ,

                    onChanged: ( dynamic newValue ) {
                    /*  setState ( ( ) {
                        subjectOf = newValue;
                        state.didChange ( newValue );
                      } );*/
                    print(newValue);
                    } ,

                    items: subjectList.map ( ( Subject subject ) {
                      return new DropdownMenuItem(
                        value: subject.name ,
                        child: new Text( subject.name ) ,
                      );
                    }).toList (),
                  ) ,
                )
            ) ,
          );
        }
    );


  }
}

Future<List<Subject>> getSubjects() async{
  StandardDropDown standardWidget = new StandardDropDown();
  int id= standardWidget.getSelectedStandard();
  SubjectActivity subjectActivity = new SubjectActivity();
  if(id!=null) {
    List<Subject> subjectList = await subjectActivity
        .getSubjectByStandardId (id);
    return subjectList;
  }else{
    List<Subject> subjectList = await subjectActivity.getSubjectListFromLocalDB();
  }
  return null;
}
class ExamAddUIState extends State<SubjectDropdownWidget> {

  TextEditingController labelText = new TextEditingController( );
  String subjectOf = "Select Subject";
  ExamAddUIState.init( ){

  }

  @override
  Widget build( BuildContext context ) {
    return
        Container(
          child:  Consumer<StandardSelectModel>(
          //context, todos, child) => TaskList(tasks: todos.allTasks,
            builder: (context,_standardSubkectList,child){
              List<Subject> subList = _standardSubkectList.standardSubjectClass;
              return _getDropDownFormField(  Icon ( Icons.subject ) ,subList );
            },
        ),
        );
      /*FutureBuilder (
        future: getSubjects() ,
        builder: ( context , projectSnap ) {
          //if ( projectSnap.data != null) {
            return _getDropDownFormField (  Icon ( Icons.subject ) , projectSnap );
         // }
    });*/


  }
//AsyncSnapshot snapshot
  _getDropDownFormField( Icon icon,List<Subject> subjectList) {
    //List<Subject> subjectList = new List();
    /*if(snapshot.data != null){
      subjectList = snapshot.data;
    }*/
          return FormField (
              builder: ( FormFieldState state ) {
                return InputDecorator (
                  decoration: InputDecoration (
                      icon: icon ,
                      prefixText: subjectOf
                  ) ,
                  child: DropdownButtonHideUnderline (
                      child: Padding (
                        padding: EdgeInsets.only ( right: 8.0 , left: 8.0 ) ,
                        child: DropdownButton (
                          isDense: true ,

                          onChanged: ( dynamic newValue ) {
                            setState ( ( ) {
                              subjectOf = newValue.name;
                              state.didChange ( newValue );
                              widget.formKey.currentState.save();
                              widget.genericModel.subjectId = newValue.id;
                            } );
                          } ,

                          items: subjectList.map ( ( Subject subject ) {
                            return new DropdownMenuItem(
                              value: subject ,
                              child: new Text( subject.name ) ,
                            );
                          }).toList (),
                        ) ,
                      )
                  ) ,
                );
              }
          );


  }
}
