import 'package:flutter/material.dart';

class AlertDialogBoxTypes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Alert Dialog Boxes Types"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: null,
          ),
        ],
      ),
        body: Builder(builder: (context){
          return  SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top : 5, bottom: 5, left: 5, right: 5),
                child: Column(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        createAlertDialogBox(context).then((onValue) {
                          SnackBar snackBar = SnackBar(
                            content: Text('Hello  : ${onValue}'),
                          );
                          Scaffold.of(context).showSnackBar(snackBar);
                        });
                      },
                      child: Text('Dialog Button 1'),
                    ),
                  ],
                ),
              ),
            );
        })
    );
  }

  Future<String> createAlertDialogBox(BuildContext context) {
    TextEditingController textEditingController = new TextEditingController();
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Hello"),
            content: TextField(
              controller: textEditingController,
            ),
            actions: <Widget>[
              MaterialButton(
                child: Text("Submit"),
                onPressed: (){
                  Navigator.of(context).pop(textEditingController.text.toString());
                }
              )
            ],
          );
        }
    );
  }
}
