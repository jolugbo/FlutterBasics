import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;

void main(){
  runApp(new MaterialApp(
      home: new MainApp()
  ));
}
class MainApp extends StatefulWidget{
  @override
  _State createState() => new _State();

}

class Sales{
  String year;
  int sales;
  Sales(this.year, this.sales);
}

class _State extends State<MainApp>{
  List<Sales> _data;
  List<charts.Series<Sales,String>> _chartdata;

  void _makeData(){
    _data = new List<Sales>();
    _chartdata = new List<charts.Series<Sales, String>>();

    final rnd = new Random();
    _data.add(new Sales("Cat", rnd.nextInt(1000)));
    _data.add(new Sales("Bird", rnd.nextInt(1000)));
    _data.add(new Sales("Lizard", rnd.nextInt(1000)));
    _data.add(new Sales("Dog", rnd.nextInt(1000)));
    _chartdata.add(new charts.Series(
        id: 'Sales',
        //colorFn: (_,__) => charts.MaterialPalette.red.shadeDefault, //Old version
        colorFn: (Sales sales,__) => charts.MaterialPalette.red.shadeDefault,
        data: _data,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        //fillPatternFn: (_,__) => charts.FillPatternType.forwardHatch, // Old version
        fillPatternFn: (Sales sales,__) => charts.FillPatternType.solid,
        displayName: 'sales'
    ));
  }

  @override
  void initState(){
    _makeData();
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
              new Text("Sales Data"),
              new Expanded(child: new charts.BarChart(_chartdata))
            ],
          ),
        ),
      ),
    );
  }
}
