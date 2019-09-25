import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/nayan.dart';
import 'package:flutter_app/src/fr/Login.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter_app/src/fr/SchoolUtils.dart';
import 'package:flutter_app/src/fr/webservice/WebClient.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class UrveshHome extends StatefulWidget{

  @override
  _UrveshHomePageState createState() => _UrveshHomePageState();
}

class _UrveshHomePageState extends State<UrveshHome>{

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 15.0);
  SharedPreferences sharedPreferences;

  @override
  initState(){
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _getNormalScafold();
    //return _getFormScafold();
  }

  Scaffold _getNormalScafold(){

    final logoutButon = Material(
      color: Colors.indigo,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(

        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          sharedPreferences.clear();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (BuildContext context) => LoginPage()
              ), (Route<dynamic> route) => false
          );

        },
        child: Text("Logout",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final homePage = Material(
      color: Colors.indigo,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(

        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: (){
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) => MyApp()
              ), (Route<dynamic> route) => false
          );
        },
        child: Text("Home Page",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final getDataBtn = Material(
      color: Colors.indigo,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(

        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: (){
          getData();
        },
        child: Text("Get Data",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Urvesh Page"),
      ),
      body: Center(
          child: Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 155.0,
                    child: Image.asset(
                      "images/mount-carmel-logo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  logoutButon,
                  SizedBox(height: 10.0,),
                  homePage,
                  SizedBox(height: 10.0,),
                  getDataBtn,
                ],
              ),
            ),
          )
      ),
    );
  }
  
  Scaffold _getFormScafold(){
    final loginButon = Material(
      color: Colors.indigo,
      /* borderRadius: BorderRadius.circular(30.0),*/
      child: MaterialButton(

        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),

        /*onPressed: (){
          schoolCodeText = schoolCodeController.text;
          emailText = emailController.text;
          passeordText = passwordController.text;
          return showDialog(
              context: context,
              builder: (context){
                return AlertDialog(
                  content: Text(
                      schoolCodeText + "\n" +
                          emailText + "\n" +
                          passeordText
                  ),
                );
              }
          );
        },*/
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    return new Scaffold(
      body: new Center(
        child: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(20.0),
            child: Center(
              child: new Form(
                  child:  _getFormUI(loginButon)
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget _getFormUI(Material loginButon) {
    return new Column(
      children: <Widget>[
        SizedBox(
          height: 155.0,
          child: Image.asset(
            "images/mount-carmel-logo.png",
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: 10.0),
        new TextFormField(
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          decoration: InputDecoration(
            hintText: 'Email',
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
        ),
        new SizedBox(height: 20.0),
        new TextFormField(
            autofocus: false,
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Password',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
            ),
        new SizedBox(height: 15.0),
        new Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: loginButon
        ),
        new FlatButton(
          child: Text(
            'Forgot password?',
            style: TextStyle(color: Colors.deepPurple),
          ),
          /*onPressed: _showForgotPasswordDialog,*/
        ),
        new FlatButton(
          /*onPressed: _sendToRegisterPage,*/
          child: Text('Not a member? Sign up now',
              style: TextStyle(color: Colors.deepPurple)),
        ),
      ],
    );
  }

  void getData() {
    WebClient webClient = new WebClient();

    HashMap map = new HashMap<String, String>() ;
    map['teacher_sync_time'] = 0.toString();

    Future<dynamic> test = webClient.getData_(map, "/rest/sync/getSyncInfo");
    test.then((value){
      print(value);
      print(value['teachers'][0]['id']);
      print(value['teachers'][0]['firstName']);
    });
  }



}