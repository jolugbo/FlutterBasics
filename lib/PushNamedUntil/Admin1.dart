import 'package:flutter/material.dart';

class Admin1 extends StatefulWidget{
  @override
  _Admin1State createState() => new _Admin1State();
}

class _Admin1State extends State<Admin1>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("login Page"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("click to login"),
              RaisedButton(onPressed: (){Navigator.of(context).pushNamedAndRemoveUntil('/Admin2',(Route<dynamic> route) => false);},child: Text("Login"),)
            ],
          ),
        ),
      ),
    );
  }
}
