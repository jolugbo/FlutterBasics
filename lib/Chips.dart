import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: new MainApp()));
}

class MainApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MainApp> {
  int counter = 0;
  List<Widget> _list = new List<Widget>();
  final GlobalKey<ScaffoldState> _scaffoldState = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    for (int i = 0; i < 5; i++) {
      Widget child = _newItem(i);
        counter++;
      _list.add(child);
    }
  }

  void _onClicked() {
    setState(() {
      counter++;
    });
    Widget child = _newItem(counter);
    setState(() => _list.add(child));
  }

  Widget _newItem(int i) {
    Key key = new Key("item_$i");
    Container child= new Container(
      key: key,
      padding: new EdgeInsets.all(10.0),
      child: new Chip(
        label: new Text("$i Name Here"),
        deleteIconColor: Colors.red,
        deleteButtonTooltipMessage: 'Delete',
        onDeleted: () => _removeItem(key),
        avatar: CircleAvatar(
          backgroundColor: Colors.grey.shade500,
          child: new Icon(Icons.person),
        ),
      ),
    );
    return child;
  }
  void _removeItem(Key key) {
    for(int i=0;i< _list.length;i++){
      Widget child = _list.elementAt(i);
      if (child.key == key) {
        setState(() {
          _list.removeAt(i);
          counter--;
          _scaffoldState.currentState.showSnackBar(SnackBar(content: Text("Content Removed")));
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldState,
      appBar: new AppBar(
        title: new Text("Project Flutter"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: _onClicked,child: IconButton(icon: Icon(Icons.add))),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: _list,
          ),
        ),
      ),
    );
  }
}
