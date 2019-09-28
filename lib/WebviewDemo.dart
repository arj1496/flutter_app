import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebviewDemo extends StatefulWidget{
  @override
  _WebviewDemoState createState() =>_WebviewDemoState();

}

class _WebviewDemoState extends State<WebviewDemo>{
  final flutterWebviewPlugin = new FlutterWebviewPlugin();


  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.close();
    flutterWebviewPlugin.onStateChanged.listen((message){
      print(message);
    });

    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      print(url);
    });


  }


  @override
  void dispose() {
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(url: 'webpage/test.html');
  }

}