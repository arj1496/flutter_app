import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'PropertyFile.dart';

class PropertyService{


   PropertyFile getData() {
     PropertyFile property = new PropertyFile();
     property.label="Description";
     property.iconData = new Icon(FontAwesomeIcons.bookOpen);
     property.data = "Learning a new UI engine is always tricky. Thankfully, the Flutter team has highlighted the basic widgets. For this code tutorial, we will focus on Row and Column"
         "which lay out a list of child widgets in the horizontal and vertical direction respectively"
         "Learning a new UI engine is always tricky. Thankfully, the Flutter team has highlighted the basic widgets. For this code tutorial, we will focus on Row and Column"
         "which lay out a list of child widgets in the horizontal and vertical direction respectively"
         "\nhttps://www.google.com";
    return property;
  }

  PropertyFile getPlaceData() {
    PropertyFile property = new PropertyFile();
    property.label="Place";
    property.iconData = new Icon(FontAwesomeIcons.placeOfWorship);
    property.data = "Vishva Arcade, Sinhagad Road, Narhe Gaon, Pune - 411041,"
        " Navle Bridge Opposite Hotel Deccan Pavilion (Map)Computer Training Institutes , Computer Trai ...more";
    return property;
  }

}