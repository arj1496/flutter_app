import 'package:flutter/material.dart';
import 'package:flutter_app/AddFormUI.dart';
import 'package:flutter_app/AlertDialogBoxTypes.dart';
import 'package:flutter_app/DetailViewUV.dart';
import 'package:flutter_app/src/mo/FileDownloadAndUpload/DonloadUploadWidget.dart';
import 'package:flutter_app/src/mo/FileDownloadAndUpload/DownloadUpload.dart';
import 'package:flutter_app/ListTileViewUV.dart';
import 'package:flutter_app/ListViewUV.dart';
import 'package:flutter_app/StudentDetailsWithDialog.dart';
import 'package:flutter_app/src/mo/Analytics/Analytics.dart';
import 'package:flutter_app/src/mo/Analytics/AnalyticsActivity.dart';
import 'package:flutter_app/urvesh.dart';

import 'AppTheme.dart';
import 'HeaderContainer.dart';
import 'Subject/SubjectList.dart';
import 'src/Student Dashboard/StudentDashboard.dart';

class UrveshNew extends StatefulWidget {
  @override
  _UrveshNewState createState() => _UrveshNewState();
}

class _UrveshNewState extends State<UrveshNew> {

  List<Widget> customWidget = [
    HeaderContainer.init("Events", "test"),
    ListViewUV(),ListViewUV(),ListViewUV(),ListViewUV(),ListViewUV(),ListViewUV(),ListViewUV(),ListViewUV()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Urvesh New Home Page"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute( builder: (context) => UrveshHome()),
                  );
                },
                child: Text('Login'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute( builder: (context) => DetailViewUV.init(customWidget)),
                  );
                },
                child: Text('List View With Container'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute( builder: (context) => ListTileViewUV()),
                  );
                },
                child: Text('List View With ListTile and Builder'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute( builder: (context) => AlertDialogBoxTypes()),
                  );
                },
                child: Text('AlertDialog box Types'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute( builder: (context) => StudentDetailWithDialog()),
                  );
                },
                child: Text('Student Home Page'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute( builder: (context) => StudentDashboard()),
                  );
                },
                child: Text('Student Dashboard'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute( builder: (context) => DownloadUploadWidget()),
                  );
                },
                child: Text('File Download & Upload'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute( builder: (context) => SubjectList()),
                  );
                },
                child: Text('Subject List'),
              ),
            ],
          ),
        ),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> AddFormUI()));
          },
          backgroundColor: AppTheme.background,
          child: Icon(
            Icons.add,
            size: 32,
          ),
        )
    );
  }
}
