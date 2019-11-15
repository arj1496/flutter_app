import 'package:flutter/material.dart';
import 'package:flutter_app/getStudent.dart';
import 'package:flutter_app/src/Student%20Dashboard/ClassStudentsCount.dart';
import '../../AppTheme.dart';
import '../../HeaderContainer.dart';
import 'NewAnimated.dart';

class DivisionGrade extends StatelessWidget {

  var dataObject;
  List<dynamic> classDetailsList;
  List<dynamic> gradeDetailList;
  Map<int, List<int>> gradeClassListMap;
  List<int> divisionClassList;
  final List<int> allreadyPrintClassId = new List<int>();
  Map<String, dynamic> test ;

  List<dynamic> dataList;

  DivisionGrade({
    this.dataList
    /*this.dataObject,
    this.classDetailsList,
    this.gradeDetailList,
    this.gradeClassListMap,
    this.divisionClassList*/
});

  @override
  Widget build(BuildContext context) {
    return divisionContain();
  }

  Widget divisionContain() {
    return Container(
      child: Column(
          children: getAllWidgets()
      ),
    );
  }

  Widget horizontalLine(Color color) {
    // this Padding is Used to render the Horizontal line Starts
   return Padding(
      padding: const EdgeInsets.only(
          left: 5, right: 5, top: 8, bottom: 8),
      child: Container(
        height: 2,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
    );
    // this Padding is Used to render the Horizontal line Ends
  }

  Widget gradeTotal(Map<String, dynamic> gradeDetail) {
    return Padding(
        padding: const EdgeInsets.only(
            left: 10, right: 10, top: 3, bottom: 8),
        child: Row(
          children: <Widget>[
            gradeName(gradeDetail['gardeName'].toString()),
            totalBoysGirls(gradeDetail),
          ],
        ),
      );
  }

 Widget gradeName(String gradeName) {
  return Expanded(
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: <Widget>[
         Text(
           gradeName,
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

  Widget totalBoysGirls(Map<String, dynamic> gradeDetail) {
    return Padding(
      padding: EdgeInsets.only(right: 0.0,left: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: Column(
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
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Text(
                      gradeDetail['totalCount'].toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: AppTheme.robotoFontName,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: AppTheme.grey.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
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
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Text(
                      gradeDetail['maleCount'].toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: AppTheme.robotoFontName,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: AppTheme.grey.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right:13.0),
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
                  child: Padding(
                    padding: const EdgeInsets.only(right: 13.0),
                    child: Text(
                      gradeDetail['femaleCount'].toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: AppTheme.robotoFontName,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: AppTheme.grey.withOpacity(0.5),
                      ),
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

  List<Widget> getAllWidgets() {
    List<Widget> widgetList = new List();
    //widgetList.add( HeaderContainer.init(dataObject['name'], ""));

    List.generate(dataList.length, (i){
      widgetList.add(HeaderContainer.init(dataList[i]['name'], ""));
      List<Widget> widgets = allDetails(dataList[i]["gradeList"]);
      if(widgets != null && widgets.length > 0 ){
        widgetList.addAll(widgets) ;
      }
      List<dynamic> list =   dataList[i]["classList"];
      if(list != null && list.length > 0 ){
        Widget widget = ClassStudentsCount(
          title:"Only Division Classes: ${dataList[i]["name"]} ",
          list: dataList[i]["classList"],
        );
        if(widget != null){
          widgetList.add(widget);
        }
      }
    });
    widgetList.add(horizontalLine(Colors.grey));
    return widgetList;
  }

  List<Widget> allDetails(List<dynamic> gradeDetailList) {

    List<Widget> widgets = new List<Widget>();
    List.generate(gradeDetailList.length, (i){
      Widget widget =  getWidget(gradeDetailList[i]);
      if(widget != null){
        widgets.add(widget);
      }
    });
    return widgets;
  }

  Map<int, dynamic> forClassList() {
    Map<int, dynamic> classListMap = new Map<int, dynamic>();
    for(int i= 0; i < classDetailsList.length; i++){
      classListMap[classDetailsList[i]['classId']] = classDetailsList[i];
    }
    return classListMap;
  }

  Widget getWidget(Map<String,dynamic> gradeDetail) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 3),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
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
        child: GestureDetector(
          onTap: (){
            print("hello");
          },
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:8.0,left: 10.0,right: 10.0),
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
                      gradeTotal(gradeDetail),
                    ],
                  ),
                ),
              ),
              horizontalLine(Colors.black12),
              NewAnimated(
                /*classIds: gradeClassListMap[gradeId],
                  classDetailsMap: forClassList(),
                  allreadyPrintClassId : allreadyPrintClassId,*/
                  classDataList : gradeDetail["classList"]
              ),
              SizedBox(
                height: 5.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
