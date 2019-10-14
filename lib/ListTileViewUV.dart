import 'package:flutter/material.dart';
import 'package:flutter_app/AllDetailsview.dart';
import 'package:flutter_app/Buttonview.dart';
import 'package:flutter_app/CardDetail2Oct.dart';
import 'package:flutter_app/DateWidget.dart';
import 'package:flutter_app/DescriptionCustomView.dart';
import 'package:flutter_app/Descrptionview.dart';
import 'package:flutter_app/DetailView2Oct.dart';
import 'package:flutter_app/Detailview.dart';
import 'package:flutter_app/EventWidget.dart';
import 'package:flutter_app/Placeview.dart';
import 'package:flutter_app/PropertyFile.dart';
import 'package:flutter_app/PropertyService.dart';
import 'package:flutter_app/TitleViewDetail.dart';
import 'package:flutter_app/src/fr/SchoolUtils.dart';
import 'package:flutter_app/src/mo/Event/Event.dart';
import 'package:flutter_app/src/mo/Event/EventService.dart';
import 'package:flutter_app/src/mo/HomeWork/HomeWork.dart';
import 'package:flutter_app/src/mo/HomeWork/hwservice.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'AppTheme.dart';
import 'Dateview.dart';
import 'src/mo/Event/EventActivity.dart';

class ListTileViewUV extends StatefulWidget {
  @override
  _ListTileViewUVState createState() => _ListTileViewUVState();
  SchoolUtils schoolUtils = new SchoolUtils();
}

class _ListTileViewUVState extends State<ListTileViewUV> {

  List<HomeWork> list = null;
  List<Event> eventList = null;
  /*@override
  void initState()   {
    HWService hwService = new HWService();
    list = hwService.getAllHomeWork();
    EventActivity eventActivity = new EventActivity();
  }*/

  @override
  Widget build(BuildContext context) {
    EventActivity eventActivity = new EventActivity();
    Future<List<Event>> eventList1 = eventActivity.getAllEvent();
    var futureBuilder = new FutureBuilder(
        future: eventList1,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return _getListViewWithBuilder(context, snapshot);
        }
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppTheme.background,
        title: Text("Events"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: synEvents,
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
    eventList = snapshot.data;
    return Container(
      color: AppTheme.background,
      child: ListView.builder(
          itemCount: eventList != null ? eventList.length : 0,
          itemBuilder: (BuildContext ctxt, int Index){

            return eventList != null && eventList.length > 0  ?  _listTileViewUV(eventList[Index]) : _listNotFound();
          }
      ),
      /*child: Scaffold(
        *//*appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppTheme.background,
          title: Text("Events"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: synEvents,
            ),
            IconButton(
              icon: Icon(Icons.get_app),
              onPressed: getEvent,
            ),
          ],
        ),*//*
        backgroundColor: Colors.transparent,
        body: ListView.builder(
           itemCount: list.length,
           // itemCount: eventList.length,
            itemBuilder: (BuildContext ctxt, int Index){
              return _listTileViewUV(evList[Index]);
              //return _listTileViewUV(eventList[Index]);
            }
        ),
      ),*/
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
  Widget _listTileViewUV(data) {
    return GestureDetector(
      onTap: (){
        showEventDetail(data);
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
                                data.name,
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
              // this Padding is Used to render the Horizontal line Starts
              Padding(
                padding: const EdgeInsets.only(
                    left: 5, right: 5, top: 8, bottom: 8
                ),
                child: Container(
                  height: 2,
                  decoration: BoxDecoration(
                    color: AppTheme.background,
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                ),
              ),
              // this Padding is Used to render the Horizontal line Ends

              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 3, bottom: 8
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            //'Fastival',
                            data.type,
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
                              'Type',
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
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                getDurationFromLong(data.startDate,data.endDate),
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
                                  'Duration',
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
                                //'02 Oct 2019',
                                getDateFromDataLong(data.startDate),
                                //data.startDate.toString(),

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
                                  'Date',
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
      ),
    );
  }
  String getDateFromDataLong(int dateLong){
      SchoolUtils schoolUtils = new SchoolUtils();
      return schoolUtils.getDateStringFromLongWithSchoolTimeZone(dateLong);
  }
  synEvents() async{
    EventService eventService = new EventService();
    /*eventService.getEventListDataFromServer().then((value){
      setState(() {
        eventList = value;
      });
    });*/
    List<Event> evList =  await eventService.getEventListDataFromServer();
    setState(() {
      eventList = evList;
    });
  }
  getEvent(){
    EventService eventService = new EventService();
    Future<List<Event>> eventList = eventService.getEventList();
  }

  showEventDetail(data) {
    EventActivity  eventActivity = EventActivity();
    var property =  eventActivity.showEventDetail(data);
    var palceProperty = PropertyFile();
    palceProperty.label = property.placeLabel;
    palceProperty.iconData = property.placeIconData;
    palceProperty.data = property.palceData;

    var descriptionProperty = PropertyFile();
    descriptionProperty.label = property.descriptionLabel;
    descriptionProperty.iconData = property.descriptionIconData;
    descriptionProperty.data = property.descriptionData;

    List<Widget> detailWidget = [ EventWidget.init(property)];
    List<Widget> eventWidget = [
      CardDetail2Oct(detailWidget),            // It display all data in card view with curve corner.the detailwidget is a object of dart file for all details page
      DateWidget.init(property),                     // It display date in blue container
      TitleViewDetail.init(palceProperty),  // It display title of place and description in listview.
      DescriptionCustomView.init(palceProperty),  // All place data is displayed in container
      TitleViewDetail.init(descriptionProperty),
      DescriptionCustomView.init(descriptionProperty),
      //AttachmentView(),                                       // It dispay container in water mark
      //AttachmentFileView(),                                    // This display all atachment in listview.
    ];
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => DetailView2Oct.init(eventWidget,"Event"))
    );
  }

  String getDurationFromLong(startDate, endDate) {
    EventActivity eventActivity = new EventActivity();
     return eventActivity.getDurationFromLong(startDate,endDate);
  }
}
