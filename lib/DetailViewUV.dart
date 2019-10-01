import 'package:flutter/material.dart';
import 'package:flutter_app/AppTheme.dart';

class DetailViewUV extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return DetailViewUVState();
  }
}

class DetailViewUVState extends State<DetailViewUV>{
  @override
  Widget build(BuildContext context) {
    return _getContainerWidget();
  }

  Widget _getContainerWidget() {
    return Container(
      color: AppTheme.background,
      child: _getNormalScaffold(),
    );
  }

  _getNormalScaffold() {
    return Scaffold(
      backgroundColor: Colors.transparent,

    );
  }

}

