import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_app/CustomAppbar.dart';
import 'package:flutter_app/FilePickerDemo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path/path.dart' as fileUtil;


class SubmissionPageUI extends StatefulWidget {

  String title = null;

  @override
  State<StatefulWidget> createState() {
    return DetailViewUVState();
  }



}

class DetailViewUVState extends State<SubmissionPageUI> {

  File _imageFile;
  String title = null;
  int groupValue=1;
  List<File> _fileList = new List();
  Map<String,String> _filePath = new Map();
  Map<String,String> filePath = new Map();

  /* DetailViewUVState(List<Widget> customWidget,title){
    this.customWidget = customWidget;
    this.title = title;
  }*/


  @override
  Widget build( BuildContext context ) {
    return _getContainerWidget ( );
  }

  Widget _getContainerWidget( ) {
    return Container (
      color: AppTheme.background ,
      child: _getNormalScaffold ( ) ,
    );
  }

  _getNormalScaffold( ) {
    return Scaffold (
      appBar: CustomAppbar.init ( " " ) ,
      //backgroundColor: Colors.transparent,
      body: SingleChildScrollView(

      child:Column (
        mainAxisSize: MainAxisSize.min,
          children: _getWidget ( ) ,
        ) ,
      ),
    );
  }

  List<Widget> _getWidget( ) {
    List<Widget> examWidget2 = [
      getSubmisionContainer ( ) ,
      getFileContainer(),
      //_buildPreviewImage(),
      submitButton ( ) ,
    ];
    return examWidget2;
  }


  submitButton( ) {
    return Padding (
      padding: EdgeInsets.only ( bottom: 5 , top: 30 , left: 10 , right: 10 ) ,
      child: Row (
        children: <Widget>[Material ( //Wrap with Material
          shape: RoundedRectangleBorder (
              borderRadius: new BorderRadius.circular( 24.0 ) ,
              side: BorderSide ( color: AppTheme.nearlyBlue )
          ) ,
          //elevation: 16.0,
          clipBehavior: Clip.antiAlias , // Add This
          child: MaterialButton (
            minWidth: 150.0 ,
            height: 35 ,
            child: new Text( "SAVE" ,
                style: new TextStyle(
                    fontSize: 12.0 , color: AppTheme.nearlyBlue ) ) ,
            onPressed: ( ) {
              /*Navigator.push (
                context ,
                MaterialPageRoute (
                    builder: ( context ) => HomeworkEdit ( homeWork ) ) ,
              );*/
            } ,
          ) ,
        ) ,

          Padding (
            padding: const EdgeInsets.all( 8.0 ) ,
            child: Material ( //Wrap with Material
              shape: RoundedRectangleBorder (
                  borderRadius: new BorderRadius.circular( 24.0 ) ,
                  side: BorderSide ( color: AppTheme.nearlyBlue )
              ) ,
              //elevation: 16.0,
              clipBehavior: Clip.antiAlias , // Add This
              child: MaterialButton (
                minWidth: 150.0 ,
                height: 35 ,
                child: new Text( "BACK" ,
                    style: new TextStyle(
                        fontSize: 12.0 , color: AppTheme.nearlyBlue ) ) ,
                onPressed: ( ) {
                  Navigator.pop ( context );
                } ,
              ) ,
            ) ,
          ) ,
        ] ,
      ) ,
    );

    //return ButtonUI2.init(_formKey, genericModel,'DRAFT','PUBLISH','CLOSE',exam);

  }

