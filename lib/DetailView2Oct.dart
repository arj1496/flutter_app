import 'package:flutter/material.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_app/CustomAppbar.dart';
import 'package:flutter_app/HeaderContainer.dart';

class DetailView2Oct extends StatefulWidget {
  List<Widget> customWidget = new List();
  String title = null;
  @override
  State<StatefulWidget> createState() {
    return DetailViewUVState(customWidget,title);
  }
  DetailView2Oct.init(List<Widget> customWidget,String title ){
    this.customWidget = customWidget;
    this.title = title;
  }
}

class DetailViewUVState extends State<DetailView2Oct>{

  List<Widget> customWidget = new List();
  String title = null;
  DetailViewUVState(List<Widget> customWidget,title){
    this.customWidget = customWidget;
    this.title = title;
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
      appBar: CustomAppbar.init(title),
      //backgroundColor: Colors.transparent,
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

