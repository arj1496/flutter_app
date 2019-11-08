
import 'package:flutter/material.dart';
import 'package:flutter_app/src/mo/FileDownloadAndUpload/DownloadUpload.dart';

class DownloadUploadWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File Upload/Download Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 2,
        child: DownloadUpload(),
      ),
    );
  }
}
