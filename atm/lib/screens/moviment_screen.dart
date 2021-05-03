import 'package:atm/widgets/line_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart';

class MovimentScreen extends StatelessWidget {
  const MovimentScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movimentos"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
       // child: BarChart(data),
      ),
    );
  }
}
