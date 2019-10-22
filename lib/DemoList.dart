import 'package:flutter/material.dart';
import 'package:flutter_app/DetailView2Oct.dart';
import 'package:flutter_app/src/mo/Exam/Exam.dart';
import 'package:flutter_app/src/mo/Exam/ExamActivity.dart';
import 'package:flutter_app/src/mo/Exam/ExamService.dart';

import 'AppTheme.dart';



class DemoList extends StatefulWidget {
  @override
  _ListTileViewUVState createState() => _ListTileViewUVState();
}

class _ListTileViewUVState extends State<DemoList> {


  ExamService examService = new ExamService();
  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    ExamActivity examActivity = new ExamActivity();
    Future<List<Exam>> examListFuture = examActivity.getJoinDbExam();

    var futureBuilder = new FutureBuilder(
        future: examListFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return _getListViewWithBuilder(context, snapshot);
        }
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppTheme.background,
        title: Text("Exam"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            // onPressed: synEvents,
          ),
          /* IconButton(
            icon: Icon(Icons.get_app),
            onPressed: getEvent,
          ),*/
        ],
      ),
      body: futureBuilder,
    );
    //return _getListViewWithBuilder();
  }

  Widget _getListViewWithBuilder(BuildContext context, AsyncSnapshot snapshot) {
    List<Exam> examList = snapshot.data;

    return Container(
      color: AppTheme.background,
      child:ListView.builder(
          itemCount: examList.length,
          itemBuilder: (BuildContext ctxt, int Index){
            return examList != null && examList.length > 0  ?  _listTileViewUV(examList[Index]) : _listNotFound();
          }
      ),

    );
  }

  Widget _listTileViewUV(data) {
    return Padding(
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

            // this Padding is Used to render the Horizontal line Starts

            // this Padding is Used to render the Horizontal line Ends


            // this Padding is Used to render the Horizontal line Starts



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
                                  data.totalMark.toString(),
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
                 /* Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              data.owner,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: AppTheme.robotoFontName,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                letterSpacing: -0.2,
                                color: AppTheme.darkText,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Text(
                                'Created By',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: AppTheme.robotoFontName,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: AppTheme.grey
                                      .withOpacity(0.5),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),*/
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
                                  MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: <Widget>[

                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 1, bottom: 2),
                                      child: Text(
                                        data.examName,
                                        textAlign: TextAlign.center,
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
                                            data.subName,
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
                                       data.stdName,
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
                                            'Term-A',
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
                              data.examDate.toString(),
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
    );

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
}
