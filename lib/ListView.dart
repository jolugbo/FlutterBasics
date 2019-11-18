import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:json_annotation/json_annotation.dart';

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
  Map _countries = new Map();
  void _getData() async{
    var url = 'http://country.io/names.json';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() => _countries = jsonDecode(response.body));
      print('Loaded ${_countries.length} countries');
      //print('Loaded ${response.body} countries');
    }  
  }

  @override
  Widget build(BuildContext context) {
    //_getData();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter Country List"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("Countries",style: new TextStyle(fontWeight:FontWeight.bold),),
              new Expanded(child: new ListView.builder(
                itemCount: _countries.length,
                padding: new EdgeInsets.fromLTRB(32.0,50.0,18.0,10.0),
                itemBuilder: (BuildContext context, int index){
                String key = _countries.values.elementAt(index);
                return new Row(children: <Widget>[
                  new Text('$key:'),
                ]);
              },))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState(){
    _getData();
  }

}
