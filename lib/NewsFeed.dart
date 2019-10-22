import 'dart:collection';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/UrlUtils.dart';
import 'package:flutter_app/src/mo/Exam/ExamService.dart';
import 'package:flutter_app/src/mo/NewsFeed/WevViewActivity.dart';
import 'package:path_provider/path_provider.dart';

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
    getFileFromServer();
    super.initState();
    widget.storage.readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  Future<File> _incrementCounter() {
    setState(() {
      _counter++;
    });

    // Write the variable as a string to the file.
    return widget.storage.writeCounter(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Reading and Writing Files')),
        body: Center(
          child: Text('Button tapped $_counter time${_counter == 1 ? '' : 's'}.',),
    ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        )
    );
  }
}

void getFileFromServer() async{
  //Call Rest Service
  WebViewActivity webViewActivity = new WebViewActivity();
  UrlUtils urlUtils = new UrlUtils();
  HashMap map = new HashMap<String, String>();
  String url=  urlUtils.getNewsFeedUrl();
  Map<String, dynamic> webViewFromServer = await  webViewActivity.getData_(map, url);
  var files = webViewFromServer["files"];

  String test = "123";
  //getData_
}

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      String contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }
}