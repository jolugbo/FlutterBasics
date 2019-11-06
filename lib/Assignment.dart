import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: new MainApp()));
}

class MainApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MainApp> {
  List<BottomNavigationBarItem> _items;
  int _value = 0;
  String _item = '';
  String _CurrentTime = '';

  _setTime() => setState(() => _CurrentTime = DateTime.now().toString());
  _setValue(String value) => setState(() => _value = int.parse(value));
  _subValue() => setState(() => _value--);
  _addValue() => setState(() => _value++);

  //methods

  //initialise d variabls...
  @override
  void initState() {
    _items = new List();
    _items.add(
      new BottomNavigationBarItem(
          icon: new Icon(Icons.person), title: new Text("Profile")),
    );
    _items.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.list), title: new Text("Profile")));
    _items.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.settings), title: new Text("Profile")));
  }

  //create graphics/visuals
  @override
  Widget build(BuildContext context) {

    //visuals wrapper
    return new Scaffold(

      //top bar/nav bar
      appBar: new AppBar(
        title: new Text("Project Flutter"),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.add), onPressed: _addValue, iconSize: 30),
          new IconButton(
              icon: Icon(Icons.minimize), onPressed: _subValue, iconSize: 30)
        ],
        backgroundColor: Colors.green,
      ),

      //footer buttons different from bottom tabs
      persistentFooterButtons: <Widget>[
        new IconButton(
          icon: new Icon(Icons.person),
          onPressed: _addValue,
        ),
        new IconButton(
          icon: new Icon(Icons.list),
          onPressed: _subValue,
        ),
        new IconButton(
          icon: new Icon(Icons.settings),
          onPressed: _addValue,
        )
      ],

      //side menu drawer
      drawer: new Drawer(
        child: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Column(
            children: <Widget>[
              new Icon(Icons.person),
              new FlatButton.icon(
                label: new Text("Home"),
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.home),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pop(context),
                child: new Text("Home"),
              )
              //new IconButton(icon: Icon(Icons.home), onPressed: ()=> Navigator.pop(context))
            ],
          ),
        ),
      ),


      //floater button / note for list
      floatingActionButton: new FloatingActionButton(
        onPressed: _setTime,
        child: Icon(Icons.watch_later),
        backgroundColor: Colors.green,
      ),

//bottom navigation tabs
      bottomNavigationBar: new BottomNavigationBar(
        items: _items,
        fixedColor: Colors.blue,
        currentIndex: _value,
        onTap: (int item) {
          setState(() {
            _value = item;
            _item = "Current Value is $_value";
          });
        },
      ),

      //app actual body
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("$_value"),
              new TextField(
                decoration: InputDecoration(
                    icon: Icon(Icons.person_add), hintText: "Name"),
                onChanged: _setValue,
                keyboardType: TextInputType.number,
              ),
              new Text("$_CurrentTime"),
            ],
          ),
        ),
      ),
    );
  }
}
