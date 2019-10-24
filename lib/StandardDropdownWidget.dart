
import 'package:flutter/material.dart';
import 'package:flutter_app/src/mo/CommanCode/GenericModel.dart';
import 'package:flutter_app/src/mo/Exam/Exam.dart';
import 'package:flutter_app/src/mo/Exam/StandardSelectModel.dart';
import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Standard/StandardActivity.dart';
import 'package:flutter_app/src/mo/Subject/Subject.dart';
import 'package:flutter_app/src/mo/Subject/SubjectActivity.dart';
import 'package:provider/provider.dart';


// Generic standard drop down list

class StandardDropdownWidget extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return StandardDropDown();
  }

  GlobalKey<FormState> formKey;
  GenericModel genericModel;
  Exam exam = new Exam();
  StandardDropdownWidget.init(formKey, _eventPojo,exam) {
    this.formKey = formKey;
    this.genericModel = _eventPojo;
    this.exam = exam;
  }

  StandardDropdownWidget(this.formKey, this.genericModel,exam);
}
Future<List<Standard>> getStandards() async{
  StandardActivity standardActivity = new StandardActivity();
  List<Standard> _standard = await standardActivity.getStandardListFromLocalDB();

  return _standard;
}

class StandardDropDown extends State<StandardDropdownWidget> {

  TextEditingController labelText = new TextEditingController( );
  String classOf;
  static int selectedStandardId;
  static List<Subject> _subject;
 // Exam exam = new Exam();


  @override
  void initState() {
    if(widget.exam.standardName != null){
      classOf = widget.exam.standardName;
    }else{
      classOf ="Select Class";
    }

  }
 /* StandardDropDown.init(Exam exam  ){
    this.wexam = exam;
  }*/
  StandardDropDown( ){

  }
  @override
  Widget build( BuildContext context ) {
    //getStandards1();
    /*return Container(
      child:  Consumer<StandardSelectModel>(
        //context, todos, child) => TaskList(tasks: todos.allTasks,
        builder: (context,_standardList,child){
          List<Standard> stdList = _standardList.allStandard;
          return _getDropDownFormField(  Icon ( Icons.subject ) ,stdList);
        },
      ),
    );*/

  return FutureBuilder (
        future: getStandards() ,
        builder: ( context , projectSnap ) {
           return Container(
             child: Column(
               children: <Widget>[
                _getDropDownFormField (  Icon ( Icons.class_ ) , projectSnap ),
               ],
             ),
           );

        });

  }
//standardList
  _getDropDownFormField( Icon icon,AsyncSnapshot snapshot) {
   List<Standard> standardList = new List();
    if(snapshot.data != null){
      standardList = snapshot.data;
    }
    return FormField (
              builder: ( FormFieldState state ) {
                return InputDecorator (
                  decoration: InputDecoration (
                      icon: icon ,
                      prefixText: classOf
                  ) ,
                  child: DropdownButtonHideUnderline (
                      child: Padding (
                        padding: EdgeInsets.only ( right: 8.0 , left: 8.0 ) ,
                        child: DropdownButton (
                          isDense: true ,
                          onChanged: ( dynamic newValue ) {
                            setState ( ( ) {
                              selectedStandardId = newValue.id;
                              classOf = newValue.name;
                              state.didChange ( newValue );
                              widget.formKey.currentState.save();
                              widget.genericModel.classId = newValue.id;
                            } );

                           // changeStandard();
                            Provider.of<StandardSelectModel>(context, listen: false).changeStandard(newValue);
                           // Navigator.pop(context);
                          } ,
                          items: standardList.map ( ( Standard standard ) {
                            return new DropdownMenuItem(
                              value: standard,
                              child: new Text( standard.name ) ,

                            );
                          } ).toList ( ) ,
                        ) ,
                      )
                  ) ,
                );
              }
          );

        }

  getSelectedStandard() async {
    return selectedStandardId;
  }

  getSelectedSubject() async {
    SubjectActivity subjectActivity = new SubjectActivity();
    _subject = await subjectActivity.getSubjectListFromLocalDB();
    return _subject;

  }

  getStandards1(){
   /* StandardActivity standardActivity = new StandardActivity();
    List<Standard> _standard = await standardActivity.getStandardListFromLocalDB();*/
    Provider.of<StandardSelectModel>(context, listen: false).getStandardList("test");
    Navigator.pop(context);

  }

}
