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

class MyItem{
  bool IsExpanded;
  String Header;
  Widget body;
  MyItem(this.IsExpanded,this.Header,this.body){}
}

class _State extends State<MainApp>{
  List<MyItem> _items = new List<MyItem>();

  @override
  void initState(){
    for(int i = 0; i<10; i++){
      _items.add(new MyItem(false, "Item $i", new Container(
        padding: EdgeInsets.all(32.0),
        child: new Text("Content$i"),
      )));
    }
  }

  ExpansionPanel createPanel(MyItem myItem){
    return new ExpansionPanel(headerBuilder: (BuildContext context, bool isExpanded){
      return Container(
        padding: EdgeInsets.all(5.0),
        child: new Text("Header ${myItem.Header}"),
      );
    }, body: myItem.body,isExpanded: myItem.IsExpanded);
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
          child: new Column(
            children: <Widget>[
              new ExpansionPanelList(expansionCallback: (int index,bool isExpanded){
                setState(() {
                  _items[index].IsExpanded =!_items[index].IsExpanded;
                });
              },
              children: _items.map(createPanel).toList(),)
            ],
          ),
        ),
      ),
    );
  }
}
