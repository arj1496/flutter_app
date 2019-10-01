import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'PropertyFile.dart';

class PropertyService{

   PropertyFile getData() {
    PropertyFile prop = new PropertyFile();
    prop.label = "Description";
    prop.iconData = Icon(FontAwesomeIcons.bookOpen);
    prop.data =  "n a project of mine I wrap Text instances around Containers. This particular code sample features two stacked Text objects."
        "n a project of mine I wrap Text instances around Containers. This particular code sample features two stacked Text objects."
        "\nhttps://www.google.com"
        "\nhttps://www.gmail.com";
    return prop;
  }
}