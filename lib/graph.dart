import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cashmanager/transaction.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';

class Data {
  String category;
  int money;
  MaterialColor color;
  Data({this.money, this.category, this.color});
}

class Creategraph extends StatefulWidget {
  @override
  _CreategraphState createState() => _CreategraphState();
}

class _CreategraphState extends State<Creategraph> {
  List<charts.Series<Data, String>> _seriesGraphData;
  void _gendata() {
    List<Data> graphdata = [];
    for (int i = 0; i < categories.length; i++) {
      graphdata.add(Data(
        category: categories[i],
        money: categorycount[i],
        color: categorycolor[i],
      ));
    }
    _seriesGraphData.add(
      charts.Series(
        domainFn: (Data data, _) => data.category,
        measureFn: (Data data, _) => data.money,
        colorFn: (Data data, _) => charts.ColorUtil.fromDartColor(data.color),
        id: 'cash management graph',
        data: graphdata,
        labelAccessorFn: (Data row, _) => '${row.money}',
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _seriesGraphData = List<charts.Series<Data, String>>();
    _gendata();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: charts.PieChart(_seriesGraphData,
                        animate: true,
                        animationDuration: Duration(seconds: 1),
                        behaviors: [
                          new charts.DatumLegend(
                            outsideJustification:
                                charts.OutsideJustification.endDrawArea,
                            horizontalFirst: false,
                            desiredMaxRows: 2,
                            cellPadding:
                                new EdgeInsets.only(right: 4.0, bottom: 4.0),
                            entryTextStyle: charts.TextStyleSpec(
                                color:
                                    charts.MaterialPalette.purple.shadeDefault,
                                fontFamily: 'Georgia',
                                fontSize: 11),
                          )
                        ],
                        defaultRenderer: new charts.ArcRendererConfig(
                            arcWidth: 30,
                            arcRendererDecorators: [
                              new charts.ArcLabelDecorator(
                                  labelPosition: charts.ArcLabelPosition.inside)
                            ],
                            startAngle: 4 / 5 * pi,
                            arcLength: 7 / 5 * pi)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
