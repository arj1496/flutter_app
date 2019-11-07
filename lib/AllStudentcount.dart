import 'package:flutter/material.dart';
import 'AppTheme.dart';

class AllStudentCount extends StatelessWidget {
  
  AllStudentCount(
      
      )

  @override
  Widget build(BuildContext context) {
    return studentCount();
  }
}

  Widget studentCount(){
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
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.end,
                     children: <Widget>[
                       Padding(
                         padding: const EdgeInsets.only(
                             left: 4, bottom: 3
                         ),
                         child: Text(
                           'All Student Count',
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
               )
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
                         '17',
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
                             '9',
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
                             '8',
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
