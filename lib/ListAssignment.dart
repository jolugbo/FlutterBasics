import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    home: new MainApp()
  ));
}
class MainApp extends StatefulWidget{
  @override
  _State createState() => new _State();
  _getPets()=>{};
}
class _State extends State<MainApp>{
  List _pets = ["cat","dog","chipmunk","snake"];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Pet List"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("Pet List",style: new TextStyle(fontWeight: FontWeight.bold),),
              new Expanded(child:
              new ListView.builder(itemCount: _pets.length,itemBuilder: (BuildContext context, int index){
                String key = _pets[index];
                return new Row(children: <Widget>[
                  new Text(key),
                ]);
              }))
            ],
          ),
        ),
      ),
    );
  }
}
