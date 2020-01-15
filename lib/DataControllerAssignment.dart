import 'package:flutter/material.dart';

class DataController extends StatefulWidget {
  DataController({Key key, this.onValueChanged});
  final ValueChanged<String> onValueChanged;

  @override
  _DataControllerState createState() =>
      new _DataControllerState(onValueChanged: onValueChanged);
}

class _DataControllerState extends State<DataController> {
  TextEditingController _data;
  final ValueChanged<String> onValueChanged;
  _DataControllerState({Key key, this.onValueChanged});

  void _onValueChange(String value) {
    onValueChanged(_data.text);
  }

  @override
  void initState() {
    _data = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return new Card(
        child: Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(children: <Widget>[
        new TextField(
          controller: _data,
          decoration: InputDecoration(labelText: "User Input"),
          onChanged: _onValueChange,
        ),
      ]),
    ));
  }
}
