import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/nayan.dart';
import 'SchoolUtils.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/urvesh.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 15.0);

  TextEditingController schoolCodeController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return _getNormalScafold();
  }

  Widget _getNormalScafold() {
    final schoolCode = TextField(
      style: style,
      controller: schoolCodeController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          hintText: "Enter School Code",
          border:
          OutlineInputBorder(
              borderRadius: BorderRadius.circular(32)
          )
      ),
    );

    final emailField = TextField(
      style: style,
      controller: emailController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),

          hintText: "Enter Email Address",
          border:
          OutlineInputBorder(
              borderRadius: BorderRadius.circular(32)
          )
      ),
    );

    final passwordField = TextField(
      style: style,
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          hintText: "Enter Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
          )
      ),
    );

    final loginButon = Material(
      color: Colors.indigo,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(

        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: (){
          setState(() {
            _isLoading : true;
          });
          _signIn(emailController.text, passwordController.text, schoolCodeController.text);
        },
        child: Text("Login",
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


    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Center(
          child: Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: _isLoading ? Center(child: CircularProgressIndicator()) : Column(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  schoolCode,
                  SizedBox(height: 10.0),
                  emailField,
                  SizedBox(height: 10.0),
                  passwordField,
                  SizedBox(height: 10.0),
                  loginButon,
                  SizedBox(height: 10.0,),
                  homePage,
                ],
              ),
            ),
          )
      ),
    );
  }

  _signIn(String email, password, schoolCode) async{

    Map<String, String> headers = new Map<String, String>();
    headers['userid'] = email;
    headers['password'] = password;
    headers['schoolname'] = schoolCode;
    headers['authtype'] = "mup";

    String url = SchoolUtils().baseUrl;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.get(url + "rest/auth/login", headers: headers);
    Map<String, dynamic> jsonData = null;
    if(response.statusCode == 200){
      print(response.body);
      jsonData = json.decode(response.body);
      print(jsonData);
      setState(() {
        _isLoading = false;
      });
      if(jsonData['status']){
        var authT = jsonData['authT'];
        sharedPreferences.setString("token", jsonData['authT']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => UrveshHome()),
                (Route<dynamic> route) => false
        );
      }else{
        var error = jsonData['errorMessage'];
        setState(() {
          _isLoading = false;
        });
        print(error);
      }
    }
  }
}


