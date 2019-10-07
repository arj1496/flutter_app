import 'package:flutter/material.dart';
import 'package:flutter_app/AppTheme.dart';

import 'DescriptionCustomView.dart';
import 'ListTileViewUV.dart';
import 'PropertyService.dart';

class DetailViewUV extends StatefulWidget {
  List<Widget> customWidget = new List();
  @override
  State<StatefulWidget> createState() {
    return DetailViewUVState(customWidget);
  }
  DetailViewUV.init(List<Widget> customWidget ){
    this.customWidget = customWidget;
  }
}

class DetailViewUVState extends State<DetailViewUV>{

  List<Widget> customWidget = new List();
  DetailViewUVState(List<Widget> customWidget){
    this.customWidget = customWidget;
  }


  @override
  Widget build(BuildContext context) {
    return _getContainerWidget();
  }

  Widget _getContainerWidget() {
    return Container(
      color: AppTheme.background,
      child: _getNormalScaffold(),
    );
  }

  _getNormalScaffold() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: _getWidget(),
        ),

      ),
    );
  }

  List<Widget> _getWidget(){
    return this.customWidget;
  }

  /*Widget _getListViewWithBuilder() {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView.builder(
            controller: ScrollController(),
            itemCount: list.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext ctxt, int Index){
              return _listTileViewUV();
            }
        ),
      ),
    );
  }*/

  Widget _getHeaderColumn(){
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 12,
              bottom: 8
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Exam Detail",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: AppTheme.robotoFontName,
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      letterSpacing: 1.2,
                      //  color: FintnessAppTheme.darkerText,
                    ),
                  ),
                ),
              ),
              /*SizedBox(
                height: 38,
                width: 38,
                child: InkWell(
                  highlightColor: Colors.transparent,
                  borderRadius:
                  BorderRadius.all(Radius.circular(32.0)),
                  onTap: () {},
                  child: Center(
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      // color: FintnessAppTheme.grey,
                    ),
                  ),
                ),
              ),*/
              /*Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Icon(
                        Icons.calendar_today,
                        //color: FintnessAppTheme.grey,
                        size: 18,
                      ),
                    ),
                    Text(
                      "15 May",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: AppTheme.robotoFontName,
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        letterSpacing: -0.2,
                        // color: FintnessAppTheme.darkerText,
                      ),
                    ),
                  ],
                ),
              ),*/
              /*SizedBox(
                height: 38,
                width: 38,
                child: InkWell(
                  highlightColor: Colors.transparent,
                  borderRadius:
                  BorderRadius.all(Radius.circular(32.0)),
                  onTap: () {},
                  child: Center(
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      //color: FintnessAppTheme.grey,
                    ),
                  ),
                ),
              ),*/
            ],
          ),
        )
      ],
    );
  }

  Widget _getTest(){
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16 ,
              bottom: 12
          ),
          child: Container(
            decoration: BoxDecoration(
              //color: AppTheme.white.withOpacity(topBarOpacity),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32.0),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  // color: AppTheme.grey.withOpacity(0.4 * topBarOpacity),
                    offset: Offset(1.1, 1.1),
                    blurRadius: 10.0),
              ],
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).padding.top,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 16,
                      bottom: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "My Diary",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: AppTheme.robotoFontName,
                              fontWeight: FontWeight.w700,
                              //fontSize: 22 + 6 - 6 * topBarOpacity,
                              letterSpacing: 1.2,
                              color: AppTheme.darkerText,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 38,
                        width: 38,
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          borderRadius:
                          BorderRadius.all(Radius.circular(32.0)),
                          onTap: () {},
                          child: Center(
                            child: Icon(
                              Icons.keyboard_arrow_left,
                              color: AppTheme.grey,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                        ),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Icon(
                                Icons.calendar_today,
                                color: AppTheme.grey,
                                size: 18,
                              ),
                            ),
                            Text(
                              "15 May",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: AppTheme.robotoFontName,
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                                letterSpacing: -0.2,
                                color: AppTheme.darkerText,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 38,
                        width: 38,
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          borderRadius:
                          BorderRadius.all(Radius.circular(32.0)),
                          onTap: () {},
                          child: Center(
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              color: AppTheme.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],


    );
  }



}

