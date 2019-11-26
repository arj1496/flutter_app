import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
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
    //  File filePath = await ImagePicker.pickImage(source: ImageSource.gallery);
      File filePath = await FilePicker.getFile(type: FileType.ANY);
      if (filePath == '') {
        return;
      }
      print("File path: " + filePath.path);
      upload_();
      setState(() {
        this._filePath = filePath.path;
      });
    } catch (e) {
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
        child: Row(
          children: <Widget>[
           /* _filePath == null
                ? new Text('No file selected.')
                : new Text('Path' + _filePath),*/
            RaisedButton(
              child: Text("download"),
              onPressed: () {
                 download_();
              },
            )
          ],
        ),
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

    if (await first.exists()) {
      Uri uri = Uri.parse(
          'https://www.googleapis.com/upload/drive/v3/files?uploadType=multipart');
      MultipartRequest request = new MultipartRequest('POST', uri);
      HomeworkWebService homeworkWebService = new HomeworkWebService();
      var data = await homeworkWebService.getAccessToken();
      final access_token = data["accessToken"];
      // final access_token =  "ya29.ImGxB3k5PXIGx_fHaYXQNvSIVjekpa4o82zLh4kxJWx4CtRWoCIX3IR71UiRj4qUygC6k8LONS8ctnu7G7KXjRK4AUVMpDJ5GwLJ0pJ5tEHCHMeryuhs_44Ajyu4wUsEc1WO";
      print("access_token =" + access_token);
      request.headers["Authorization"] = "Bearer $access_token";

      var data2 = await homeworkWebService.getFolderId();

      String key = data2["folderId"];
      print("key" + key);
      print(request.headers);

      // request.fields['metadata'] =  "{name : test_send_file.zip};type=application/json;charset=UTF-8";

      request.files.add(MultipartFile.fromString(
        'metadata',
        json.encode({
          'name': "fileNew.jpg",
          'parents': ['1aZ4grRC-IzI-vqLrTrEuOvHPcZstop_P']
        }),
        contentType: MediaType('application', 'json'),
      ));

      request.files.add(await MultipartFile.fromPath(
        'fileNew.jpg',
        _filePath,
      ));
      print("request.toString: " + request.toString());
      StreamedResponse response = await request.send();
      print(response.statusCode);
      print(response.reasonPhrase);

    } else {
      print("not present");
    }
  }

  download_() async {
    HomeworkWebService homeworkWebService = new HomeworkWebService();
    var data = await homeworkWebService.getAccessToken();
    final access_token = data["accessToken"];
    print("access_token =" + access_token);
    final headers = {'Authorization': 'Bearer $access_token',
    //HttpHeaders.contentTypeHeader: ContentType.text,
    };




    final uri = Uri.parse('https://www.googleapis.com/drive/v2/files/1aZ4grRC-IzI-vqLrTrEuOvHPcZstop_P/children');

    final response = await get(uri, headers: headers);
    print(response.statusCode);
    print(response.reasonPhrase);
    print(response.bodyBytes);
    print(response.body);

 /* String fileId = '1nZE8p71shvhKBU6lxqxWpjMdKd1eDiB5';

    final url = 'https://www.googleapis.com/drive/v3/files/$fileId?alt=media';
    final response1 = await get(url, headers: headers);
    print(response1.statusCode);
    print(response1.reasonPhrase);
    print(response.bodyBytes);
    print(response.body);*/



  }
}
