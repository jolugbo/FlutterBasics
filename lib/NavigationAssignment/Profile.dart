import 'package:flutter/material.dart';


class Profile extends StatefulWidget{
  @override
  _ProfileState createState() => new _ProfileState();

}
class _ProfileState extends State<Profile>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Profile Page"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("Profile Page"),
              RaisedButton(onPressed: (){Navigator.of(context).pop();},child: Text("Back"),)
            ],
          ),
        ),
      ),
    );
  }
}
