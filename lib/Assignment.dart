import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(new MaterialApp(home: new MainApp()));
}

class MainApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}
enum Options {Yes, No,Maybe}
class _State extends State<MainApp> {
  List<BottomNavigationBarItem> _items;
  int _value = 0;
  String _item = '';
  String _notificationVar = '';
  String _CurrentTime = '';
  final GlobalKey<ScaffoldState> _scaffoldState = new GlobalKey<ScaffoldState>();
  _setTime() => setState(() => _CurrentTime = DateTime.now().toString());
  _setValue(String value) => setState(() => _item = value);
  _subValue() => setState(() => _value--);
  _addValue() => setState(() => _value++);
  _setNotificationValue(String value) => setState(()=> _notificationVar = value);
  //methods
Future _showAlert(BuildContext context,String message) async{
  return showDialog(context: context,child:
  new AlertDialog(title: Text(message),
      actions: <Widget>[RaisedButton.icon(onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.exit_to_app), label: Text("Exit"))]));
}
Future _askUser()async{
  switch(
  await showDialog(context:context,
      child:new SimpleDialog(
        title:new Text("Do you like flutter "),
      children: <Widget>[
        SimpleDialogOption(child: Text("Yes!!!"),onPressed: () => {Navigator.pop(context,Options.Yes)},),
        SimpleDialogOption(child: Text("No :("),onPressed: () =>  {Navigator.pop(context,Options.No)},),
        SimpleDialogOption(child: Text("Maybe"),onPressed: () => {Navigator.pop(context,Options.Maybe)},),
      ],)

  )
  ){
    case Options.Yes:
      _setValue("Yes");
      break;
    case Options.No:
      _setValue("No");
      break;
    case Options.Maybe:
      _setValue("Maybe");
      break;
  }
}
  // method to show modal view
  void _showBottom(){
    showModalBottomSheet<void>(context: context, builder: (BuildContext context){
      return new Container(
        padding: new EdgeInsets.all(15.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("New Jazzy Song ",style: new TextStyle(color: Colors.red,fontWeight: FontWeight.bold)),
            new RaisedButton.icon(onPressed: () => Navigator.pop(context), icon: Icon(Icons.new_releases), label: Text("New"))
          ],
        ),
      );
    });
  }
void _showBar(){
    _scaffoldState.currentState.showSnackBar(SnackBar(content: Text("Notification")));
}
  //initialise d variables like a constructor...
  @override
  void initState() {
    _items = new List();
    _items.add(new BottomNavigationBarItem(
      icon: new Icon(Icons.music_note,), title: new Text("Music",),) );
    _items.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.playlist_play,), title: new Text("Playlist",)));
    _items.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.new_releases), title: new Text("Discover")));
  }

  //create graphics/visuals
  @override
  Widget build(BuildContext context) {

    //visuals wrapper
    return new Scaffold(

      //top bar/nav bar
      key: _scaffoldState,
      appBar: new AppBar(
        title: new Text("Play"),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.add), onPressed: _addValue, iconSize: 30),
          new IconButton(
              icon: Icon(Icons.minimize), onPressed: _subValue, iconSize: 30)
        ],
        backgroundColor: Colors.black,
      ),

      //footer buttons different from bottom tabs
//      persistentFooterButtons: <Widget>[
//        new IconButton(
//          icon: new Icon(Icons.person),
//          onPressed: _addValue,
//        ),
//        new IconButton(
//          icon: new Icon(Icons.list),
//          onPressed: _subValue,
//        ),
//        new IconButton(
//          icon: new Icon(Icons.settings),
//          onPressed: _addValue,
//        )
//      ],

      //side menu drawer
      drawer: new Drawer(
        child: new Container(
          padding: new EdgeInsets.all(32.0),
          //decoration: prefix0.BlendMode.color(Colors.red),
          child: new Column(
            children: <Widget>[
              new Icon(Icons.person),
              new FlatButton.icon(
                label: new Text("Home"),
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.home),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pop(context),
                child: new Text("Home"),
              )
              //new IconButton(icon: Icon(Icons.home), onPressed: ()=> Navigator.pop(context))
            ],
          ),
        ),
      ),


      //floater button / note for list
      floatingActionButton: new FloatingActionButton(
        onPressed: _setTime,
        child: Icon(Icons.library_music),
        backgroundColor: Colors.red,
      ),

//bottom navigation tabs
      bottomNavigationBar: new BottomNavigationBar(
        fixedColor: Colors.red,
        unselectedItemColor: Colors.black,
        items: _items,
        //selectedItemColor: Colors.blue,
        currentIndex: _value,
        onTap: (int item) {
          setState(() {
            _value = item;
            _item = "Current Value is $_value";
          });
        },
      ),

      //app actual body
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("$_value"),
              new Text("$_item"),
              new Text("$_CurrentTime"),
              new RaisedButton(onPressed: _showBottom,child: new Text("Refreash"),),
              new RaisedButton(onPressed: () => _showAlert(context,"Flutter Dialog Test"),child: new Text("Alert"),),
              new RaisedButton.icon(onPressed: _showBar, icon: Icon(Icons.notifications), label: Text("Notify Me")),
              new RaisedButton.icon(onPressed: _askUser, icon: Icon(Icons.select_all), label: Text("Select Option")),
//              new TextField(
//                decoration: InputDecoration(
//                    icon: Icon(Icons.person_add), hintText: "Name"),
//                onChanged: _setValue,
//                keyboardType: TextInputType.number,
//              ),
            ],
          ),
        ),
      ),
    );
  }
}
