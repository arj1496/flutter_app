/**
 * This is the generic container used for description and place in event.
 * To diaplay label and data this container is used.
 * In this property file is accepted in constructor from calling widgets.
 * property contains label,icon and data properties.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/AppTheme.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

import 'PropertyFile.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {

   String title = null;
  CustomAppbar.init(String title){
    this.title = title;
  }
  @override
  Widget build( BuildContext context ) {
    return AppBar(
      elevation: 0.0,
      title: Text(title,
        style: TextStyle(
        fontFamily: AppTheme.robotoFontName,
        fontWeight: FontWeight.w700,
        fontSize: 22,
        letterSpacing: 1.2,),
      ),
      backgroundColor:Colors.transparent,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}