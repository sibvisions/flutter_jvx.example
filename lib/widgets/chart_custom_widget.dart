import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import '../screens/chart_custom_screen.dart';

class ChartCustomWidget extends StatefulWidget {
  final List<Country> countries;

  const ChartCustomWidget({Key? key, required this.countries})
      : super(key: key);

  @override
  _ChartCustomWidgetState createState() => _ChartCustomWidgetState();
}

class _ChartCustomWidgetState extends State<ChartCustomWidget> {
  List<charts.Series>? seriesList;
  bool animate = false;
  List<charts.Color> color = [
    charts.Color(r: 48, g: 144, b: 240, a: 220),
    charts.Color(r: 236, g: 100, b: 100, a: 220),
    charts.Color(r: 152, g: 223, b: 88, a: 200),
    charts.Color(r: 249, g: 221, b: 81, a: 210)
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              leading: new Container(),
              flexibleSpace: new Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TabBar(
                      tabs: <Widget>[
                        Tab(
                          text: 'Pie Chart',
                        ),
                        Tab(
                          text: 'Bar Chart',
                        ),
                      ],
                    ),
                  ])),
          body: TabBarView(
            children: <Widget>[
              PieChartWidget(
                widget: widget,
                animate: animate,
                color: color,
              ),
              Container(
                  padding: EdgeInsets.all(10.0),
                  child: BarChartWidget(
                      widget: widget, color: color, animate: animate))
            ],
          ),
        ));
  }
}

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({
    Key? key,
    required this.widget,
    required this.color,
    required this.animate,
  }) : super(key: key);

  final ChartCustomWidget widget;
  final List<charts.Color> color;
  final bool animate;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: charts.BarChart(
        [
          new charts.Series<Country, String>(
              id: 'Countries',
              domainFn: (Country country, _) => country.name,
              measureFn: (Country country, _) => country.litres,
              data: widget.countries,
              labelAccessorFn: (Country country, _) => '${country.name}',
              colorFn: (Country country, _) => color.elementAt(_!)),
        ],
        animate: animate,
      ),
    );
  }
}

class PieChartWidget extends StatelessWidget {
  const PieChartWidget(
      {Key? key,
      required this.widget,
      required this.animate,
      required this.color})
      : super(key: key);

  final ChartCustomWidget widget;
  final List<charts.Color> color;
  final bool animate;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: charts.PieChart(
        [
          new charts.Series<Country, int>(
              id: 'Countries',
              domainFn: (Country country, _) => country.distance.toInt(),
              measureFn: (Country country, _) => country.litres,
              data: widget.countries,
              labelAccessorFn: (Country country, _) => '${country.name}',
              insideLabelStyleAccessorFn: (Country country, _) =>
                  charts.TextStyleSpec(
                      fontSize: 12, // size in Pts.
                      color: charts.MaterialPalette.gray.shade800),
              colorFn: (Country country, _) => color.elementAt(_!)),
        ],
        animate: animate,
        defaultRenderer: new charts.ArcRendererConfig(arcRendererDecorators: [
          new charts.ArcLabelDecorator(
              labelPosition: charts.ArcLabelPosition.auto)
        ]),
      ),
    );
  }
}
