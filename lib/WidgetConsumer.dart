import 'package:flutter/material.dart';
import 'Widget.dart';

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
        title: new Text("Widget Consumer"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new MyWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
