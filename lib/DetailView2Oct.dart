import 'package:flutter/material.dart';
import 'package:flutter_app/AppTheme.dart';

import 'DescriptionCustomView.dart';
import 'PropertyService.dart';

class DetailView2Oct extends StatefulWidget {
  List<Widget> customWidget = new List();
  @override
  State<StatefulWidget> createState() {
    return DetailViewUVState(customWidget);
  }
  DetailView2Oct.init(List<Widget> customWidget ){
    this.customWidget = customWidget;
  }
}

class DetailViewUVState extends State<DetailView2Oct>{

  List<Widget> customWidget = new List();
  DetailViewUVState(List<Widget> customWidget){
    this.customWidget = customWidget;
  }


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
      body: SingleChildScrollView(
        child: Column(
          children:  _getWidget(),
        ),
      ),
    );
  }
  List<Widget> _getWidget(){
    return this.customWidget;
  }
}

