import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'PushNamedUntil/Admin1.dart';
import 'PushNamedUntil/Admin2.dart';
import 'PushNamedUntil/SettingsPage.dart';

void main(){
  runApp(
      new MainApp()
  );
}
class MainApp extends StatelessWidget{
  @override
 Widget build(BuildContext context){
    return new MaterialApp(
    title: 'Navigation',
      routes: <String, WidgetBuilder>{
        '/Admin1': (BuildContext context) => new Admin1(),
        '/Admin2': (BuildContext context) => new Admin2(),
        '/Settings': (BuildContext context) => new SettingsPage(),
      },
      home: Admin1(),
    );
  }

}

