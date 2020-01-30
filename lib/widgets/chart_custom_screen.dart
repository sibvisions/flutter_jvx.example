import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:jvx_mobile_v3/utils/uidata.dart';

import '../screens/chart_custom_screen.dart';

class ChartCustomWidget extends StatefulWidget {
  final List<Country> countries;

  const ChartCustomWidget({Key key, this.countries}) : super(key: key);

  @override
  _ChartCustomWidgetState createState() => _ChartCustomWidgetState();
}

class _ChartCustomWidgetState extends State<ChartCustomWidget> {
  List<charts.Series> seriesList;
  bool animate = false;
  charts.Color color = charts.Color(
      r: UIData.ui_kit_color_2.red,
      g: UIData.ui_kit_color_2.green,
      b: UIData.ui_kit_color_2.blue,
      a: UIData.ui_kit_color_2.alpha);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: Container(),
            title: TabBar(
              tabs: <Widget>[
                Tab(
                  text: 'Pie Chart',
                ),
                Tab(
                  text: 'Bar Chart',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              PieChartWidget(widget: widget, animate: animate, color: color,),
              BarChartWidget(widget: widget, color: color, animate: animate)
            ],
          ),
        ));
  }
}

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({
    Key key,
    @required this.widget,
    @required this.color,
    @required this.animate,
  }) : super(key: key);

  final ChartCustomWidget widget;
  final charts.Color color;
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
            labelAccessorFn: (Country country, _) =>
                '${country.name}',
            colorFn: (Country country, _) => charts.Color(a: color.a, b: color.b, g: color.g, r: country.litres.toInt())
          ),
        ],
        animate: animate,
      ),
    );
  }
}

class PieChartWidget extends StatelessWidget {
  const PieChartWidget(
      {Key key,
      @required this.widget,
      @required this.animate,
      @required this.color})
      : super(key: key);

  final ChartCustomWidget widget;
  final bool animate;
  final charts.Color color;

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
              colorFn: (Country country, _) => charts.Color(a: color.a, b: color.b, g: color.g, r: country.litres.toInt())),
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
