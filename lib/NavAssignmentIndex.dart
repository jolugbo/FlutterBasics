import 'package:flutter/material.dart';
import 'NavigationAssignment/Login.dart';
import 'NavigationAssignment/Default.dart';
import 'NavigationAssignment/Profile.dart';
void main(){
  runApp(new MainApp());
}
class MainApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Navigations",
      routes: <String, WidgetBuilder>{
        "/Login": (BuildContext context) => new Login(),
        "/Default": (BuildContext context) => new Default(),
        "/Profile": (BuildContext context) => new Profile(),
      },
      home: new Login(),
    );
  }
}
