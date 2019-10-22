
import 'dart:collection';
import 'dart:convert';
import 'package:flutter_app/UrlUtils.dart';
import 'package:flutter_app/src/fr/SchoolUtils.dart';
import 'package:flutter_app/src/mo/Event/Event.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class EventWebService{
  UrlUtils urlUtils = new UrlUtils();
  Future<dynamic> getData_ (HashMap<String, String> requestData, var url) async {
    Map<String, String> headers = new Map<String, String>();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print(sharedPreferences.getString("token"));
    headers['authT'] = sharedPreferences.getString("token");

    final finalurl = SchoolUtils().baseUrl + url + "?event_sync_time=0";
    var response = await http.get(finalurl , headers: headers);
    if(response.statusCode == 200){
      var str = response.body;
      final data = json.decode(response.body);
      return data;
    }
  }

  Future<dynamic> addOrUpdateEvent (Event event) async {
    print("in webservice");
    String authToken = await urlUtils.getAuthToken();

    Map<String, String> headers = new Map<String, String>();
    headers['authT'] = authToken;

    Map<String, String> eventMap = getEventFrom(event);

    final finalurl =  urlUtils.getEventAddUrl();
    Response response = await post(finalurl, headers: headers, body: eventMap);
    if(response.statusCode == 200){
      var str = response.body;
      print(str);
      final data = json.decode(response.body);
      return data;
    }
    int statusCode = response.statusCode;
    print(statusCode);
  }

  Map<String, String> getEventFrom(Event event) {
    Map<String,String> eventObjectmap = new HashMap();

    if (event.name != null) {
      eventObjectmap["name"] = event.name;
    }
    //  String  description;
    if (event.description != null) {
      eventObjectmap["description"] = event.description;
    }
    //  String  place;
    if(event.place != null) {
      eventObjectmap["place"] = event.place.toString();
    }
    //  int  startDate;
    if(event.startDate != null) {
      eventObjectmap["startDate"] = event.startDate.toString ( );
    }
    //  int endDate;
    if(event.endDate != null) {
      eventObjectmap["endDate"] = event.endDate.toString();
    }
    //  int status;
    if(event.status != null) {
      eventObjectmap["status"] = event.status.toString();
    }
    //  String type;
    if(event.type != null){
      eventObjectmap["type"] = event.type;
    }
    //  String owner;
    if (event.owner != null) {
      eventObjectmap["owner"] = event.owner;
    }
    //  int person;
    if (event.person != null) {
      eventObjectmap["person"] = event.person.toString();
    }
    //  int allDay = 0;
    if (event.allDay != null) {
      eventObjectmap["allDay"] = event.allDay.toString();
    }
    //  int isWritable = 0;
    if (event.isWritable != null) {
      eventObjectmap["isWritable"] = event.isWritable.toString();
    }

    return eventObjectmap;
  }

}