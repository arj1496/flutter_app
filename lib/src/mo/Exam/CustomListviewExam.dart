import 'package:flutter/material.dart';
import 'package:flutter_app/src/fr/SchoolUtils.dart';
import 'package:flutter_app/src/mo/Exam/ExamActivity.dart';
import 'package:flutter_app/src/mo/Exam/ExamService.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../AppTheme.dart';
import '../../../ButtonUI.dart';
import '../../../CardDetail2Oct.dart';
import '../../../DescriptionCustomView.dart';
import '../../../DetailView2Oct.dart';
import '../../../ExamWidget2.dart';
import '../../../HeaderContainer.dart';
import '../../../MarkWidget.dart';
import '../../../TitleViewDetail.dart';
import 'Exam.dart';


class CustomListviewExam extends StatefulWidget {
  @override
  _ListTileViewUVState createState() => _ListTileViewUVState();
}

class _ListTileViewUVState extends State<CustomListviewExam> {


  ExamService examService = new ExamService();
  SchoolUtils schoolUtils = new SchoolUtils();
  @override
  void initState() {

  }

  Future<List<Exam>> getData() async{
    ExamActivity examActivity = new ExamActivity();
    List<Exam> examList = await examActivity.getJoinDbExam();
    return examList;
  }
  @override
  Widget build(BuildContext context) {
    ExamActivity examActivity = new ExamActivity();
    Future<List<Exam>> examListFuture = examActivity.getJoinDbExam();

    var futureBuilder = new FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return _getListViewWithBuilder(context, snapshot);
        }
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppTheme.background,
        title: Text("Exam"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.filter),
           // onPressed: openFilterAlert(),
            // onPressed: synEvents,
          ),
          /* IconButton(
            icon: Icon(Icons.get_app),
            onPressed: getEvent,
          ),*/
        ],
      ),
      body: futureBuilder,
    );
    //return _getListViewWithBuilder();
  }

  Widget _getListViewWithBuilder(BuildContext context, AsyncSnapshot snapshot) {
    List<Exam> examList = snapshot.data;

    return  Container(
      color: AppTheme.background,
      child: ListView.builder(
          itemCount: examList.length,

          itemBuilder: (BuildContext ctxt, int Index){
            return examList != null && examList.length > 0  ?  _listTileViewUV(examList[Index]) : _listNotFound();
          }

      ),
    );
  }
