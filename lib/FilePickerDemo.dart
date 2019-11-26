

import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/mo/HomeWork/HomeworkWebservice.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart' show MediaType;

class FilePickerDemo extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<FilePickerDemo> {
  String _filePath;

  void getFilePath() async {
    try {
      File filePath =  await ImagePicker.pickImage(source: ImageSource.gallery);
      if (filePath == '') {
        return;

      }
      print("File path: " + filePath.path);
      upload_();
      setState((){this._filePath = filePath.path;});
    }  catch (e) {
      print("Error while picking the file: " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('File Picker Example'),
      ),
      body: new Center(
        child: _filePath == null
            ? new Text('No file selected.')
            : new Text('Path' + _filePath),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: getFilePath,
        tooltip: 'Select file',
        child: new Icon(Icons.sd_storage),
      ),

    );
  }

  upload_() async {
    File first = File(_filePath);
    //final outputFile = File(outputFilePath);


    if(await first.exists()) {
      Uri uri = Uri.parse (
          'https://www.googleapis.com/upload/drive/v3/files?uploadType=multipart' );
      MultipartRequest request = new MultipartRequest( 'POST' , uri );
      HomeworkWebService homeworkWebService = new HomeworkWebService( );
      var data = await homeworkWebService.getAccessToken ( );
      final access_token = data["accessToken"];
      // final access_token =  "ya29.ImGxB3k5PXIGx_fHaYXQNvSIVjekpa4o82zLh4kxJWx4CtRWoCIX3IR71UiRj4qUygC6k8LONS8ctnu7G7KXjRK4AUVMpDJ5GwLJ0pJ5tEHCHMeryuhs_44Ajyu4wUsEc1WO";
      print ( "access_token =" + access_token );
      request.headers["Authorization"] = "Bearer $access_token";

      var data2 = await homeworkWebService.getFolderId();
      print(data2);

      String key = data2["folderId"];
      print ( request.headers );

      // request.fields['metadata'] =  "{name : test_send_file.zip};type=application/json;charset=UTF-8";

      request.files.add ( MultipartFile.fromString (
        'metadata' ,
        json.encode({'name': "file.jpg","parents":data2["folderId"]}),
        contentType:  MediaType('application', 'json'),
      ));

      request.files.add (
          await MultipartFile.fromPath ( 'file.jpg' , _filePath , ) );
      print ( "request.toString: " + request.toString ( ) );
      StreamedResponse response = await request.send ( );
      print ( response.statusCode );
      print ( response.reasonPhrase );
    }else{
      print("not present");
    }
    /* request.fields['metadata'] =
    "{name : test_send_file.zip};type=application/json;charset=UTF-8";
   */// request.files.add(await MultipartFile.fromPath(_filePath, first.path));
   /* request.files.add(MultipartFile.fromString(
      'metadata',
      json.encode({'name': _filePath}),
    ));
*/
   /* request.files.add(MultipartFile.fromString(
      'metadata',
      json.encode({'name': _filePath, "parents":["dp"] }),
     // contentType: MediaType('application', 'json'),
    ));
    print("request.toString: " + request.toString());
    StreamedResponse response = await request.send();
    print(response.statusCode);
*/
  }
}