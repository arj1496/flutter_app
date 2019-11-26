import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/mo/Assessments/Assessment.dart';
import '../../../AppTheme.dart';
import 'SkillDataDump.dart';

class ObservationPage extends StatefulWidget {
  Assessment assessment = new Assessment();

  ObservationPage({@required Assessment object})
      : assert(object != null),
        this.assessment = object;

  @override
  _ObservationPageState createState() => _ObservationPageState();
}

class _ObservationPageState extends State<ObservationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Observations'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.sync),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
      body: getObservationFromSkill(widget.assessment),/*widget.assessment.skillDataDump*/ //assessmentListView(),
    );
  }
}
getObservationFromSkill(assessment){
  Map<String, dynamic> getObservation = json.decode(assessment.skillDataDump);
  SkillDataDump skillDataDump = SkillDataDump.fromJsonLocal(getObservation);


  return Container(
    child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return observations(skillDataDump);
        }),
  );
}

Widget observations(skillDataDump) {
  return GestureDetector(
    onTap: () {
      print("hello");
      // createAlertDialogBox(context, subject);
    },
    child: Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 2, bottom: 3),
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
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(left: 2, right: 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, bottom: 40.0),
                                child: Text(
                                  "skillDataDump",
                                  /*"Observation Name",*/
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: AppTheme.robotoFontName,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    letterSpacing: -0.1,
                                    color: AppTheme.darkerText,
                                  ),
                                ),
                              ),
                            ],
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
                                      "Status",
                                      style: TextStyle(
                                        fontFamily: AppTheme.robotoFontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        letterSpacing: -0.2,
                                        color: AppTheme.darkText,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: MaterialButton(
                                          color: Colors.black12,
                                          child: Text(
                                            "Create Result",
                                          ),
                                          onPressed: () {}),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ])),
          ],
        ),
      ),
    ),
  );
}
