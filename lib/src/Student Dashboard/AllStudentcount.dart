import 'package:flutter/material.dart';
import 'package:flutter_app/src/Student%20Dashboard/DivisionGrade.dart';
import 'package:flutter_app/src/Student%20Dashboard/StudentDashboard.dart';
import '../../AppTheme.dart';

class AllStudentCount extends StatelessWidget {

  var data;
  AllStudentCount({
    this.data
  });

  @override
  Widget build(BuildContext context) {
    return studentCount(this.data);
  }
}

  Widget studentCount(test){
 return  Padding(
     padding: const EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
     child: Container(
       decoration: BoxDecoration(
         color: AppTheme.white,
         borderRadius: BorderRadius.only(
             topLeft: Radius.circular(8.0),
             bottomLeft: Radius.circular(8.0),
             bottomRight: Radius.circular(8.0),
             topRight: Radius.circular(8.0)
         ),
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
           Padding(
               padding: const EdgeInsets.only(top: 5, left: 5, right: 10),
               child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.end,
                     children: <Widget>[
                       Padding(
                         padding: const EdgeInsets.only(
                             left: 4, bottom: 3
                         ),
                         child: Text(
                           'All Students Count',
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
           ),


           // this Padding is Used to render the Horizontal line Starts
           Padding(
             padding: const EdgeInsets.only(
                 left: 5, right: 5, top: 8, bottom: 8
             ),
             child: Container(
               height: 2,
               decoration: BoxDecoration(
                 color: AppTheme.background,
                 borderRadius: BorderRadius.all(Radius.circular(4.0)),
               ),
             ),
           ),
           // this Padding is Used to render the Horizontal line Ends

           Padding(
             padding: const EdgeInsets.only(
                 left: 10, right: 10, top: 3, bottom: 8
             ),
             child: Row(
               children: <Widget>[
                 Expanded(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                       Text(
                         test['total'].toString(),
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
                           'Total',
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
                 Expanded(
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: <Widget>[
                       Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: <Widget>[
                           Text(
                             test['male'].toString(),
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
                               'Boys',
                               textAlign: TextAlign.center,
                               style: TextStyle(
                                 fontFamily: AppTheme.robotoFontName,
                                 fontWeight: FontWeight.w600,
                                 fontSize: 12,
                                 color: AppTheme.grey
                                     .withOpacity(0.5),
                               ),
                             ),
                           ),
                         ],
                       ),
                     ],
                   ),
                 ),
                 Expanded(
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: <Widget>[
                       Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.end,
                         children: <Widget>[
                           Text(
                             test['female'].toString(),
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
                               'Girls',
                               textAlign: TextAlign.center,
                               style: TextStyle(
                                 fontFamily: AppTheme.robotoFontName,
                                 fontWeight: FontWeight.w600,
                                 fontSize: 12,
                                 color: AppTheme.grey
                                     .withOpacity(0.5),
                               ),
                             ),
                           ),
                         ],
                       ),
                     ],
                   ),
                 )
               ],
             ),
           )
         ],
       ),
     )
 );
  }
