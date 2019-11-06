import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(new MaterialApp(home: new MainApp()));
}

class MainApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MainApp> {

  String _value = '';
  bool _value1 = false;
  bool _value2 = false;
  int _value3 = 0;
  bool _value4 = false;
  double _value5 = 0.0;

  void _onValue5Changed(double value) => setState(() => _value5 = value );

  Future _onDateSelected() async{
    DateTime picker = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2018), lastDate: DateTime.now());
    if (picker != null) {
      setState(() {
        _value = picker.toString();
      });
    }
  }
  List brands = List<String>();
 // brands.add("");
  void _onChange(String value) {
    setState(() => _value = 'Change: $value');
  }

  void _onSubmit(String value) {
    setState(() => _value = 'Submit: $value');
  }

  void _value1Changed(bool value) => setState(() => _value1 = value);
  void _value2Changed(bool value) => setState(() => _value2 = value);

  void _setValue3(int value) => setState(() => _value3 = value);
  void _setValue4(bool value) => setState(() => _value4 = value);

  Widget makeRadios(String label) {
    List<Widget> RadioList = List<Widget>();

    for(int i = 0; i < 2; i++){
      RadioList.add(new RadioListTile(value: i, groupValue: _value3, onChanged: _setValue3,title: new Text("$label Brand $i"),
        controlAffinity: ListTileControlAffinity.trailing,secondary: new Icon(Icons.directions_car),));
    }
    Column column = new Column(children:RadioList);
    return column;
  }
  Widget makeSwitches() {
    List<Widget> ComboList = List<Widget>();

    for(int i = 0; i < 2; i++){
      ComboList.add(new SwitchListTile(value: _value4, onChanged: _setValue4,title: new Text("Switch $i",style: new TextStyle(fontSize: 30,color: Colors.deepPurple,fontWeight: FontWeight.bold),),
      ));
    }
    Column column = new Column(children:ComboList);
    return column;
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Control Test"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
          child: new Column(
            children: <Widget>[
              new TextField(
                decoration: new InputDecoration(
                    labelText: 'Name',
                    hintText: 'Hint',
                    icon: new Icon(Icons.people)),
                autocorrect: true,
                keyboardType: TextInputType.text,
                onChanged: _onChange,
                onSubmitted: _onSubmit,
              ),
              new CheckboxListTile(
                value: _value2,
                onChanged: _value2Changed,
                title: new Text("Benz"),
                controlAffinity: ListTileControlAffinity.leading,
                subtitle: new Text("Select a Benz"),
                activeColor: Colors.red,
              ),makeRadios("Benz"),
              makeSwitches(),
              new Text("Value: ${(_value5* 100).round()}"),
              new Slider(value: _value5, onChanged: _onValue5Changed,),
              new Text("Date Selected: $_value"),
              new IconButton(icon: Icon(Icons.date_range), onPressed: _onDateSelected,iconSize: 40,)
            ],
          ),
      ),
    );
  }
}
