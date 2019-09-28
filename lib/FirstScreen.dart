import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class  FirstScreen extends StatelessWidget {
  TextEditingController _textController =
  TextEditingController(text: 'https://');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Open Web Page URL in webview")),
      body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: _textController,
                ),
              ),
              RaisedButton(
                child: Text("Goto Webpage"),
                color: Colors.red,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute<Null>(builder: (BuildContext context) {
                        return new WebViewWebPage(url: _textController.text);
                      }));
                },
              ),
            ],
          )),
    );
  }
}

class WebViewWebPage extends StatelessWidget {
  final String url;

  WebViewWebPage({this.url});

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: url,
      hidden: true,
      appBar: AppBar(title: Text("Open Web Page URL in webview")),
    );
  }
}