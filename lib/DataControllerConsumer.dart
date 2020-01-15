import 'package:flutter/material.dart';
import 'DataControllerAssignment.dart';

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
  String _data;

  void _onValueChange(String value){
    setState(() {
      _data = value;
    });
  }

@override
void initState(){
  _data = "";
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
              new DataController(onValueChanged: _onValueChange,),
              new Text("value passed: $_data")
            ],
          ),
        ),
      ),
    );
  }
}
