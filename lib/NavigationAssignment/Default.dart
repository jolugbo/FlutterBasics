import 'package:flutter/material.dart';
import 'GlobalState.dart';

class Default extends StatefulWidget{
  @override
  _DefaultState createState() => new _DefaultState();

}
class _DefaultState extends State<Default>{
  GlobalState _store = GlobalState.instance;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home page"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("Hello ${_store.get("name")} Welcome!"),
              RaisedButton(onPressed: (){Navigator.of(context).pushNamed('/Profile');},child: Text("Profile"),),
              RaisedButton(onPressed: (){Navigator.of(context).pop();},child: Text("Log Out"),)
            ],
          ),
        ),
      ),
    );
  }
}
