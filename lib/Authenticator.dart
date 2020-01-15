import 'package:flutter/material.dart';


class Authenticator extends StatefulWidget{
  Authenticator({Key key, this.onAuthenticated});
  final ValueChanged<bool> onAuthenticated;

  @override
  _AuthenticatorState createState() => new _AuthenticatorState(onAuthenticated: onAuthenticated);

}
class _AuthenticatorState extends State<Authenticator>{
  TextEditingController _user;
  TextEditingController _pass;

  final ValueChanged<bool> onAuthenticated;
  _AuthenticatorState({Key key, this.onAuthenticated});

  void _onPressed(){
    if (_user.text == "user1" && _pass.text == "Admin") {
      onAuthenticated(true);
    }  else  onAuthenticated(false);
  }

  @override
  void initState(){
    _user = new TextEditingController();
    _pass = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Padding(
        padding: EdgeInsets.all(10.0),
        child: new Column(
          children: <Widget>[
            new TextField(
              controller: _user,
              decoration: InputDecoration( labelText: "User Name"),
            ),
            new TextField(
              controller: _pass,
              decoration: InputDecoration( labelText: "Pass"),
              obscureText: true,
            ),
            new Padding(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(onPressed: _onPressed,child: Text("Submit"),), ),

          ],
        ),
      ),
    );
  }
}
