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
  _setValue(double value) => (setState(()=> _value = value));

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
              new Slider(value: _value,onChanged: _setValue),
              new Container(
                padding: new EdgeInsets.all(32.0),
                child: new LinearProgressIndicator(value: _value, valueColor: AlwaysStoppedAnimation<Color>(Colors.green))
              ),
              new Container(
                padding: new EdgeInsets.all(32.0),
                child: CircularProgressIndicator(value: _value),
              )
            ],
          ),
        ),
      ),
    );
  }
}
