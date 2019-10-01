import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/HeaderContainer.dart';
import 'package:flutter_app/dhaval.dart';
import 'package:flutter_app/src/MenuFile.dart';
import 'package:flutter_app/urvesh.dart';
import 'package:flutter_app/nayan.dart';
import 'package:flutter_app/Heena.dart';

import 'DescriptionCustomView.dart';
import 'DetailViewUV.dart';
import 'PropertyService.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String msg = 'Flutter RaisedButton example';

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 15.0);
  static PropertyService propertyService = new PropertyService();

  List<Widget> customWidget = [HeaderContainer(), DescriptionCustomView.init(propertyService.getData())];
  _changeText() {
    setState(() {
      if (msg.startsWith('F')) {
        msg = 'I have learned FlutterRaised example ';
      } else {
        msg = 'Flutter RaisedButton example';
      }
    });
  }
  @override
  Widget build(BuildContext context) {

    final nayanWork = Material(
      color: Colors.indigo,
      /* borderRadius: BorderRadius.circular(30.0),*/
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => nayan()),
          );
        },
        child: Text("Nayan Work",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final uvWork = Material(

      color: Colors.indigo,
      /* borderRadius: BorderRadius.circular(30.0),*/
      child: MaterialButton(

        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),

        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailViewUV.init(customWidget)),
          );
        },

        child: Text("Urvesh Work",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final RonakWork = Material(
      color: Colors.indigo,
      /* borderRadius: BorderRadius.circular(30.0),*/
      child: MaterialButton(

        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: (){},
        child: Text("Ronak Work",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final rupaliWork = Material(
      color: Colors.indigo,
      /* borderRadius: BorderRadius.circular(30.0),*/
      child: MaterialButton(

        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: (){},
        child: Text("Rupali Work",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final akshataWork = Material(
      color: Colors.indigo,
      /* borderRadius: BorderRadius.circular(30.0),*/
      child: MaterialButton(

        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: (){

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MenuFile()),
          );

        },
        child: Text("Akshata Work",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),

      ),
    );

    final dhavalWork = Material(
      color: Colors.indigo,
      /* borderRadius: BorderRadius.circular(30.0),*/
      child: MaterialButton(

        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: (){

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => dhaval()),
          );


        },
        child: Text("Dhaval Work",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final heenaWork = Material(
      color: Colors.indigo,
      /* borderRadius: BorderRadius.circular(30.0),*/
      child: MaterialButton(

        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Heena()),
          );
        },
        child: Text("Heena Work",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final surabhiWork = Material(
      color: Colors.indigo,
      /* borderRadius: BorderRadius.circular(30.0),*/
      child: MaterialButton(

        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: (){},
        child: Text("Surabhi Work",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );


    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new GridView.count(
          crossAxisCount: 4,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          children: <Widget>[

            nayanWork,
            uvWork,
            RonakWork,
            rupaliWork,
            akshataWork,
            dhavalWork,
            heenaWork,
            surabhiWork


          ],
        ),

      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
