import 'package:flutter/material.dart';


class Contact extends StatefulWidget{
  @override
  _ContactState createState() => new _ContactState();
}
class _ContactState extends State<Contact>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Contact Page"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              Text("Contact Page"),
              RaisedButton(onPressed: (){Navigator.of(context).pop();},child: Text("Back"),)
            ],
          ),
        ),
      ),
    );
  }
}
