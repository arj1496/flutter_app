import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../AppTheme.dart';



class ApprovalUI extends StatefulWidget {
  @override
  _ListTileViewUVState createState() => _ListTileViewUVState();
}

class _ListTileViewUVState extends State<ApprovalUI> {

  Color color = AppTheme.white;

  List<int> _isSelected = new List( );
  List<String> choices = const <String>[
    "Approve selected" ,
    "Rework selected" ,
    "Reject selected" ,
    "Uncomplete selected" ,
    "Mark all approve"
  ];
  @override
  Widget build( BuildContext context ) {
    return Scaffold (
      appBar: AppBar (
        elevation: 0.0 ,
        backgroundColor: AppTheme.background ,
        title: Text ( "Approval" ) ,
        actions: <Widget>[
          IconButton (
            icon: Icon ( Icons.search ) ,
            onPressed: ( ) {
              Navigator.push (
                context ,
                MaterialPageRoute ( builder: ( context ) => ApprovalUI ( ) ) ,
              );
            } ,
          ) ,
          Padding (
            padding: const EdgeInsets.only( top: 0.0 ) ,
            child: PopupMenuButton<String> (
              elevation: 3.2 ,
              // initialValue: choices[1],
              onCanceled: ( ) {
                print ( 'You have not chossed anything' );
              } ,

              onSelected: (value) {
               _select(value);
              },
              tooltip: 'This is tooltip' ,
              itemBuilder: ( BuildContext context ) {
                return choices.map ( ( String choice ) {
                  return PopupMenuItem<String> (
                    value: choice ,
                    child: Text ( choice ) ,
                  );
                } ).toList ( );
              } ,
            ) ,
          ) ,


        ] ,
      ) ,
      body: _getListViewWithBuilder ( context ) ,
    );
    //return _getListViewWithBuilder();
  }
  void _select(String choice) {
    switch(choice){
      case "Approve selected" : _showAlert();
                                 break;
      case "Rework selected" : _showAlert();
                                 break;
      case "Reject selected" : _showAlert();
      break;
      case "Uncomplete selected" : _showAlert();
      break;
      case "Mark all approve" : _showAlertForMarkAll();
      break;
    }
  }

