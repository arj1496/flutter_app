
import 'dart:collection';
import 'dart:convert';
import 'package:flutter_app/UrlUtils.dart';
import 'package:flutter_app/src/fr/SchoolUtils.dart';
import 'package:flutter_app/src/mo/Event/Event.dart';
import 'package:flutter_app/src/mo/Participant/Participant.dart';
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

  Future<Map<String, dynamic>> addOrUpdateEvent (Event event) async {
    print("in webservice");
    String authToken = await urlUtils.getAuthToken();
    print("authToken : ${authToken}");
    Map<String, String> headers = new Map<String, String>();
    headers['authT'] = authToken;


    Map<String, String> eventMap = getEventFrom(event);
    final finalurl =  urlUtils.getEventAddUrl();
    Response response = await post(finalurl, headers: headers, body: eventMap);
    var data;

    if(response.statusCode == 200){
      data = json.decode(response.body);
      print(data);
    }
    return data;
  }

  Map<String, String> getEventFrom(Event event) {
    Map<String,String> eventObjectmap = new HashMap();

    if(event.id != null){
      eventObjectmap["id"] = event.id.toString();
    }
    if (event.name != null) {
      eventObjectmap["name"] = event.name;
    }
    //  String  description;
    if (event.description != null) {
      eventObjectmap["description"] = event.description;
    }
    //  String  place;
    if(event.place != null) {
      eventObjectmap["place"] = event.place;
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
    if(event.eventParticipant !=  null){
      List<Map<String,String>> test = prepareParticipantmap(event.eventParticipant);
      Map<String,List<Map<String,String>>> testMap = new Map();
     testMap["list"]= test;
      eventObjectmap["participants"] = testMap.toString();
    }
    if(event.personalParticipant != null){
      List<Map<String,List<int>>> test = preparePersonalParticipantmap(event.personalParticipant);
       Map<String,List<Map<String,List<int>>>> testMap = new Map();
       testMap["list"]= test;
       eventObjectmap["perparticipants"] = testMap.toString();
    }
    return eventObjectmap;
}

   prepareParticipantmap(List<Participant> particpantList){
    List<Map<String,String>> mapParticipant = new List();
     for(Participant participant in particpantList){
       Map<String,String> map = new Map();
       map["standard"] = participant.standard.id.toString();
       map["participantType"] = participant.participantType;
       mapParticipant.add(map);
     }
     return mapParticipant;
   }

  preparePersonalParticipantmap(List<Participant> particpantList){
    List<Map<String,List<int>>> mapParticipant = new List();
    Map<String,List<int>> map = new Map();
    for(Participant participant in particpantList){

      if(participant.participantType == "INDIVIDUAL_TEACHER"){
        List<int> selectedList = map["INDIVIDUAL_TEACHER"];
        if(selectedList == null){
          selectedList = new List();
          map["INDIVIDUAL_TEACHER"] = selectedList;
        }
        selectedList.add(participant.id);

      }else if(participant.participantType == "INDIVIDUAL_PARENT"){
        List<int> selectedList = map["INDIVIDUAL_PARENT"];
        if(selectedList == null){
          selectedList = new List();
          map["INDIVIDUAL_PARENT"] = selectedList;
        }
        selectedList.add(participant.id);
      }else if(participant.participantType == "INDIVIDUAL_STUDENT"){
        List<int> selectedList = map["INDIVIDUAL_STUDENT"];
        if(selectedList == null){
          selectedList = new List();
          map["INDIVIDUAL_STUDENT"] = selectedList;
        }
        selectedList.add(participant.id);
      }

    }
    mapParticipant.add(map);
    return mapParticipant;
  }



}