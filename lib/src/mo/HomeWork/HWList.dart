import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/fr/SchoolUtils.dart';
import 'package:flutter_app/src/mo/Exam/ExamAddPage.dart';
import 'package:flutter_app/src/mo/HomeWork/HWDetail.dart';
import 'package:flutter_app/src/mo/HomeWork/HomeworkAdd.dart';

import '../../../AppTheme.dart';
import '../../../DetailView2Oct.dart';
import 'HomeWork.dart';
import 'HomeworkActivity.dart';

class HWList extends StatefulWidget {
  @override
  _ListTileViewUVState createState() => _ListTileViewUVState();
}

class _ListTileViewUVState extends State<HWList> {

  HomeworkActivity homeworkActivity = new HomeworkActivity();
  SchoolUtils schoolUtils = new SchoolUtils();
  @override
  void initState() {}

  Future<Map<String,List<HomeWork>>> getData() async{
    Map<String,List<HomeWork>> HWList = await homeworkActivity.getLocalDbHomework();
    return HWList;
  }

  @override
  Widget build(BuildContext context) {

    var futureBuilder = new FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot){

          return Padding(
            padding: const EdgeInsets.only(top:4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
                children: _getListViewWithBuilder(context, snapshot),

            ),
          );
        }
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppTheme.background,
        title: Text("Homework"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.filter),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeworkAdd()),
              );
            },
          ),

        ],
      ),
      body: SingleChildScrollView(
           child: Column(
             children: <Widget>[
              futureBuilder,
             ],
           )

    ),);

  }

   List<Widget> _getListViewWithBuilder(BuildContext context, AsyncSnapshot snapshot) {
    Map<String,List<HomeWork>> hwList = snapshot.data;
    List<Widget> wigetList = new List();
     for(String key in hwList.keys){
       List<HomeWork> homeworkList = hwList[key];
       wigetList.add(getListOfWidgets(key,homeworkList));
     }
     return wigetList;
  }

  getListOfWidgets(key,homeworkList){
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: HexColor("#D7E0F9"),
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
                  padding: const EdgeInsets.only(
                      left: 0, bottom: 12, right: 200, top: 8),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right:0.0),
                      child: Text(
                        key,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: AppTheme.robotoFontName,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          letterSpacing: 0.0,
                          color: AppTheme.nearlyDarkBlue
                              .withOpacity(0.6),
                        ),
                      ),
                    ),
                  ),

                ),

              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: AppTheme.background,
            child: ListView.builder(
                physics:  NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount:homeworkList.length,
                itemBuilder: (BuildContext ctxt, int Index){
                  return homeworkList != null && homeworkList.length > 0  ?  _renderlistTileView(homeworkList[Index]) : _listNotFound();
                }

            ),
          ),
        ),
      ],);
  }
// Pass exam field to widget constructur to fill in the exam detail page
  Widget _renderlistTileView(data) {

    return  GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HWDetail(data),
          ),
        );
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
                      padding: const EdgeInsets.only(
                          left: 10, right: 1, top: 3, bottom: 8
                      ),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding:  EdgeInsets.only(right: 0),
                            // child: Center(
                            child: Stack(
                              overflow: Overflow.visible,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: AppTheme.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(100.0),
                                      ),
                                      border: new Border.all(
                                          width: 2,
                                          color: AppTheme
                                              .nearlyDarkBlue
                                              .withOpacity(0.2)),
                                      //color:HexColor("#FF5287"),),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text(

                                          data.mark.toString(),
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontFamily:
                                            AppTheme.robotoFontName,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14,
                                            letterSpacing: 0.0,
                                            color: AppTheme
                                                .nearlyDarkBlue,
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            //),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 5, top: 8, bottom: 8
                            ),
                            child: Container(
                              height: 2,
                              decoration: BoxDecoration(
                                color: AppTheme.background,
                                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                              ),
                            ),
                          ),

                          Expanded(
                            child: Padding(
                              padding:  EdgeInsets.only(
                                  left: 0, right: 0, top: 4),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[

                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 1, bottom: 2),
                                              child:new  Text(
                                                data.title,
                                                textAlign: TextAlign.left,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontFamily:
                                                  AppTheme.robotoFontName,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  letterSpacing: -0.1,
                                                  color: AppTheme.darkerText
                                                  ,
                                                ),
                                              ),
                                            ),

                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      left: 2, bottom: 3),
                                                  child:
                                                  Text(
                                                    data.subjectName,
                                                    overflow: TextOverflow.ellipsis,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontFamily:
                                                        AppTheme
                                                            .robotoFontName,
                                                        fontWeight:
                                                        FontWeight.w600,
                                                        fontSize: 12,
                                                        color: Colors.green
                                                    ),
                                                  ),
                                                ),

                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),

                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 1, bottom: 2),
                                              child: Text(
                                                data.className,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily:
                                                  AppTheme.robotoFontName,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  letterSpacing: -0.1,
                                                  color: AppTheme.darkerText,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      left: 1, bottom: 3),
                                                  child: Text(
                                                    'Term A',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontFamily:
                                                        AppTheme
                                                            .robotoFontName,
                                                        fontWeight:
                                                        FontWeight.w600,
                                                        fontSize: 12,
                                                        color: Colors.red
                                                    ),
                                                  ),
                                                ),
                                              ],

                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
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
                                      //new DateTime.fromMillisecondsSinceEpoch(data.examDate).toString(),
                                      schoolUtils.getDateStringFromLongWithSchoolTimeZone(data.endDate),
                                      style: TextStyle(
                                        fontFamily: AppTheme.robotoFontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        letterSpacing: -0.2,
                                        color: AppTheme.darkText,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: Text(
                                        data.owner,
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
            ],
          ),
        ),
      ),);
  }

  Widget _listNotFound(){
    return Padding(
      padding: const EdgeInsets.only(
          left: 10, right: 10, top: 3, bottom: 3
      ),
      child: Container(
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
                    /*child: Text(
                        'Title',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: AppTheme.robotoFontName,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            letterSpacing: -0.1,
                            color: AppTheme.darkText),
                      ),*/
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
  Widget _buildAboutDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('About Pop up'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Hello"),
          Text("welcome"),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Okay, got it!'),
        ),
      ],
    );
  }
}