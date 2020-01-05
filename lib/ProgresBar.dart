import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    home: new MainApp()
  ));
}
class MainApp extends StatefulWidget{
  @override
  _State createState() => new _State();

}
class _State extends State<MainApp>{
  double _value = 0.0;
  @override
  void initState(){
    Timer t = new Timer.periodic(Duration(milliseconds: 100),
            (Timer timer)=>  setState(() {
              print(_value);
              if (_value>=1.0) {
                return;
              }
              _value+=0.01;
            } ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Project Flutter"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new LinearProgressIndicator(value: _value, valueColor: AlwaysStoppedAnimation<Color>(Colors.green))
            ],
          ),
        ),
      ),
    );
  }
}
