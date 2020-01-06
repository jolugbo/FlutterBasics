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
  List<Step> _steps;
  int _current;
  List<bool> _Active = <bool>[false,false,true];
  @override
  void initState(){
    _current = 0;
    _steps =  <Step>[
      new Step(title: Text("step 1"), content: Container(child: Column(children: <Widget>[Text("Step 1 Task")],),),isActive: _Active[0]),
      new Step(title: Text("step 2"), content: Container(child: Column(children: <Widget>[Text("Step 2 Task")],),),isActive: _Active[1]),
      new Step(title: Text("step 3"), content: Container(child: Column(children: <Widget>[Text("Step 3 Task")],),),isActive: _Active[2]),
    ];
  }
  void _stepContinue(){
    setState(() {
      _current++;
      if (_current >= _steps.length ) {
        _current = _steps.length - 1;
      }
      print("Continue $_current");
      _Active[_current] = true;
    });
  }
  void _stepCancle(){
    setState(() {
      _current--;
      if (_current <= 0 ) {
        _current = 0;
      }
      print("Cancle $_current");
      _Active[_current] = false;
    });
  }
  void _stepClicked(int index){
    setState(() {
      _current = index;
      _Active[_current] = false;
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
              Stepper(steps: _steps,onStepContinue: _stepContinue, onStepCancel: _stepCancle,onStepTapped: _stepClicked,type: StepperType.vertical,currentStep: _current,)
            ],
          ),
        ),
      ),
    );
  }
}