  Widget _getListViewWithBuilder( BuildContext context ) {
    return Container (
      color: AppTheme.background ,
      /* child: GestureDetector(
        onLongPress: (){
          setState(() {
           setColor();
          });
        },*/
      child: ListView.builder (
          itemCount: 3 ,
          itemBuilder: ( BuildContext ctxt , int Index ) {
            return _renderlistTileView ( ctxt , Index );
          }

      ) ,
      // ),
    );
  }


// Pass exam field to widget constructur to fill in the exam detail page
  Widget _renderlistTileView( ctxt , index ) {
    _isSelected != null && _isSelected.contains ( index ) ?
    color = Colors.black12 : color = AppTheme.white;
    return Padding (
      padding: const EdgeInsets.only(
          left: 10 , right: 10 , top: 3 , bottom: 3
      ) ,
      // This is the Main Table Container
      child: GestureDetector (
        onLongPress: ( ) {
          setState ( ( ) {
            setColor ( index );
          } );
        } ,
        onTap: ( ) {
          setState ( ( ) {
            removeColor ( index );
          } );
        } ,
        child: Container (

          // given Box Shadow to the Container
          decoration: BoxDecoration (
            color: color ,
            borderRadius: BorderRadius.only (
                topLeft: Radius.circular ( 8.0 ) ,
                bottomLeft: Radius.circular ( 8.0 ) ,
                bottomRight: Radius.circular ( 8.0 ) ,
                topRight: Radius.circular ( 8.0 )
            ) ,
            boxShadow: <BoxShadow>[
              BoxShadow (
                  color: AppTheme.grey.withOpacity ( 0.2 ) ,
                  offset: Offset ( 1.1 , 1.1 ) ,
                  blurRadius: 10.0
              ) ,
            ] ,
          ) ,
          child: Column (
            children: <Widget>[
              Padding (
                padding:
                const EdgeInsets.only( top: 5 , left: 5 , right: 10 ) ,
                child: Column (
                  mainAxisAlignment: MainAxisAlignment.center ,
                  crossAxisAlignment: CrossAxisAlignment.start ,
                  children: <Widget>[

                    // this Padding is Used to render the Horizontal line Starts

                    // this Padding is Used to render the Horizontal line Ends


                    // this Padding is Used to render the Horizontal line Starts

                    Padding (
                      padding: const EdgeInsets.only(
                          left: 10 , right: 1 , top: 3 , bottom: 8
                      ) ,
                      child: Row (
                        children: <Widget>[
                          Padding (
                            padding: const EdgeInsets.only(
                                left: 0 , right: 5 , top: 8 , bottom: 8
                            ) ,
                            child: Container (
                              height: 2 ,
                              decoration: BoxDecoration (
                                color: AppTheme.background ,
                                borderRadius: BorderRadius.all (
                                    Radius.circular ( 4.0 ) ) ,
                              ) ,
                            ) ,
                          ) ,

                          Expanded (
                            child: Padding (
                              padding: EdgeInsets.only (
                                  left: 0 , right: 0 , top: 4 ) ,
                              child: Column (
                                children: <Widget>[
                                  Row (
                                    children: <Widget>[
                                      Padding (
                                        padding: const EdgeInsets.all( 0.0 ) ,
                                        child: Column (
                                          mainAxisAlignment:
                                          MainAxisAlignment.start ,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start ,
                                          children: <Widget>[

                                            Padding (
                                              padding: const EdgeInsets.only(
                                                  left: 1 , bottom: 2 ) ,
                                              child: new Text(
                                                "Sayali Joshi" ,
                                                textAlign: TextAlign.left ,
                                                overflow: TextOverflow
                                                    .ellipsis ,
                                                style: TextStyle (
                                                  fontFamily:
                                                  AppTheme.robotoFontName ,
                                                  fontWeight: FontWeight.bold ,
                                                  fontSize: 16 ,
                                                  letterSpacing: -0.1 ,
                                                  color: AppTheme.darkerText
                                                  ,
                                                ) ,
                                              ) ,
                                            ) ,

                                            Row (
                                              mainAxisAlignment:
                                              MainAxisAlignment.center ,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.end ,
                                              children: <Widget>[
                                                Padding (
                                                  padding:
                                                  const EdgeInsets.only(
                                                      left: 2 , bottom: 3 ) ,
                                                  child:
                                                  Text (
                                                    "Submitted" ,
                                                    overflow: TextOverflow
                                                        .ellipsis ,
                                                    textAlign: TextAlign
                                                        .center ,
                                                    style: TextStyle (
                                                        fontFamily:
                                                        AppTheme
                                                            .robotoFontName ,
                                                        fontWeight:
                                                        FontWeight.w600 ,
                                                        fontSize: 12 ,
                                                        color: Colors.green
                                                    ) ,
                                                  ) ,
                                                ) ,

                                              ] ,
                                            )
                                          ] ,
                                        ) ,
                                      )
                                    ] ,
                                  ) ,

                                  Row (
                                    children: <Widget>[
                                      Padding (
                                        padding: EdgeInsets.all ( 0.0 ) ,
                                        child: Column (
                                          mainAxisAlignment:
                                          MainAxisAlignment.center ,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start ,
                                          children: <Widget>[
                                            Padding (
                                              padding: EdgeInsets.only (
                                                  left: 1 , bottom: 2 ) ,
                                              child: Text (
                                                "Submitted on: 9 Nov,2019" ,
                                                textAlign: TextAlign.center ,
                                                style: TextStyle (
                                                  fontFamily:
                                                  AppTheme.robotoFontName ,
                                                  fontWeight: FontWeight.w500 ,
                                                  fontSize: 12 ,
                                                  letterSpacing: -0.1 ,
                                                  color: AppTheme.darkerText ,
                                                ) ,
                                              ) ,
                                            ) ,

                                          ] ,
                                        ) ,
                                      )
                                    ] ,
                                  )
                                ] ,
                              ) ,
                            ) ,
                          ) ,
                          Expanded (
                            child: Row (
                              mainAxisAlignment: MainAxisAlignment.end ,
                              crossAxisAlignment: CrossAxisAlignment.end ,
                              children: <Widget>[
                                Padding (
                                  padding: const EdgeInsets.only(
                                      bottom: 13.0 , right: 5 ) ,

                                    child: GestureDetector(
                                      onTap: ( ) {
                                        setState ( ( ) {
                                          _showAlert();
                                        } );
                                      } ,
                                      child: SizedBox (
                                        width: 30 ,
                                        height: 30 ,
                                        child: Image.asset (
                                            "assets/images/clip.png"
                                        ) ,
                                      ),
                                    ),

                                ) ,
                                Padding (
                                  padding: EdgeInsets.only (
                                      bottom: 13 , left: 4 , right: 10 ) ,

                                  child: SizedBox (
                                      width: 30 ,
                                      height: 30 ,
                                      child: Icon (
                                          FontAwesomeIcons.facebookMessenger ,
                                          color: AppTheme.nearlyBlue )
                                  ) ,

                                ) ,
                                Padding (
                                  padding: EdgeInsets.only ( right: 5.0 ) ,
                                  child: Column (
                                    mainAxisAlignment: MainAxisAlignment.end ,
                                    crossAxisAlignment: CrossAxisAlignment.end ,
                                    children: <Widget>[
                                      Padding (
                                        padding: const EdgeInsets.only(
                                            right: 10.0 ) ,

                                          child: SizedBox (
                                            width: 10 ,
                                            height: 30 ,
                                            child:  GestureDetector(
                                              onTap: ( ) {
                                                setState ( ( ) {
                                                  _showAlert();
                                                } );
                                              } ,
                                              child: Icon (
                                                    FontAwesomeIcons.thumbsUp ,
                                                    color: Colors.green ),
                                            ) ,
                                          ),
                                        ) ,



                                      Padding (
                                        padding: const EdgeInsets.only(
                                            top: 6 , right:10 ) ,

                                        child: SizedBox (
                                          width: 10 ,
                                          height: 30 ,
                                          child: GestureDetector(
                                              onTap: ( ) {
                                                setState ( ( ) {
                                                  _showAlert();
                                                } );
                                              } ,
                                              child:  Icon (
                                                      FontAwesomeIcons.thumbsDown ,
                                                      color: Colors.red ),
                                                ) ,
                                                // onPressed: _showAlert(ctxt),
                                              ),
                                            ),
                                    ] ,
                                  ) ,
                                ) ,
                              ] ,
                            ) ,
                          ) ,

                        ] ,
                      ) ,


                    )

                  ] ,
                ) ,
              ) ,
            ] ,
          ) ,
        ) ,
      ) ,
    );
  }


