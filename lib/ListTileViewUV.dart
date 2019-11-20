import 'package:flutter/material.dart';
import 'package:flutter_app/CardDetail2Oct.dart';
import 'package:flutter_app/DateWidget.dart';
import 'package:flutter_app/DescriptionCustomView.dart';
import 'package:flutter_app/DetailView2Oct.dart';
import 'package:flutter_app/EventWidget.dart';
import 'package:flutter_app/PropertyFile.dart';
import 'package:flutter_app/TitleViewDetail.dart';
import 'package:flutter_app/src/fr/SchoolUtils.dart';
import 'package:flutter_app/src/mo/Event/AddEventForm.dart';
import 'package:flutter_app/src/mo/Event/Event.dart';
import 'package:flutter_app/src/mo/Event/EventDetail.dart';
import 'package:flutter_app/src/mo/Event/EventService.dart';
import 'package:flutter_app/src/mo/HomeWork/HomeWork.dart';
import 'package:flutter_app/src/mo/Participant/Participant.dart';

import 'AppTheme.dart';
import 'src/mo/Event/EventActivity.dart';

class ListTileViewUV extends StatefulWidget {
  @override
  _ListTileViewUVState createState() => _ListTileViewUVState();
  SchoolUtils schoolUtils = new SchoolUtils();
}

class _ListTileViewUVState extends State<ListTileViewUV> {

  List<HomeWork> list = null;
  EventActivity eventActivity = new EventActivity( );



  Future<List<Event>>  getData() async{
    List<Event> eventList = await eventActivity.getAllEvent ( );
    return eventList;
  }
  @override
  Widget build( BuildContext context ) {

    var futureBuilder = new FutureBuilder(
        future: getData(),
        builder: ( BuildContext context , AsyncSnapshot snapshot ) {
          return _getListViewWithBuilder ( context , snapshot );
        }
    );
    return Scaffold (
        appBar: AppBar (
          elevation: 0.0 ,
          backgroundColor: AppTheme.background ,
          title: Text ( "Events" ) ,
          actions: <Widget>[
            IconButton (
              icon: Icon ( Icons.filter ) ,
              onPressed: ( ) {
                Navigator.push (
                  context ,
                  MaterialPageRoute (
                      builder: ( context ) => AddEventForm ( ) ) ,
                );
              } ,
            ) ,

          ] ,
        ) ,
        body: futureBuilder ,
        floatingActionButton: FloatingActionButton (
          onPressed: ( ) {
            /*Navigator.push(context, MaterialPageRoute(builder: (context)=> AddFormUI()));*/
            Navigator.push ( context , MaterialPageRoute (
                builder: ( context ) => AddEventForm ( ) ) );
          } ,
          backgroundColor: AppTheme.background ,
          child: Icon (
            Icons.add ,
            size: 32 ,
          ) ,
        )
    );
    //return _getListViewWithBuilder();
  }

