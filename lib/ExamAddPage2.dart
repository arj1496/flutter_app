import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExamAddPage2 extends StatefulWidget {
  @override
  State createState() => YourPageState();
}

class YourPageState extends State<ExamAddPage2> {
  List<String> _standard = <String>['Class-1', 'Class-2', 'Class-3', 'Class-4', 'Class-5','Class-6', 'Class-7', 'Class-8', 'Class-9', 'Class-10'];
  TextEditingController controller = new TextEditingController();
  String filter = "Select Class";

  @override
  void initState() {
    super.initState();
    //fill countries with objects
    controller.addListener(() {
      setState(() {
        filter = controller.text;

      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(

        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Padding(
                padding: new EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
                child: new TextField(

                  style: new TextStyle(fontSize: 18.0, color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: new Icon(Icons.search),

                    //labelText: filter,
                    suffixIcon: new IconButton(
                      icon: new Icon(Icons.close),
                      onPressed: () {

                        controller.clear();
                        FocusScope.of(context).requestFocus(new FocusNode());
                      },
                    ),
                    //hintText: "Select class...",

                  ),
                  controller: controller,
                )),
            new Expanded(
              child: new Padding(
                  padding: new EdgeInsets.only(top: 8.0),
                  child: _buildListView()),
            )
          ],
        ));
  }

  Widget _buildListView() {
    return ListView.builder(

        itemCount: _standard.length,
        itemBuilder: (BuildContext context, int index) {

          if (filter == null || filter == "") {
            return _buildRow(_standard[index]);
          } else {
            if (_standard[index]
                .toLowerCase()
                .contains(filter.toLowerCase())) {
              return _buildRow(_standard[index]);
            } else {
              return new Container();
            }
          }

        }
    );
  }

  Widget _buildRow(String c) {
    return new ListTile(
        title: new Text(
          c,
        ),
        onTap:(){
          setState((){
            filter = c;
            //if you want to assign the index somewhere to check
          });}
    );
  }
}