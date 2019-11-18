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
class _State extends State<MainApp>{
  final GlobalKey<ScaffoldState> _scaffoldState = new GlobalKey<ScaffoldState>();
  String _value = "";
  void showModal() => {
    _scaffoldState.currentState.showSnackBar(SnackBar(content: Text("You Have Been Alerted"),))
    //showModalBottomSheet(context: context, builder: (BuildContext builder){
    //return new Container(padding: EdgeInsets.all(32.0),child: Text("$_value"),);
  };//)};
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldState,
      appBar: new AppBar(
        title: new Text("User IO Page"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new TextField(decoration: new InputDecoration(icon: Icon(Icons.person)),onSubmitted: (val) => setState(()=>_value = val) ,),
              new RaisedButton(onPressed: showModal, color: Colors.green,child: new Text("Enter"),)
            ],
          ),
        ),
      ),
    );
  }
}