  getSubmisionContainer( ) {
    return Padding (
      padding: EdgeInsets.only (
          top: 1 ,
          left: 8 ,
          right: 8 ,
          bottom: 8
      ) ,
      child: new Container (
        width: 800 ,
        height: 170 ,
        alignment: Alignment.topLeft ,
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
                blurRadius: 10.0 ) ,
          ] ,
        ) ,
        child: Row (
          children: <Widget>[
            Expanded (
              child: Padding (
                padding: const EdgeInsets.only(
                    left: 8 , right: 8 , top: 0
                ) ,
                child: Column (
                  children: <Widget>[
                    Row (
                      children: <Widget>[
                        Padding (
                          padding: const EdgeInsets.all( 0.0 ) ,
                          child: Column (
                            mainAxisAlignment:
                            MainAxisAlignment.center ,
                            crossAxisAlignment:
                            CrossAxisAlignment.start ,
                            children: <Widget>[
                              Padding (
                                padding: const EdgeInsets.only(
                                    left: 4 , bottom: 2 ) ,
                                child: Text (
                                  'Work Status:--' ,
                                  textAlign: TextAlign.center ,
                                  style: TextStyle (
                                    fontFamily:
                                    AppTheme.robotoFontName ,
                                    fontWeight: FontWeight.w500 ,
                                    fontSize: 16 ,
                                    letterSpacing: -0.1 ,
                                    color: AppTheme.nearlyBlack
                                        .withOpacity ( 0.7 ) ,
                                  ) ,
                                ) ,
                              ) ,

                              Row (
                                children: <Widget>[
                                  new Radio(
                                    value: 1 ,
                                    groupValue: groupValue ,
                                    onChanged: ( int e ) => selectGender ( e ) ,
                                    activeColor: Colors.lightBlue ,
                                  ) ,
                                  Text ( "Completed" ) ,
                                ] ,
                              ) ,
                              Row (
                                children: <Widget>[
                                  new Radio(
                                    value: 2 ,
                                    groupValue: groupValue ,
                                    onChanged: ( int e ) => selectGender ( e ) ,
                                    activeColor: Colors.lightBlue ,
                                  ) ,
                                  Text ( "Submitted" ) ,
                                ] ,
                              ) ,
                            ] , ) ,
                        ) ,
                      ] ,
                    ) ,
                    Row (
                      mainAxisAlignment:
                      MainAxisAlignment.start ,
                      crossAxisAlignment:
                      CrossAxisAlignment.end ,
                      children: <Widget>[
                        Padding (
                          padding: const EdgeInsets.only( left: 10.0 ) ,
                          child: Text (
                            "Click here for attach submission file" ,
                            // textAlign: TextAlign.center,
                            style: TextStyle (
                              fontFamily: AppTheme.robotoFontName ,
                              fontWeight: FontWeight.w500 ,
                              fontSize: 12 ,
                              letterSpacing: -0.1 ,
                              color: AppTheme.grey.withOpacity ( 0.5 ) ,
                            ) ,
                          ) ,
                        ) ,

                        Padding (
                          padding:
                          EdgeInsets.only (
                              left: 50 , top: 3 ) ,
                          child: MaterialButton (
                            color: HexColor ( "#6F56E8" ) ,
                            minWidth: 20.0 ,
                            height: 30 ,
                            child: new Icon( Icons.attachment ) ,
                            onPressed: ( ) {
                              getFilePath ( );
                            } ,
                          ) ,
                        ) ,

                      ] ,
                    ) ,

                  ] ,
                ) ,
              ) ,

            ) ,
          ] ,
        ) ,
      ) , );
  }

  getSubmissionButton( ) {
    return Padding (
      padding: EdgeInsets.only ( bottom: 0 , top: 30 , left: 5 , right: 0 ) ,
      child: Row (
        children: <Widget>[Material ( //Wrap with Material
          shape: RoundedRectangleBorder (
            /*borderRadius: new BorderRadius.circular( 24.0 ) ,*/
              side: BorderSide ( color: AppTheme.nearlyBlue )
          ) ,
          //elevation: 16.0,
          clipBehavior: Clip.antiAlias , // Add This
          child: MaterialButton (

            minWidth: 350.0 ,
            height: 35 ,
            child: new Text( "Submission" ,
                style: new TextStyle(
                    fontSize: 12.0 , color: AppTheme.nearlyBlue ) ) ,
            onPressed: ( ) {
              Navigator.push (
                context ,
                MaterialPageRoute (
                    builder: ( context ) => FilePickerDemo ( ) ) ,
              );
            } ,
          ) ,
        ) ,
        ] ,
      ) ,
    );
  }

 /* getFileContainer( ) {
    return Padding (
      padding: const EdgeInsets.only( left: 8.0 , right: 8 ) ,
      child: Container (
        width: 800 ,
        height: 400 ,
        alignment: Alignment.topLeft ,
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
                blurRadius: 10.0 ) ,
          ] ,
        ) ,

      ) ,
    );
  }*/

  Widget getFileContainer() {
    return Padding(
      padding: const EdgeInsets.only(left:8.0,right:8),
      child: Container(
        height: 400,
        alignment: Alignment.topLeft,
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
                blurRadius: 10.0),
          ],
        ),

                child: Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child:new GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 4.0,
                        crossAxisSpacing: 4.0,
                        children: _buildPreviewImage(),
                      ),

          ),
    ),);


  }

  void selectGender( int select ) {
    getFilePath ();
    setState ( () {
      if (select == 1) {
        groupValue = 1;
      }
      else {
        groupValue = 2;
      }
    } );
  }

  void getFilePath( ) async {
    try {
      Map<String,String> filePath = await FilePicker.getMultiFilePath ( type: FileType.ANY );
      if (filePath == '') {
        return;
      }

      setState ( ( ) {
        _filePath.addAll(filePath) ;
        //_imageFile = File ( filePath );
      } );
    } catch (e) {
      print ( "Error while picking the file: " + e.toString ( ) );
    }
  }

   _buildPreviewImage( ) {
    List<Widget> widgetList = new List();
    if (_filePath == null) {
      return Container (
        height: 50,
        width: 50,
        alignment: Alignment.center ,

      );
    } else if (_filePath != null)
         for(String key in _filePath.keys){
            if(['.jpg' , 'jpeg' , '.bmp' , '.png'].contains ( fileUtil.extension ( _filePath[key] ) ))
              {
                widgetList.add(_imageIcon(File(_filePath[key])));
              }else if( ['.pdf' , 'doc' ].contains ( fileUtil.extension ( _filePath[key] ) )){
              widgetList.add(Icon(FontAwesomeIcons.filePdf));
              }
         }
       return widgetList;
    }

    _imageIcon(filePathString){
      return Stack(

        children: <Widget>[
          Image.file(
            filePathString,
          ),
          Positioned(
            child: GestureDetector(
              onTap: (){
                deleteImage(filePathString);
              },
              child: Container(
                // margin: EdgeInsets.only(left: 85),


                  child: Icon(
                      Icons.cancel
                  ),
                ),
              ),
            ),

        ],
      );
    }

  void deleteImage(filePathString) {
    print(filePathString);
     filePath.remove(filePathString);
    print(_filePath.length);
  }

  }



