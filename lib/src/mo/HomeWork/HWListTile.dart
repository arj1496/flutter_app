import 'package:flutter/material.dart';
import 'package:flutter_app/src/mo/HomeWork/HomeWork.dart';

class HWListTile extends StatelessWidget {

  HomeWork _homeWork = null;

  HWListTile(HomeWork this._homeWork);



  @override
  Widget build(BuildContext context) {
   // return getRowTile(this._homeWork);
    return getRow(this._homeWork);
  }


  Widget getRowTile(HomeWork homeWork){

    return ListTile(
      leading:  Icon(Icons.account_balance),
      title: Text(_homeWork.title),
    );

  }


  Widget getRow(HomeWork homeWork){

/*
    return ListTile(

      leading: Row(
        children: <Widget>[
          Text("Hi Row")
        ],
      )
    );
*/

    return ListTile(

      leading:  Icon(Icons.account_balance),
      title: Container(
        color: Colors.amber,
        child: Row(

          children: <Widget>[
            Column(
              children: <Widget>[
                Text(this._homeWork.title)
              ],
            ),
            Column(
              children: <Widget>[
                Text( "Hi " +  this._homeWork.title)
              ],
            )


          ],
        ),
      ),
      
    );

    return Card(
      child:       Row(
        children: <Widget>[

          new Column(children: <Widget>[
            Text("Column - 1")
          ],),
          new Column(children: <Widget>[
            Text("Column - 2")
          ],),
          new Column(children: <Widget>[
            Text(this._homeWork.title)
          ],),

        ],
      ),
    );



  }


}
