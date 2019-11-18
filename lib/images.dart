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
              new Text("Image Demo"),
              new Expanded(child: new Image.network('https://miro.medium.com/max/1000/1*ilC2Aqp5sZd1wi0CopD1Hw.png')),
              new Expanded(child: new Image.asset('images/logo.png')),
            ],
          ),
        ),
      ),
    );
  }
}
