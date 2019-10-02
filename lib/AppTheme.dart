import 'package:flutter/material.dart';

class AppTheme{

  // constructor
  AppTheme._();

  static const Color background = Color(0xFFF2F3F8);
  static const Color darkText = Color(0xFF253840);
  static const Color white = Color(0xFFFFFFFF);
  static const Color nearlyWhite = Color(0xFFFFFFFF);
  static const Color nearlyBlue = Color(0xFF00B6F0);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color darkerText = Color(0xFF17262A);
  static const Color grey = Color(0xFF3A5160);
  static const Color nearlyDarkBlue = Color(0xFF2633C5);

  // font
  static const String robotoFontName = 'Roboto';

}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}