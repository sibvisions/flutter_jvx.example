import 'package:community_charts_flutter/community_charts_flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_jvx/flutter_jvx.dart';

class ChartCustomWidget extends StatefulWidget {
  const ChartCustomWidget({super.key});

  @override
  State<ChartCustomWidget> createState() => _ChartCustomWidgetState();
}

class _ChartCustomWidgetState extends State<ChartCustomWidget> {
  static const String CHART_DATA_PROVIDER = "JVxMobileDemo/Cha-OL/chartData#0";
  static const String COLUMN_NAME_ID = "ID";
  static const String COLUMN_NAME_NAME = "COUNTRY";
  static const String COLUMN_NAME_LITRES = "LITRES";
  static const String COLUMN_NAME_DISTANCE = "DISTANCE";

  final List<Country> countries = [];
  bool animate = false;
  List<charts.Color> color = [
    const charts.Color(r: 48, g: 144, b: 240, a: 220),
    const charts.Color(r: 236, g: 100, b: 100, a: 220),
    const charts.Color(r: 152, g: 223, b: 88, a: 200),
    const charts.Color(r: 249, g: 221, b: 81, a: 210),
  ];
  static const charts.Color DEFAULT_COLOR = charts.Color(r: 25, g: 178, b: 249, a: 255);

  @override
  void initState() {
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            leading: Container(),
            flexibleSpace: const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TabBar(
                  tabs: [
                    Tab(
                      text: "Pie Chart",
                    ),
                    Tab(
                      text: "Bar Chart",
                    ),
                  ],
                ),
              ],
            )),
        body: TabBarView(
          children: countries.isNotEmpty
              ? [
                  PieChartWidget(
                    countries: countries,
                    color: color,
                    animate: animate,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: BarChartWidget(
                      countries: countries,
                      color: color,
                      animate: animate,
                    ),
                  )
                ]
              : [Container(), Container()],
        ),
      ),
    );
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
          id: "Countries",
          domainFn: (Country country, _) => country.name,
          measureFn: (Country country, _) => country.litres,
          data: countries,
          labelAccessorFn: (Country country, _) => country.name,
          colorFn: (Country country, index) =>
              index! < color.length ? color.elementAt(index) : _ChartCustomWidgetState.DEFAULT_COLOR,
        ),
      ],
      animate: animate,
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
    return charts.PieChart(
      [
        charts.Series<Country, int>(
          id: "Countries",
          domainFn: (Country country, _) => country.id,
          measureFn: (Country country, _) => country.litres,
          data: countries,
          labelAccessorFn: (Country country, _) => country.name,
          insideLabelStyleAccessorFn: (Country country, _) => charts.TextStyleSpec(
            fontSize: 12,
            color: charts.MaterialPalette.gray.shade800,
          ),
          colorFn: (Country country, index) =>
              index! < color.length ? color.elementAt(index) : _ChartCustomWidgetState.DEFAULT_COLOR,
        ),
      ],
      animate: animate,
      defaultRenderer: charts.ArcRendererConfig(arcRendererDecorators: [
        charts.ArcLabelDecorator(labelPosition: charts.ArcLabelPosition.auto),
      ]),
    );
  }
}
