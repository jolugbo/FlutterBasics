import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  TextEditingController _user = new TextEditingController();
  TextEditingController _pass = new TextEditingController();
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
              new Text("Please Login"),
              new Row(children: <Widget>[
                Text('Username '),
                new Expanded(child: TextField(controller: _user,)),
              ]),
              new Row(children: <Widget>[
                Text('Password '),
                new Expanded(child: TextField(controller: _pass,obscureText: true ,)),
              ],
              ),
              new Padding(padding: EdgeInsets.all(12.0),
                  child: RaisedButton(onPressed: () => print("login${_user.text}"),child: Text('Click Me'),))
            ],
          )
        ),
      ),
    );
  }
}
