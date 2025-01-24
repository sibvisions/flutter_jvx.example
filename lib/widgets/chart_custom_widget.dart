import 'package:community_charts_flutter/community_charts_flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_jvx/flutter_jvx.dart';

class ChartCustomWidget extends StatefulWidget {
  const ChartCustomWidget({super.key});

  @override
  State<ChartCustomWidget> createState() => _ChartCustomWidgetState();
}

class _ChartCustomWidgetState extends State<ChartCustomWidget> with SingleTickerProviderStateMixin {
  static const String CHART_DATA_PROVIDER = "JVxMobileDemo/Cha-OL/chartData#0";
  static const String COLUMN_NAME_ID = "ID";
  static const String COLUMN_NAME_NAME = "COUNTRY";
  static const String COLUMN_NAME_LITRES = "LITRES";
  static const String COLUMN_NAME_DISTANCE = "DISTANCE";

  static const charts.Color DEFAULT_COLOR = charts.Color(r: 25, g: 178, b: 249, a: 255);

  final List<Country> countries = [];

  List<charts.Color> color = [
    const charts.Color(r: 48, g: 144, b: 240, a: 220),
    const charts.Color(r: 236, g: 100, b: 100, a: 220),
    const charts.Color(r: 152, g: 223, b: 88, a: 200),
    const charts.Color(r: 249, g: 221, b: 81, a: 210),
    const charts.Color(r: 216, g: 90, b: 100, a: 200),
    const charts.Color(r: 196, g: 140, b: 90, a: 200),
    const charts.Color(r: 126, g: 180, b: 90, a: 200),
    const charts.Color(r: 110, g: 190, b: 30, a: 200),
    const charts.Color(r: 119, g: 221, b: 81, a: 210),
  ];

  late final TabController _tabController;

  bool animate = true;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    super.initState();

    IUiService().registerDataSubscription(
      pDataSubscription: DataSubscription(
        subbedObj: this,
        dataProvider: CHART_DATA_PROVIDER,
        from: 0,
        dataColumns: [
          COLUMN_NAME_ID,
          COLUMN_NAME_NAME,
          COLUMN_NAME_LITRES,
          COLUMN_NAME_DISTANCE,
        ],
        onDataChunk: (DataChunk dataChunk) {
          countries.clear();
          for (int i = 0; i < dataChunk.data.length; i++) {
            countries.add(Country(
              dataChunk.data[i]![0],
              dataChunk.data[i]![1],
              dataChunk.data[i]![2],
              dataChunk.data[i]![3],
            ));
          }
          setState(() {});
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Column(children: [
      TabBar(controller: _tabController, tabs: const [
        Tab(
          text: "Bar chart",
          icon: Icon(Icons.bar_chart),
        ),
        Tab(
          text: "Pie chart",
          icon: Icon(Icons.pie_chart),
        ),
      ]),
      Expanded(
          child: TabBarView(controller: _tabController, children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              child: BarChartWidget(
                countries: countries,
                color: color,
                animate: animate,
              ),
            ),
            PieChartWidget(
                countries: countries,
                color: color,
                animate: animate,
              ),

          ]))
    ]);
  }

  @override
  void dispose() {
    IUiService().disposeDataSubscription(pSubscriber: this);
    super.dispose();
  }
}

class Country {
  final int id;
  final String name;
  final double litres;
  final double distance;

  Country(
    this.id,
    this.name,
    this.litres,
    this.distance,
  );
}

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({
    super.key,
    required this.countries,
    required this.color,
    required this.animate,
  });

  final List<Country> countries;
  final List<charts.Color> color;
  final bool animate;

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      [
        charts.Series<Country, String>(
          id: "CountriesBar",
          domainFn: (Country country, _) => country.name,
          measureFn: (Country country, _) => country.litres,
          data: countries,
          colorFn: (Country country, index) =>
              index! < color.length ? color.elementAt(index) : _ChartCustomWidgetState.DEFAULT_COLOR,
        ),
      ],
      animate: animate,
      domainAxis: const charts.OrdinalAxisSpec(showAxisLine: false, tickFormatterSpec: TickFormatterSpec()),
      defaultRenderer: charts.BarRendererConfig(
          cornerStrategy: const charts.ConstCornerStrategy(8)),
    );
  }
}

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({
    super.key,
    required this.countries,
    required this.color,
    required this.animate,
  });

  final List<Country> countries;
  final List<charts.Color> color;
  final bool animate;

  @override
  Widget build(BuildContext context) {
    return charts.PieChart<Object>(
      [
        charts.Series<Country, int>(
          id: "CountriesPie",
          domainFn: (Country country, _) => country.id,
          measureFn: (Country country, _) => country.litres,
          data: countries,
          labelAccessorFn: (Country country, _)
          {  if (country.name.length > 3) {
              return country.name.substring(0, 3);
             }
             else
             {
               return country.name;
             }
          },
          insideLabelStyleAccessorFn: (Country country, _) =>
              charts.TextStyleSpec(
                fontSize: 12,
                color: charts.MaterialPalette.gray.shade800,
              ),
          outsideLabelStyleAccessorFn: (Country country, _) =>
              charts.TextStyleSpec(
                fontSize: 12,
                color: charts.MaterialPalette.gray.shade800,
              ),
          colorFn: (Country country, index) =>
          index! < color.length ? color.elementAt(index) : _ChartCustomWidgetState.DEFAULT_COLOR,
        ),
      ],
      animate: animate,
        defaultRenderer: charts.ArcRendererConfig(
            arcRendererDecorators: [
          charts.ArcLabelDecorator(
              labelPosition: charts.ArcLabelPosition.auto)
        ])
    );
  }
}

class TickFormatterSpec implements charts.OrdinalTickFormatterSpec {
  const TickFormatterSpec();

  @override
  OrdinalTickFormatter createTickFormatter(charts.ChartContext context) =>
      const OrdinalTickFormatter();

  @override
  bool operator == (Object other) => other is TickFormatterSpec;

  @override
  int get hashCode => 37;
}

/// A strategy that converts tick labels using toString().
class OrdinalTickFormatter extends charts.SimpleTickFormatterBase<String> {
  const OrdinalTickFormatter();

  @override
  String formatValue(String value) {
    if (value.length > 3) {
      return value.substring(0, 3);
    }
    else {
      return value;
    }
  }

  @override
  bool operator == (Object other) => other is OrdinalTickFormatter;

  @override
  int get hashCode => 31;
}
