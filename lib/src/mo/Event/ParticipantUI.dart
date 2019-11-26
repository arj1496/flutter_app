import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/mo/Event/ParticipantBloc.dart';
import 'package:flutter_app/src/mo/Event/PersonalParticipantUI.dart';
import 'package:flutter_app/src/mo/Event/SubjectPopup.dart';
import 'package:flutter_app/src/mo/Exam/ClassPopup.dart';
import 'package:flutter_app/src/mo/Participant/EventKeyPojo.dart';
import 'package:flutter_app/src/mo/Participant/Participant.dart';
import 'package:flutter_app/src/mo/Person/Person.dart';
import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Standard/StandardActivity.dart';

import '../../../AppTheme.dart';
import 'Event.dart';

class ParticipantUI extends StatefulWidget {

  Event event = new Event();
  final callback;
  final formKey;

  @override
  _ListTileViewUVState createState() => _ListTileViewUVState();
/*   ParticipantUI(_formKey,event, callback){
    this.event = event;
   }*/
  ParticipantUI({
    this.formKey,
    this.event,
    this.callback
});


}


  class _ListTileViewUVState extends State<ParticipantUI> {
    List<String> schoolPaticipant = ["SCHOOL","SCHOOL STUDENTS","SCHOOL TEACHERS","SCHOOL PARENTS"];
    Map<int,bool> partInputs = new Map();
    List<Participant> selectedSchoolParticipant = new List();
    List<Participant> party = new List();
   @override
    void initState(){
      setState(() {
        if (widget.event != null && widget.event.eventParticipant != null) {
          for (Participant participant in widget.event.eventParticipant) {
            if (participant.participantType == "INDIVIDUAL_PARENT" ||
                participant.participantType == "INDIVIDUAL_TEACHER" ||
                participant.participantType == "INDIVIDUAL_STUDENT") {
               widget.event.personalParticipant.add(participant);
            }
          }
        }
      });
    }
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top:10.0),
      child: Container(
        height:150,
        decoration: BoxDecoration(
          color: AppTheme.background,
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
        child:Container(
          // given Box Shadow to the Container
          decoration: BoxDecoration(
            color: AppTheme.background,
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
                                "Partcipant",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: AppTheme.robotoFontName,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: AppTheme.nearlyDarkBlue,
                                ),
                              ),
                            ),
                          ],
                        ),


                      ],
                    ),
                    Container(
                        height: 50,

                      // given Box Shadow to the Container
                      decoration: BoxDecoration(
                        color: AppTheme.white,
                        border: new Border.all(color: Colors.blue),
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
                      child: Row(
                        children: <Widget>[
                         Padding(
                           padding: const EdgeInsets.only(left:8.0),
                           child: GestureDetector(

                             onTap:() {
                              _callPersonalParticipant();
                           /*    Navigator.push (
                                 context ,
                                 MaterialPageRoute (
                                     builder: ( context ) => PersonalParticipantUI(

                                         data: widget.event.personalParticipant,
                                         callback: (List<Participant> value){

                                           //widget.event.personalParticipant.clear();
                                           for(int i=0;i<value.length;i++){
                                             party.add(value[i]);
                                             widget.event.personalParticipant.add(value[i]);
                                             widget.event.eventParticipant.add(value[i]);
                                           }
                                         //  widget.event.personalParticipant = party;
                                           print("callBack Return ${value.length}");
                                         }
                                     )
                                   ) ,
                               );*/
                             },

                               child: Container(
                                   height: 40,
                                   width: 250,
                                decoration: BoxDecoration(
                                color: AppTheme.white,
                                border: new Border.all(color: Colors.blue),
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
                                 child: Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Text("Select Personal Participant",
                                     textAlign: TextAlign.center,
                                     style: TextStyle(
                                       fontFamily: AppTheme.robotoFontName,
                                       fontWeight: FontWeight.w600,
                                       fontSize: 14,
                                       color: AppTheme.lightText,
                                     ),
                                   ),
                                 ),
                               ),

                           ),
                         ),
                          Container(
                            height: 40,
                            width: 50,
                            decoration: BoxDecoration(
                              color: AppTheme.white,
                              border: new Border.all(color: Colors.blue),
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
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: widget.event.eventParticipant!=null ?
                              Text( widget.event.eventParticipant.length.toString(),
                                 textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: AppTheme.robotoFontName,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: AppTheme.lightText,
                                ),
                              ):Text("0"),
                            ),
                          ),
                        ],
                      ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0,bottom: 8),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: GestureDetector(
                              onTap: ( ) {
                               /* setState ( ( ) {
                                  _showAlert((val){
                                    widget.event.eventParticipant = val;
                                    print(val);
                                  } );

                                } );*/
                               setState(() {
                                 _showAlert();
                               });
                              } ,
                              child: Container(
                                height: 40,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: AppTheme.white,
                                  border: new Border.all(color: Colors.blue),
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
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("School",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: AppTheme.robotoFontName,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: AppTheme.lightText,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right:0.0),
                            child: GestureDetector(
                              onTap:() {
                                setState(() {
                                  _showClassAlert(context);
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: AppTheme.white,
                                  border: new Border.all(color: Colors.blue),
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
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Class",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: AppTheme.robotoFontName,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: AppTheme.lightText,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showAlert() {
    return showDialog(
        context: context,
        builder: (context) {
          return SubjectPopup(
              callback: (List<Participant> value){
                widget.event.eventParticipant.clear();
                for(int i=0;i<value.length;i++){
                  widget.event.eventParticipant.add(value[i]);
                }
                print("callBack Return ${value.length}");
              }
          );
        }
    );
  }

    void ItemChange( bool val , int index ) {
      setState ( ( ) {
        partInputs[index] = val;
        if (val) {
            selectedSchoolParticipant.add (
              prepareParticipantObject ( schoolPaticipant[index] ) );
        }
      } );
    }

    _showClassAlert(BuildContext context)  async {
      Map<Standard,List<EventKeyPojo>> standardsMap =  await getStandards();
      return showDialog(
          context: context,
          builder: (context) {
            return ClassPopup(
                standardsMap:standardsMap ,
              data: widget.event.eventParticipant,
                callback: (List<Participant> value){
                  print("callBack Return ${value.length}");
                  List<Participant> party = new List();
                  for(int i=0;i<value.length;i++){
                    party.add(value[i]);

                  }
                  widget.event.eventParticipant = party;
                  widget.callback(party);

                  print("callBack Return ${value.length}");
                }
            );
          }
      );
    }


    Participant prepareParticipantObject(String type){
      Participant participant = new Participant();
      participant.participantType = type;
      participant.participantRole = "VIEWER";
      return participant;
    }


    getParticipantChip(participantList) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            child:ListView.builder(
            shrinkWrap: true,
            itemCount: participantList.length,
            itemBuilder: (BuildContext context, int index) {
              return new Column(
                children: <Widget>[
                  new   ChoiceChip(
                      label: participantList[index].standardName,
                      selected: true,
                      /*onSelected: (selected) {
                  setState(() {
                    isSelected = selected;
                  });
                },*/
                      avatar: Icon(
                        Icons.cancel,
                        color: Colors.red,
                      )
                  ),
                ],
              );
            }),),
      );
    }


    Future< Map<Standard,List<EventKeyPojo>>> getStandards() async {
      StandardActivity standardActivity = new StandardActivity();
      List<Standard>_standardList = await standardActivity.getStandardListFromLocalDB();
      Map<Standard,List<EventKeyPojo>> _standards = prePareMap(_standardList);
      return _standards;
    }

    Future<List<Person>> getPersons() async {
      ParticipantBloc participantBloc = new ParticipantBloc(1);
      List<Person> _personLit = await participantBloc.getInitialList();
      return _personLit;
    }

    Map<Standard, List<EventKeyPojo>> prePareMap(List<Standard> standardList) {


      Map<Standard,List<EventKeyPojo>> standardMap = new Map();

      for(Standard standard in standardList){
        List<EventKeyPojo> eventKeyPojoList = getEventPojo(standard);
        standardMap[standard] = eventKeyPojoList;
      }
      return standardMap;
    }

   _callPersonalParticipant() async {
    // List<Person> _personLit = await getPersons();
     Navigator.push (
       context ,
       MaterialPageRoute (
           builder: ( context ) => PersonalParticipantUI(
              // personList: _personLit,
               data: widget.event.personalParticipant,
               callback: (List<Participant> value){

                 //widget.event.personalParticipant.clear();
                 for(int i=0;i<value.length;i++){
                   party.add(value[i]);
                   widget.event.personalParticipant.add(value[i]);
                   widget.event.eventParticipant.add(value[i]);
                 }
                 //  widget.event.personalParticipant = party;
                 print("callBack Return ${value.length}");
               }
           )
       ) ,
     );
   }

  }