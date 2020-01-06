import 'dart:math';

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
class Area{
  int index;
  String name;
  Color color;
   Area({this.index: -1, this.name: "Area", this.color: Colors.lightBlueAccent});
}
class _State extends State<MainApp>{
  int _location;
  List<Area> _area;

  @override
  void initState(){
    _area = List<Area>();
    for(int i = 0; i < 16 ; i++){
      _area.add(new Area(index: i,name: "Area $i"));
    }

    var randomGenerator = Random();
    _location = randomGenerator.nextInt(_area.length);
  }
  Widget _generate(int index){
      return new GridTile(child: Container(
        padding: EdgeInsets.all(5.0),
        child: RaisedButton(onPressed: ()=> _onPressed(index),
            color:_area[index].color,
        child: Text(_area[index].name,
        textAlign: TextAlign.center,),),
      ));
  }
  void _onPressed(int index){
    print(index);
    print(_location);
    setState(() {
      if (index == _location) {
        _area[index].color = Colors.green;
      }
      else
        _area[index].color = Colors.red;
    });
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
          child: new GridView.count(crossAxisCount: 4,
                              children: List<Widget>.generate(16,_generate)),
        ),
      ),
    );
  }
}
