import 'package:flutter/material.dart';
import 'Home.dart';
import 'Contact.dart';

class About extends StatefulWidget{
  @override
  _AboutState createState() => new _AboutState();

}
class _AboutState extends State<About>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("About Page"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              Text("About Page"),
              RaisedButton(onPressed: null,child: Text("Next Page"),),
              RaisedButton(onPressed: null,child: Text("Back"),)
            ],
          ),
        ),
      ),
    );
  }
}
