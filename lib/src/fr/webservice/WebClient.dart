import 'dart:async';
import 'dart:collection';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WebClient{

  String baseUrl = "192.168.0.110:8080/soms";

  Future<dynamic> getData (HashMap<String, String> requestData, var url) async{
    HttpClient httpClient = new HttpClient();
    final finalurl = baseUrl + url;
    //var uri1 = Uri.https(baseUrl, url, requestData);

   // var uri2 = Uri.http(host: "", scheme: "http", path : finalurl, queryParameters: requestData);

    var uri3 = Uri.http(finalurl, requestData.toString());

    print(uri3.toString());
    print(uri3);

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print(sharedPreferences.getString("token"));
    HttpClientRequest request = await httpClient.getUrl(uri3);
    request.headers.set("authT", sharedPreferences.getString("token"));
    //request.add(utf8.encode(json.encode(requestData)));

    HttpClientResponse response = await request.close();
    if(response.statusCode == 200){
      print("test");
      // todo - you should check the response.statusCode
    }
    String reply = await response.transform(utf8.decoder).join();
    httpClient.close();
    return reply;
  }

  Future<dynamic> getData_ (HashMap<String, String> requestData, var url) async {

   /* SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.get(url + "rest/auth/login", headers: headers);*/
  }
}