import 'package:flutter/material.dart';
import 'AppTheme.dart';
import 'HeaderContainer.dart';
import 'NewAnimated.dart';

class DivisionGrade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return divisionContain();
  }

  Widget divisionContain() {
    return Container(
      child: Column(
        children: <Widget>[
          HeaderContainer.init("Division Name:", ""),
          Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 3),
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topRight: Radius.circular(8.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: AppTheme.grey.withOpacity(0.2),
                        offset: Offset(1.1, 1.1),
                        blurRadius: 10.0
                    ),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    title(),
                    horizontalLine(),
                    gradeTotal(),
                    SizedBox(
                      height: 5.0,
                    ),
                    NewAnimated(),
                    SizedBox(
                      height: 5.0,
                    ),
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }

  Widget title() {
    return Padding(
        padding:
        const EdgeInsets.only(top:5, left: 5, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding:
                  const EdgeInsets.only(left: 4, bottom: 3),
                  child: Text(
                    'Grade And Class Students Count',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppTheme.robotoFontName,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: AppTheme.nearlyDarkBlue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Widget horizontalLine() {
    // this Padding is Used to render the Horizontal line Starts
   return Padding(
      padding: const EdgeInsets.only(
          left: 5, right: 5, top: 8, bottom: 8),
      child: Container(
        height: 2,
        decoration: BoxDecoration(
          color: AppTheme.background,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
    );
    // this Padding is Used to render the Horizontal line Ends
  }

  Widget gradeTotal() {
    return Padding(
        padding: const EdgeInsets.only(
            left: 10, right: 10, top: 3, bottom: 8),
        child: Row(
          children: <Widget>[
            gradeName(),
            totalBoysGirls(),
          ],
        ),
      );
  }

 Widget gradeName() {
  return Expanded(
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: <Widget>[
         Text(
           'Grade',
           textAlign: TextAlign.center,
           style: TextStyle(
             fontFamily: AppTheme.robotoFontName,
             fontWeight: FontWeight.w500,
             fontSize: 16,
             letterSpacing: -0.2,
             color: AppTheme.darkText,
           ),
         ),
         Padding(
           padding: const EdgeInsets.only(top: 6),
           child: Text(
             '',
             textAlign: TextAlign.center,
             style: TextStyle(
               fontFamily: AppTheme.robotoFontName,
               fontWeight: FontWeight.w600,
               fontSize: 12,
               color: AppTheme.grey.withOpacity(0.5),
             ),
           ),
         ),
       ],
     ),
   );
 }

  Widget totalBoysGirls() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'Total',
                style: TextStyle(
                  fontFamily: AppTheme.robotoFontName,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  letterSpacing: -0.2,
                  color: AppTheme.darkText,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  '8',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppTheme.robotoFontName,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: AppTheme.grey.withOpacity(0.5),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left:5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Boys',
                  style: TextStyle(
                    fontFamily: AppTheme.robotoFontName,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    letterSpacing: -0.2,
                    color: AppTheme.darkText,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    '4',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppTheme.robotoFontName,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: AppTheme.grey.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Girls',
                  style: TextStyle(
                    fontFamily: AppTheme.robotoFontName,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    letterSpacing: -0.2,
                    color: AppTheme.darkText,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    '4',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppTheme.robotoFontName,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: AppTheme.grey.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