  Widget _getListViewWithBuilder( BuildContext context ,
      AsyncSnapshot snapshot ) {
    List<Event> eventList = snapshot.data;
    return Container (
      color: AppTheme.background ,
      child: ListView.builder (
          itemCount: eventList != null ? eventList.length : 0 ,
          itemBuilder: ( BuildContext ctxt , int Index ) {
            return eventList != null && eventList.length > 0 ? _listTileViewUV (
                eventList[Index] ) : _listNotFound ( );
          }
      ) ,
      /*child: Scaffold(
        */ /*appBar: AppBar(
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
        ),*/ /*
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

  Widget _listNotFound( ) {
    return Padding (
      padding: const EdgeInsets.only(
          left: 10 , right: 10 , top: 3 , bottom: 3
      ) ,
      child: Container (
        decoration: BoxDecoration (
          color: AppTheme.white ,
          borderRadius: BorderRadius.only (
              topLeft: Radius.circular ( 8.0 ) ,
              bottomLeft: Radius.circular ( 8.0 ) ,
              bottomRight: Radius.circular ( 8.0 ) ,
              topRight: Radius.circular ( 8.0 )
          ) ,
          boxShadow: <BoxShadow>[
            BoxShadow (
                color: AppTheme.grey.withOpacity ( 0.2 ) ,
                offset: Offset ( 1.1 , 1.1 ) ,
                blurRadius: 10.0
            ) ,
          ] ,
        ) ,
        child: Column (
          children: <Widget>[
            Padding (
              padding:
              const EdgeInsets.only( top: 5 , left: 5 , right: 10 ) ,
              child: Column (
                mainAxisAlignment: MainAxisAlignment.center ,
                crossAxisAlignment: CrossAxisAlignment.start ,
                children: <Widget>[
                  Padding (
                    padding: const EdgeInsets.only(
                        left: 4 , bottom: 1 , top: 5 ) ,
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
                  ) ,
                  Row (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                    crossAxisAlignment: CrossAxisAlignment.center ,
                    children: <Widget>[
                      Row (
                        mainAxisAlignment: MainAxisAlignment.center ,
                        crossAxisAlignment: CrossAxisAlignment.end ,
                        children: <Widget>[
                          Padding (
                            padding: const EdgeInsets.only(
                                left: 4 , bottom: 3
                            ) ,
                            child: Text (
                              'Event Not Found' ,
                              textAlign: TextAlign.center ,
                              style: TextStyle (
                                fontFamily: AppTheme.robotoFontName ,
                                fontWeight: FontWeight.w600 ,
                                fontSize: 18 ,
                                color: AppTheme.nearlyDarkBlue ,
                              ) ,
                            ) ,
                          ) ,
                        ] ,
                      ) ,
                    ] ,
                  )
                ] ,
              ) ,
            ) ,
          ] ,
        ) ,
      ) ,
    );
  }

  Widget _listTileViewUV( data ) {
    return GestureDetector (
      onTap: ( ) {
        getParticipants(data);
        } ,
      child: Padding (
        padding: const EdgeInsets.only(
            left: 10 , right: 10 , top: 3 , bottom: 3
        ) ,
        // This is the Main Table Container
        child: Container (
          // given Box Shadow to the Container
          decoration: BoxDecoration (
            color: AppTheme.white ,
            borderRadius: BorderRadius.only (
                topLeft: Radius.circular ( 8.0 ) ,
                bottomLeft: Radius.circular ( 8.0 ) ,
                bottomRight: Radius.circular ( 8.0 ) ,
                topRight: Radius.circular ( 8.0 )
            ) ,
            boxShadow: <BoxShadow>[
              BoxShadow (
                  color: AppTheme.grey.withOpacity ( 0.2 ) ,
                  offset: Offset ( 1.1 , 1.1 ) ,
                  blurRadius: 10.0
              ) ,
            ] ,
          ) ,
          child: Column (
            children: <Widget>[
              Padding (
                padding:
                const EdgeInsets.only( top: 5 , left: 5 , right: 10 ) ,
                child: Column (
                  mainAxisAlignment: MainAxisAlignment.center ,
                  crossAxisAlignment: CrossAxisAlignment.start ,
                  children: <Widget>[
                    Padding (
                      padding: const EdgeInsets.only(
                          left: 4 , bottom: 1 , top: 5 ) ,
                    ) ,
                    Row (
                      mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                      crossAxisAlignment: CrossAxisAlignment.center ,
                      children: <Widget>[
                        Row (
                          mainAxisAlignment: MainAxisAlignment.center ,
                          crossAxisAlignment: CrossAxisAlignment.end ,
                          children: <Widget>[
                            Padding (
                              padding: const EdgeInsets.only(
                                  left: 4 , bottom: 3
                              ) ,
                              child: Text (
                                //'Gandhi Jayanti Gandhi Jayanti',
                                data.name ,
                                textAlign: TextAlign.center ,
                                style: TextStyle (
                                  fontFamily: AppTheme.robotoFontName ,
                                  fontWeight: FontWeight.w600 ,
                                  fontSize: 18 ,
                                  color: AppTheme.nearlyDarkBlue ,
                                ) ,
                              ) ,
                            ) ,
                          ] ,
                        ) ,
                      ] ,
                    )
                  ] ,
                ) ,
              ) ,
              // this Padding is Used to render the Horizontal line Starts
              Padding (
                padding: const EdgeInsets.only(
                    left: 5 , right: 5 , top: 8 , bottom: 8
                ) ,
                child: Container (
                  height: 2 ,
                  decoration: BoxDecoration (
                    color: AppTheme.background ,
                    borderRadius: BorderRadius.all ( Radius.circular ( 4.0 ) ) ,
                  ) ,
                ) ,
              ) ,
              // this Padding is Used to render the Horizontal line Ends

              Padding (
                padding: const EdgeInsets.only(
                    left: 10 , right: 10 , top: 3 , bottom: 8
                ) ,
                child: Row (
                  children: <Widget>[
                    Expanded (
                      child: Column (
                        mainAxisAlignment: MainAxisAlignment.center ,
                        crossAxisAlignment: CrossAxisAlignment.start ,
                        children: <Widget>[
                          Text (
                            //'Fastival',
                            data.type ,
                            textAlign: TextAlign.center ,
                            style: TextStyle (
                              fontFamily: AppTheme.robotoFontName ,
                              fontWeight: FontWeight.w500 ,
                              fontSize: 16 ,
                              letterSpacing: -0.2 ,
                              color: AppTheme.darkText ,
                            ) ,
                          ) ,
                          Padding (
                            padding: const EdgeInsets.only( top: 6 ) ,
                            child: Text (
                              'Type' ,
                              textAlign: TextAlign.center ,
                              style: TextStyle (
                                fontFamily: AppTheme.robotoFontName ,
                                fontWeight: FontWeight.w600 ,
                                fontSize: 12 ,
                                color: AppTheme.grey.withOpacity ( 0.5 ) ,
                              ) ,
                            ) ,
                          ) ,
                        ] ,
                      ) ,
                    ) ,
                    Expanded (
                      child: Row (
                        mainAxisAlignment: MainAxisAlignment.center ,
                        crossAxisAlignment: CrossAxisAlignment.center ,
                        children: <Widget>[
                          Column (
                            mainAxisAlignment: MainAxisAlignment.center ,
                            crossAxisAlignment: CrossAxisAlignment.center ,
                            children: <Widget>[
                              Text ( "t" ,
                                //getDurationFromLong(data.startDate,data.endDate),
                                textAlign: TextAlign.center ,
                                style: TextStyle (
                                  fontFamily: AppTheme.robotoFontName ,
                                  fontWeight: FontWeight.w500 ,
                                  fontSize: 16 ,
                                  letterSpacing: -0.2 ,
                                  color: AppTheme.darkText ,
                                ) ,
                              ) ,
                              Padding (
                                padding: const EdgeInsets.only( top: 6 ) ,
                                child: Text (
                                  'Duration' ,
                                  textAlign: TextAlign.center ,
                                  style: TextStyle (
                                    fontFamily: AppTheme.robotoFontName ,
                                    fontWeight: FontWeight.w600 ,
                                    fontSize: 12 ,
                                    color: AppTheme.grey
                                        .withOpacity ( 0.5 ) ,
                                  ) ,
                                ) ,
                              ) ,
                            ] ,
                          ) ,
                        ] ,
                      ) ,
                    ) ,
                    Expanded (
                      child: Row (
                        mainAxisAlignment: MainAxisAlignment.end ,
                        crossAxisAlignment: CrossAxisAlignment.center ,
                        children: <Widget>[
                          Column (
                            mainAxisAlignment: MainAxisAlignment.center ,
                            crossAxisAlignment: CrossAxisAlignment.end ,

                            children: <Widget>[
                              Text (
                                //'02 Oct 2019',
                                getDateFromDataLong ( data.startDate ) ,
                                //data.startDate.toString(),

                                style: TextStyle (
                                  fontFamily: AppTheme.robotoFontName ,
                                  fontWeight: FontWeight.w500 ,
                                  fontSize: 16 ,
                                  letterSpacing: -0.2 ,
                                  color: AppTheme.darkText ,
                                ) ,
                              ) ,
                              Padding (
                                padding: const EdgeInsets.only( top: 6 ) ,
                                child: Text (
                                  'Date' ,
                                  textAlign: TextAlign.center ,
                                  style: TextStyle (
                                    fontFamily: AppTheme.robotoFontName ,
                                    fontWeight: FontWeight.w600 ,
                                    fontSize: 12 ,
                                    color: AppTheme.grey.withOpacity ( 0.5 ) ,
                                  ) ,
                                ) ,
                              ) ,
                            ] ,
                          ) ,
                        ] ,
                      ) ,
                    )
                  ] ,
                ) ,
              )
            ] ,
          ) ,
        ) ,
      ) ,
    );
  }

  String getDateFromDataLong( int dateLong ) {
    SchoolUtils schoolUtils = new SchoolUtils( );
    return schoolUtils.getDateStringFromLongWithSchoolTimeZone ( dateLong );
  }

  getParticipants(event) async {
    List<Participant> participants = await eventActivity.getParticipant(event);
    //widget.event.eventParticipant = participants;
    event.eventParticipant = participants;
    Navigator.push (
      context ,
      //DetailView2Oct is a main page with scaffold which render all details widgets.
      MaterialPageRoute ( builder: ( context ) => EventDetail ( event ) ) ,
    );
  }
}
