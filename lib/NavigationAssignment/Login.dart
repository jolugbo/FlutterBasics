import 'package:flutter/material.dart';


class Login extends StatefulWidget{
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login Page"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("Login Page"),
              RaisedButton(onPressed: (){Navigator.of(context).pushNamed('/Default');},child: Text("Login"),)
            ],
          ),
        ),
      ),
    );
  }
}
