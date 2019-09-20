import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class urvesh extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Urvesh Login Page Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal
      ),
      home: UrveshHome(title:'Urvesh Login Page Demo'),
    );

  }
}

class UrveshHome extends StatefulWidget{

  final String title;

  UrveshHome({Key key, this.title}) : super(key: key);

  @override
  _UrveshHomePageState createState() => _UrveshHomePageState();
}

class _UrveshHomePageState extends State<UrveshHome>{

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 15.0);

  @override
  Widget build(BuildContext context) {

    final schoolCode = TextField(
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          hintText: "Enter School Code",
          border:
          OutlineInputBorder(
            /* borderRadius: BorderRadius.circular(32)*/
          )
      ),
    );

    final emailField = TextField(
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          hintText: "Enter Email Address",
          border:
          OutlineInputBorder(
            /* borderRadius: BorderRadius.circular(32)*/
          )
      ),
    );

    final passwordField = TextField(
      style: style,
      obscureText: true,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          hintText: "Enter Password",
          border: OutlineInputBorder(
            /*borderRadius: BorderRadius.circular(32),*/
          )
      ),
    );

    final loginButon = Material(
      color: Colors.indigo,
      /* borderRadius: BorderRadius.circular(30.0),*/
      child: MaterialButton(

        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: (){},
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Column(
                children: <Widget>[
                  new Image(
                    image: new AssetImage("images/download.jpg"),
                    fit: BoxFit.cover,
                    color: Colors.black87,
                    colorBlendMode: BlendMode.darken,
                  ),
                  SizedBox(
                    height: 155.0,
                    child: Image.asset(
                      "images/mount-carmel-logo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  _signInButton(),
                  SizedBox(height: 10.0),
                  schoolCode,
                  SizedBox(height: 10.0),
                  emailField,
                  SizedBox(height: 10.0),
                  passwordField,
                  SizedBox(height: 10.0),
                  loginButon,
                ],
              ),
            ),
          )
      ),
    );
  }

  Widget _signInButton() {
    return Material(
      color: Colors.blue,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){},
        child: Text("Sign in With Google",
          textAlign: TextAlign.center,
          style: style.copyWith(
            color: Colors.white, fontWeight: FontWeight.bold)
        ),
      ),
    );

  }


}