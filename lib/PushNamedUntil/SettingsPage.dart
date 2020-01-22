import 'package:flutter/material.dart';


class SettingsPage extends StatefulWidget{
  @override
  _SettingsPageState createState() => new _SettingsPageState();

}
class _SettingsPageState extends State<SettingsPage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Settings Page"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("Setup Page"),
              RaisedButton(onPressed: (){Navigator.of(context).pop();},child: Text("Back"),)
            ],
          ),
        ),
      ),
    );
  }
}
