import 'package:flutter/material.dart';
import 'About.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => new _HomeState();

}
class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home Page"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("Home Page"),
              RaisedButton(onPressed: (){Navigator.of(context).pushNamed('/About');},child: Text("Next Page"),)
            ],
          ),
        ),
      ),
    );
  }
}
