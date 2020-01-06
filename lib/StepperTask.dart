import 'package:flutter/cupertino.dart';
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
  int _current;
  List<Step> _steps;
  String _value;
  String _age;

  void _onNameChange(String value) {
    setState(() => _value = 'Name: $value');
  }
  void _onAgeChange(String value) {
    setState(() => _age = 'Age: $value');
  }

  @override
  void initState(){
    _current = 0;
    _steps = <Step>[
      new Step(title: Text("user's name"), content: Container(padding: EdgeInsets.all(20),
        child: Center(child: Column(
          children: <Widget>[
            TextFormField(onChanged: _onNameChange,),
          ],),),)),
      new Step(title: Text("users Age"), content: Container(padding: EdgeInsets.all(20),
        child: Center(child: Column(
          children: <Widget>[
            TextFormField(onChanged: _onAgeChange,),
          ],),),)),
      new Step(title: Text("users Record"), content: Container(padding: EdgeInsets.all(20),
        child: Center(child: Column(
          children: <Widget>[
            Text(_value + ' '+ _age),
          ],),),)),

    ];
  }
  void _stepContinue(){
    setState(() {
      _current++;
      if (_current >= _steps.length ) {
        _current = _steps.length - 1;
      }
    });
  }
  void _stepCancle(){
    setState(() {
      _current--;
      if (_current <= 0 ) {
        _current = 0;
      }
      print("Cancle $_current");
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
          child: new Column(
            children: <Widget>[
              Stepper(steps: _steps,onStepCancel: _stepCancle,onStepContinue: _stepContinue,)
            ],
          ),
        ),
      ),
    );
  }
}
