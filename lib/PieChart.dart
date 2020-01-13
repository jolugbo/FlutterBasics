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
  int year;
  int sales;
  charts.Color color;
  Sales(this.year, this.sales,this.color);
}

class _State extends State<MainApp>{
  List<Sales> _data;
  List<charts.Series<Sales,String>> _chartdata;

  void _makeData(){
    _data = new List<Sales>();
    _chartdata = new List<charts.Series<Sales, String>>();

    _data.add(new Sales(0, 100, charts.MaterialPalette.red.shadeDefault));
    _data.add(new Sales(1, 75, charts.MaterialPalette.blue.shadeDefault));
    _data.add(new Sales(2, 25, charts.MaterialPalette.green.shadeDefault));
    _data.add(new Sales(3, 100, charts.MaterialPalette.deepOrange.shadeDefault));

    _chartdata.add(new charts.Series(
        id: 'Sales',
        //colorFn: (_,__) => charts.MaterialPalette.red.shadeDefault, //Old version
        colorFn: (Sales sales,__) => sales.color,
        data: _data,
        domainFn: (Sales sales, _) => sales.year.toString(),
        measureFn: (Sales sales, _) => sales.sales,
        //fillPatternFn: (_,__) => charts.FillPatternType.forwardHatch, // Old version
        fillPatternFn: (Sales sales,__) => charts.FillPatternType.solid,
        displayName: 'sales',
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
              new Expanded(child: new charts.PieChart(_chartdata,animate: true,animationDuration: new Duration(seconds: 2),))
            ],
          ),
        ),
      ),
    );
  }
}
