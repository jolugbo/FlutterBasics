import 'package:flutter/material.dart';
import 'GlobalState.dart';

class Login extends StatefulWidget{
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login>{
  TextEditingController _name;
  GlobalState _store = GlobalState.instance;

  @override
  void initState(){
    _name = TextEditingController();
    _store.set("name", "");
  }

  void _onPressed(){
       _store.set("name", _name.text);
        Navigator.of(context).pushNamed('/Default');
  }

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
              TextField(controller: _name,decoration: InputDecoration(labelText: "User Name"),),
              RaisedButton(onPressed: _onPressed,child: Text("Login"),)
            ],
          ),
        ),
      ),
    );
  }
}
