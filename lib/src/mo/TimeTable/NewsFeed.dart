import 'dart:collection';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/UrlUtils.dart';
import 'package:flutter_app/src/mo/NewsFeed/WevViewActivity.dart';
import 'package:flutter_app/src/mo/TimeTable/CounterStorage.dart';

class NewsFeed extends StatefulWidget {
  final CounterStorage storage;
  NewsFeed({Key key, this.title,  @required this.storage}) : super(key: key);


  final String title;
  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  int _counter;

  @override
  void initState() {
    super.initState();
    getFileFromServer();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Reading and Writing Files')),
        body: Center(
          child: Text('Button tapped $_counter time${_counter == 1 ? '' : 's'}.',),
    ),

    );
  }
}
 getFileFromServer() async{
  //Call Rest Service
  WebViewActivity webViewActivity = new WebViewActivity();
  UrlUtils urlUtils = new UrlUtils();
  HashMap map = new HashMap<String, String>();
  String url = urlUtils.getNewsFeedUrl();
  Map<String, dynamic> webViewFromServer = await webViewActivity.getData(map, url);
  List files = webViewFromServer["files"];
  if(files != null && files.length > 0){
    for(int i = 0; i < files.length; i++ ) {
      await crateFile(files[i]);
      print('File created ${files[i]}');
    }
  }
}

crateFile( Map<String, dynamic> fileObject) async{
  CounterStorage counterStorage = new CounterStorage();
  String fileData = fileObject["file"];
  String fileName = fileObject["fileName"];
  String path = await counterStorage.getLocalPath();
  File file = new File('$path/$fileName');
  await file.writeAsString(fileData);
  print('saved');
  String text = await file.readAsString();
  print(text);
}