  _showAlert(  ) {
    return showDialog (
        context: context ,
        builder: ( context ) {
          return AlertDialog (
            title: new Text( "Add Review Note" ) ,
            content: TextFormField (
              decoration: InputDecoration (
                hintText: "Enter Review" ,
              ) ,
            ) ,
            actions: <Widget>[
              MaterialButton (
                  child: Text ( "APPROVE" ) ,
                  onPressed: ( ) {
                    // widget.callback ( selectedsSubjectList );
                    /// Navigator.pop ( context );
                  } ) ,
              MaterialButton (
                  child: Text ( "CANCEL" ) ,
                  onPressed: ( ) {
                    Navigator.of ( context ).pop ( );
                  } ) ,
            ] ,
          );
        }
    );
  }

  _showAlertForMarkAll(  ) {
    return showDialog (
        context: context ,
        builder: ( context ) {
          return AlertDialog (
            title: new Text( "Confirmation" ) ,
            content: Text("This will Approve all student assignment(which has status No Progress)"
            ) ,
            actions: <Widget>[
              MaterialButton (
                  child: Text ( "APPROVE ALL" ) ,
                  onPressed: () {
                    // widget.callback ( selectedsSubjectList );
                    /// Navigator.pop ( context );
                  } ) ,
              MaterialButton (
                  child: Text ( "CANCEL" ) ,
                  onPressed: () {
                    Navigator.of ( context ).pop ();
                  } ) ,
            ] ,
          );
        }
    );
  }

  setColor( int index ) {
    _isSelected.add( index );
  }

  void removeColor(index) {
    if (_isSelected.contains ( index )) {
      _isSelected.remove(index);
    }
  }
}




