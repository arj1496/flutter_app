import 'package:flutter/cupertino.dart';

import 'AppTheme.dart';
import 'PropertyFile.dart';
import 'TitleView.dart';

class TitleViewDetail extends StatelessWidget {

  List<Widget> cutomWidgetList = new List();
  var property = new PropertyFile();
  TitleViewDetail.init(PropertyFile property){
    this.property = property;
  }
  @override
  Widget build( BuildContext context ) {
    return Stack(
      children: <Widget>[

        Padding(
          padding: const EdgeInsets.only(bottom:5.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10
                ),
                child:TitleView(
                  titleTxt: property.label,
                  subTxt: property.iconData,
                ),
                  ),
                  ],
                ),
              ),
            ],
    );

  }

  List<Widget> _getWidget(){
    return this.cutomWidgetList;
  }


}
