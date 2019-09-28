import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:css_text/css_text.dart';
import 'dart:async';

class Thirdscreen extends StatefulWidget {
  @override
  _LoadHTMLFileToWEbViewState createState() => _LoadHTMLFileToWEbViewState();
}

class _LoadHTMLFileToWEbViewState extends State<Thirdscreen> {

  final flutterWebviewPlugin = new FlutterWebviewPlugin();


  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.onStateChanged.listen((message){
      print("message");
      print(message);
      print("onStateChanged");
    });
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _loadLocalHTML(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return WebviewScaffold(
            appBar: AppBar(title: Text("Load HTM file in WebView")),
            withJavascript: true,
            appCacheEnabled: true,
            withZoom: true,
            url: new Uri.dataFromString(snapshot.data, mimeType: 'text/html')
                .toString(),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        }
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

Future<String> _loadLocalHTML() async {
  return await rootBundle.loadString('webpage/democss.html');
}