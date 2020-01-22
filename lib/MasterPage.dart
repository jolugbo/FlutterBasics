import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SubPages/Home.dart';
import 'SubPages/About.dart';
import 'SubPages/Contact.dart';
void main()  => runApp( new MyApp());
class  MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Navigation",
      routes: <String, WidgetBuilder>{
        '/Home' : (BuildContext contect) => new Home(),
        '/About' : (BuildContext contect) => new About(),
        '/Contact' : (BuildContext contect) => new Contact()
      },
      home: Home(),
    );
  }
}

