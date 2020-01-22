import 'package:flutter/material.dart';

class Admin2 extends StatefulWidget{
  @override
  _Admin2State createState() => new _Admin2State();
}

class _Admin2State extends State<Admin2>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Admin Page "),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("Login Successfull"),
              RaisedButton(onPressed: (){Navigator.of(context).pushNamed('/Settings');},child: Text("Settings Page"),),
              RaisedButton(onPressed: (){Navigator.of(context).pushNamed('/Admin1');},child: Text("Log Out"),)
            ],
          ),
        ),
      ),
    );
  }
}
