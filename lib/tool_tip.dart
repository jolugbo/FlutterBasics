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
   String _value = "nothing yet";
   void onClick() => setState(() => _value = new DateTime.now().toString());
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
              new Text(_value),
              new IconButton(icon: Icon(Icons.timer), onPressed: onClick,tooltip: "Click Me",)
            ],
          ),
        ),
      ),
    );
  }
}
