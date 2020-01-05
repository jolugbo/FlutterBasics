import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: new MainApp()));
}

class MainApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class Choice {
  final String title;
  final IconData icon;

  const Choice({this.title, this.icon});
}

class _State extends State<MainApp> with SingleTickerProviderStateMixin {
  TabController _controller;
  List<Choice> choices = const <Choice>[
    const Choice(title: "Car", icon: Icons.directions_car),
    const Choice(title: "Bicycle", icon: Icons.directions_bike),
    const Choice(title: "Boat", icon: Icons.directions_boat),
    const Choice(title: "Bus", icon: Icons.directions_bus),
    const Choice(title: "Train", icon: Icons.directions_railway),
    const Choice(title: "Walk", icon: Icons.directions_walk),
  ];
  @override
  void initState() {
    _controller = new TabController(length: choices.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Project Flutter"),
        bottom: PreferredSize(
            child: Theme(
                data: Theme.of(context).copyWith(accentColor: Colors.white),
                child: new Container(
                  height: 48.0,
                  alignment: Alignment.center,
                  child: TabPageSelector(
                    controller: _controller,
                  ),
                )),
            preferredSize: const Size.fromHeight(48.0)),
      ),
      body: new TabBarView(
          controller: _controller,
          children: choices.map((Choice choice) {
            return new Container(
              child: Column(
                children: <Widget>[
                  Text(
                    choice.title,
                    textScaleFactor: 3.0,
                  ),
                  Icon(
                    choice.icon,
                    size: 70.0,
                  )
                ],
              ),
              padding: EdgeInsets.all(40),
            );
          }).toList()),
    );
  }
}
