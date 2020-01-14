import 'package:flutter/material.dart';
import 'package:flutterDemo/Authenticator.dart';

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
  bool _isAuthenticated;

  void _onAuthenticated(bool value){
    setState(() {
      _isAuthenticated = value;
    });
  }
  @override
 void initState(){
      _isAuthenticated = false;
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
              new Authenticator(onAuthenticated: _onAuthenticated,),
              new Text("Authenticaed $_isAuthenticated")
            ],
          ),
        ),
      ),
    );
  }
}