// Pass exam field to widget constructur to fill in the exam detail page
  Widget _listTileViewUV(data) {
    return  GestureDetector(
        onTap: (){
      List<Widget> examWidget2 = [
        HeaderContainer.init(data.name,""),     // For Appbar of evenry page.It constructor contains title which i displayed on header.
        CardDetail2Oct(ExamWidget2(data)),            // It display all data in card view with curve corner.the detailwidget is a object of dart file for all details page
        MarkWidget(data),
        //TypeView(),
        TitleViewDetail.init("Syllabus",FontAwesomeIcons.book),  // It display title of place and description in listview.
        DescriptionCustomView.init(data.syllabus),  // Alll place data is displayed in container
        TitleViewDetail.init("Description",FontAwesomeIcons.bookOpen),
        DescriptionCustomView.init(data.description),
        ButtonUI.init('EDIT','CLOSE',data),
        //ButtonUI2.init('RESULTS','DELETE','CLOSE'),
        // AttachmentView(),                                       // It dispay container in water mark
        // AttachmentFileView(),                                    // This display all atachment in listview.
      ];
      // when click on list view of exam all the details of that exam is displayed.
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailView2Oct.init(examWidget2," "),
        ),
      );
    },
     child: Padding(
      padding: const EdgeInsets.only(
          left: 10, right: 10, top: 3, bottom: 3
      ),
      // This is the Main Table Container
      child: Container(
        // given Box Shadow to the Container
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
              padding:
              const EdgeInsets.only(top: 5, left: 5, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  // this Padding is Used to render the Horizontal line Starts

                  // this Padding is Used to render the Horizontal line Ends


                  // this Padding is Used to render the Horizontal line Starts

                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 1, top: 3, bottom: 8
                    ),
                    child: Row(
                      children: <Widget>[


                        Padding(
                          padding:  EdgeInsets.only(right: 0),
                          // child: Center(
                          child: Stack(
                            overflow: Overflow.visible,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: AppTheme.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(100.0),
                                    ),
                                    border: new Border.all(
                                        width: 2,
                                        color: AppTheme
                                            .nearlyDarkBlue
                                            .withOpacity(0.2)),
                                    //color:HexColor("#FF5287"),),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        data.totalMark.toString(),
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontFamily:
                                          AppTheme.robotoFontName,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                          letterSpacing: 0.0,
                                          color: AppTheme
                                              .nearlyDarkBlue,


                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),
                          //),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 0, right: 5, top: 8, bottom: 8
                          ),
                          child: Container(
                            height: 2,
                            decoration: BoxDecoration(
                              color: AppTheme.background,
                              borderRadius: BorderRadius.all(Radius.circular(4.0)),
                            ),
                          ),
                        ),
                        /* Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              data.owner,
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
                                'Created By',
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
                  ),*/
                        Expanded(
                          child: Padding(
                            padding:  EdgeInsets.only(
                                left: 0, right: 0, top: 4),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[

                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 1, bottom: 2),
                                            child:new  Text(
                                              data.name,
                                              textAlign: TextAlign.left,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontFamily:
                                                AppTheme.robotoFontName,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                letterSpacing: -0.1,
                                                color: AppTheme.darkerText
                                                ,
                                              ),
                                            ),
                                          ),

                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    left: 2, bottom: 3),
                                                child:
                                                Text(
                                                  data.subjectName,
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontFamily:
                                                      AppTheme
                                                          .robotoFontName,
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      fontSize: 12,
                                                      color: Colors.green
                                                  ),
                                                ),
                                              ),

                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),

                                Row(
                                  children: <Widget>[

                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 1, bottom: 2),
                                            child: Text(
                                              data.standardName,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily:
                                                AppTheme.robotoFontName,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                letterSpacing: -0.1,
                                                color: AppTheme.darkerText,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                            children: <Widget>[

                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    left: 1, bottom: 3),
                                                child: Text(
                                                  'Term A',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontFamily:
                                                      AppTheme
                                                          .robotoFontName,
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      fontSize: 12,
                                                      color: Colors.red
                                                  ),
                                                ),
                                              ),
                                            ],

                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
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
                                       //new DateTime.fromMillisecondsSinceEpoch(data.examDate).toString(),
                                      schoolUtils.getDateStringFromLongWithSchoolTimeZone(data.examDate),
                                    style: TextStyle(
                                      fontFamily: AppTheme.robotoFontName,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      letterSpacing: -0.2,
                                      color: AppTheme.darkText,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Text(
                                      data.owner,
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
                            ],
                          ),
                        )
                      ],
                    ),


                  )

                ],
              ),
            ),
          ],
        ),
      ),
    ),);

  }

  Widget _listNotFound(){
    return Padding(
      padding: const EdgeInsets.only(
          left: 10, right: 10, top: 3, bottom: 3
      ),
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
              padding:
              const EdgeInsets.only(top: 5, left: 5, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 4, bottom: 1,top: 5),
                    /*child: Text(
                        'Title',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: AppTheme.robotoFontName,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            letterSpacing: -0.1,
                            color: AppTheme.darkText),
                      ),*/
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                              'Event Not Found',
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  openFilterAlert() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Exam Filter"),
            content: Container(
              child: //getEditForm(student),
               Text("hello"),

              //getDisplayForm(),
            ),
            /*actions: <Widget>[
              _isEditBtn
                  ? MaterialButton(
                  child: Text("Edit"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => getStudentEditForm(
                              object: student,
                              onCustCallBack: (){
                                print('hey done');
                              }
                          )),
                    );

                  }) : null,
              MaterialButton(
                  child: Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],*/
          );
        });
  }

  Widget getDisplayForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(1.0),
      child: Column(
        children: <Widget>[
          Container(
              alignment: Alignment.topLeft,
              child: Text("Father details",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold))),
          Container(
            padding:
            EdgeInsets.only(top: 2.0, bottom: 2.0, right: 2.0, left: 20.0),
            alignment: Alignment.topLeft,
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: "First Name: ",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: "Dilip",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding:
            EdgeInsets.only(top: 2.0, bottom: 2.0, right: 2.0, left: 20.0),
            alignment: Alignment.topLeft,
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: "Last Name: ",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: "Kadam",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding:
            EdgeInsets.only(top: 2.0, bottom: 2.0, right: 2.0, left: 20.0),
            alignment: Alignment.topLeft,
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: "Email: ",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: "dilip123@gmail.com",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding:
            EdgeInsets.only(top: 2.0, bottom: 2.0, right: 2.0, left: 20.0),
            alignment: Alignment.topLeft,
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: "Contact: ",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: "9405186233",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text("Mother details",
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            padding:
            EdgeInsets.only(top: 2.0, bottom: 2.0, right: 2.0, left: 20.0),
            alignment: Alignment.topLeft,
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: "First Name: ",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: "Kalpana",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding:
            EdgeInsets.only(top: 2.0, bottom: 2.0, right: 2.0, left: 20.0),
            alignment: Alignment.topLeft,
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: "Last Name: ",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: "Kadam",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding:
            EdgeInsets.only(top: 2.0, bottom: 2.0, right: 2.0, left: 20.0),
            alignment: Alignment.topLeft,
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: "Email: ",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: "k123@gmail.com",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding:
            EdgeInsets.only(top: 2.0, bottom: 2.0, right: 2.0, left: 20.0),
            alignment: Alignment.topLeft,
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: "Contact: ",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: "9422481016",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  } //getDisplayForm
}




