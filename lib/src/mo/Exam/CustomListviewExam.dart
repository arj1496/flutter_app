import 'package:flutter/material.dart';
import 'package:flutter_app/src/mo/Exam/ExamService.dart';

import '../../../AppTheme.dart';
import 'Exam.dart';




class CustomListviewExam extends StatefulWidget {
  @override
  _ListTileViewUVState createState() => _ListTileViewUVState();
}

class _ListTileViewUVState extends State<CustomListviewExam> {

  List<Exam> list;

  @override
  void initState() {
    ExamService examService = new ExamService();
    list = examService.getAllExam();
  }

  @override
  Widget build(BuildContext context) {
    return _getListViewWithBuilder();
  }

  Widget _getListViewWithBuilder() {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppTheme.background,
          title: Text("Exams"),
        ),

        body: ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext ctxt, int Index){
              return _listTileViewUV(list[Index]);
            }
        ),
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
                                        '120',
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
                                              'Unit test -1',
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
                                                  'Marathi',
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
                                              'Class -1',
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
                                    '2-Oct',
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
                                      'Ramlingam',
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
}
