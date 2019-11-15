import 'package:flutter/material.dart';
import 'package:flutter_app/src/mo/Standard/Standard.dart';
import 'package:flutter_app/src/mo/Standard/StandardActivity.dart';
import '../../../AppTheme.dart';


class ClassPopup extends StatefulWidget {

  final Function callback;
  final List<int> data;
  const ClassPopup(
      {this.callback,this.data});

  @override
  State<StatefulWidget> createState() => _MyPageState();
}

Future<List<Standard>> getStandards() async {
  StandardActivity standardActivity = new StandardActivity();
 Future<List<Standard>> _standards = standardActivity.getStandardListFromLocalDB();
  return _standards;
}

class _MyPageState extends State<ClassPopup> {
  List<String> participantConst =["Teachers","Parents","Students"];
  List<Standard> standardList = new List( );
  List<int> selectedsStandardList = new List( );
  bool flag = true;

  @override
  Widget build( BuildContext context ) {
    return _showAlert ( context );
  }

  Widget _showAlert( BuildContext context ) {
    return AlertDialog (
      title: Text ( "Select Classes" ) ,
      content:SingleChildScrollView(
      child:Column (
        mainAxisSize: MainAxisSize.min ,
        children: <Widget>[
          FutureBuilder (
              future: getStandards( ) ,
              builder: ( context , projectSnap ) {
                return Column (
                  children: _getStandardList ( projectSnap ) ,
                );
              } ) ,
        ] ,
      ) ,
      ),
      actions: <Widget>[
        MaterialButton (
            child: Text ( "Select" ) ,
            onPressed: ( ) {
              widget.callback ( selectedsStandardList );
              Navigator.pop ( context );
            } ) ,
        MaterialButton (
            child: Text ( "Close" ) ,
            onPressed: ( ) {
              Navigator.of ( context ).pop ( );
            } ) ,
      ] ,
    );
  }

  List<Widget> _getStandardList( AsyncSnapshot snapshot ) {
    standardList = snapshot.data;
    print ( standardList.length );
    if (snapshot.data != null) {
      // setSelectedList ( widget.data,flag );
      standardList = snapshot.data;
      //  setRange ( );
    }
    List<Widget> widgetList = new List();
    for (Standard standard in standardList) {
      Widget widget = getWidget( standard);
      widgetList.add(widget);
    }
    return widgetList;
  }
  Widget getWidget(Standard standard){
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(0.0),
        child: Row(
         children: <Widget>[
            Checkbox(
              value: false,
              onChanged: (bool value) {
                setState(() {

                });
              },
            ),
            Text(standard.name,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: AppTheme.robotoFontName,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        letterSpacing: 0.0,
                        color: AppTheme.nearlyBlack
                            .withOpacity(0.6),
                      ),
                    ),
         ],
        ),
      ),
          Padding(
            padding: const EdgeInsets.only(top:3.0),
            child: Container(
              height: 3,

              decoration: BoxDecoration(
                gradient: LinearGradient ( colors: [
                  AppTheme.nearlyDarkBlue ,
                  HexColor ( "#6F56E8" )
                ],
                ),
                borderRadius: BorderRadius.all(
                    Radius.circular(6.0)),
              ),
            ),
          ),
      ListView.builder (
           physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true ,
          itemCount: participantConst.length ,
          itemBuilder: ( context , i ) {
            return CheckboxListTile (
                value:false ,
                title: new Text( participantConst[i]) ,
                controlAffinity: ListTileControlAffinity.leading ,
                onChanged: ( bool val ) {
                  ItemChange ( val , i , );
                } );
          } ),

          Padding(
            padding: const EdgeInsets.only(bottom:3.0),
            child: Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient ( colors: [
                  AppTheme.nearlyDarkBlue ,
                  HexColor ( "#6F56E8" )
                ],
                ),
                borderRadius: BorderRadius.all(
                    Radius.circular(6.0)),
              ),
            ),
          ),
      ],
    );
  }


  List<bool> inputs = new List<bool>( );

  void ItemChange( bool val , int index ) {
    setState ( ( ) {
      inputs[index] = val;
      if (val) {
        if (!selectedsStandardList.contains ( standardList[index].id )) {
          selectedsStandardList.add ( standardList[index].id );
        }
      } /*else {
        selectedsSubjectList.removeAt ( index );
      }*/
    } );
  }

  setSelectedList( data ,flag) {
    if(flag) {
      for (int i = 0; i < data.length; i++) {
        if (!selectedsStandardList.contains ( data[i] )) {
          selectedsStandardList.add ( data[i] );
        }
      }
    }
    flag = false;
  }

  setRange( ) {
    for (int i = 0; i < standardList.length; i++) {
      if (widget.data.contains ( standardList[i].id )) {
        inputs.add ( true );
        if (!selectedsStandardList.contains ( widget.data[i] )) {
          selectedsStandardList.add ( widget.data[i] );
        }
      } else {
        inputs.add ( false );
      }

      //inputs.add(true);
    }
  }
}