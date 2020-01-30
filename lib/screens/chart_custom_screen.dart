import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../example_custom_screen.dart';


class ChartCustomScreen extends StatefulWidget {
  final List<Country> countries;

  const ChartCustomScreen({Key key, this.countries}) : super(key: key);

  @override
  _ChartCustomScreenState createState() => _ChartCustomScreenState();
}

class _ChartCustomScreenState extends State<ChartCustomScreen> {
  List<charts.Series> seriesList;
  bool animate = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: charts.PieChart(
        [
          new charts.Series<Country, int>(
            id: 'Countries',
            domainFn: (Country country, _) => country.litres.toInt(),
            measureFn: (Country country, _) => country.distance,
            data: widget.countries,
            labelAccessorFn: (Country country, _) => '${country.name}',
          ),
        ],
        animate: animate,
        defaultRenderer: new charts.ArcRendererConfig(arcRendererDecorators: [
          new charts.ArcLabelDecorator(
            labelPosition: charts.ArcLabelPosition.auto
          )
        ]),
      ),
    );
  }
}