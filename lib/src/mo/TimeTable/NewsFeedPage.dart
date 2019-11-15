
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/src/mo/TimeTable/CounterStorage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsFeedPage extends StatefulWidget {
  final CounterStorage storage;
  final String title;

  NewsFeedPage({Key key, this.title,  @required this.storage}) : super(key: key);

  @override
  _NewsFeedPageState createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  WebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    Future<String> filePath =  getFilePath();
    return  Scaffold(
        appBar: AppBar(title: Text('Lesson Plan')),
        body: FutureBuilder(
            future: filePath,
            builder: (BuildContext context, AsyncSnapshot snapshot){
              switch (snapshot.connectionState) {
                case ConnectionState.none: return new Text('Press button to start');
                case ConnectionState.waiting: return new Text('Awaiting result...');
                default:
                  if (snapshot.hasError)
                    return new Text('Error: ${snapshot.error}');
                  else
                    return getWebViewWidget(context, snapshot);
              }
            }
        )
    );
  }

  Future<String> getFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    final path  =  directory.path;

    final filePath = '$path/add_edit_lesson_plan_mobile.html';



    ByteData bytes = await rootBundle.load('assets/clip.png');
    print(bytes);

    return filePath;

  }

  Widget getWebViewWidget(BuildContext context, AsyncSnapshot snapshot ){
    var test = snapshot.data;
    return WebView(
        initialUrl: test,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController1){
          webViewController = webViewController1;
          loadHtmlFromAssets(test);
        }
    );
  }

  loadHtmlFromAssets(filePath) async{
    if(filePath != null){
      File file = File(filePath);
      String fileText = await file.readAsString();
      print(fileText);
      webViewController.loadUrl(
          Uri.dataFromString(fileText, mimeType: 'text/html', encoding: Encoding.getByName('utf-8')).toString());
    }
  }
}

