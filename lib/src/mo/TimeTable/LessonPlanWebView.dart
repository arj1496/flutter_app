import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/src/mo/TimeTable/CounterStorage.dart';
import 'package:flutter_app/src/mo/TimeTable/NewsFeed.dart';
import 'package:flutter_app/src/mo/TimeTable/NewsFeedPage.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LessonPlanWebView extends StatefulWidget {
  @override
  _LessonPlanWebViewState createState() => _LessonPlanWebViewState();
}

class _LessonPlanWebViewState extends State<LessonPlanWebView> {

  final scaffoldKey = GlobalKey<ScaffoldState>();
  String filePath = "assets/images/test.html";
  WebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        title: Text("Syllabus Repo."),
      ),
      body: getWebView(),
      floatingActionButton: SpeedDial(
        marginRight: 18,
        marginBottom: 20,
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22.0),
        children: [
          /*SpeedDialChild(
            child: Icon(Icons.accessibility),
            backgroundColor: Colors.red,
            label: 'First',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: _incrementCounter,
          ),
          SpeedDialChild(
            child: Icon(Icons.brush),
            backgroundColor: Colors.blue,
            label: 'Second',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: _incrementCounter1,
          ),*/
          SpeedDialChild(
            child: Icon(Icons.widgets),
            backgroundColor: Colors.blue,
            label: 'Get All Pages',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: getAllPages,

          ),
          SpeedDialChild(
            child: Icon(Icons.announcement),
            backgroundColor: Colors.blue,
            label: 'Lesson Plan',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: openNewsFeed,

          ),
        ],
      ),
    );
  }

  getWebView() {
    return WebView(
      initialUrl: '',
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController1){
        webViewController = webViewController1;
        loadHtmlFromAssets(filePath);
      },
      javascriptChannels: Set.from([
        JavascriptChannel(
            name: 'flutter_fn',
            onMessageReceived: (JavascriptMessage message) {
              print("Flutter Fn Called");
              print(message.message);
            }),
        JavascriptChannel(
            name: 'flutter_fn1',
            onMessageReceived: (JavascriptMessage message) {
              // print("Flutter Fn  1 Called");
              print(message.message);
            }),
        // we can have more than one channels
      ]),
    );
  }

  loadHtmlFromAssets(String filePath) async{
    String fileHtmlContents = await rootBundle.loadString(filePath);
    webViewController.loadUrl(
        Uri.dataFromString(fileHtmlContents, mimeType: 'text/html', encoding: Encoding.getByName('utf-8')).toString()
    );
  }

  getAllPages() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewsFeed(title: 'Flutter Demo Home Page', storage: CounterStorage())),
    );
  }

  openNewsFeed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewsFeedPage(title: 'Flutter Demo Home Page', storage: CounterStorage())),
    );
  }
}
