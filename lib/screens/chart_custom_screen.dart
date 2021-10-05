import 'package:flutter/material.dart';
import 'package:flutterclient/flutterclient.dart';

import '../widgets/chart_custom_widget.dart';

const String CHART_DATAPROVIDER = "JVxMobileDemo/Cha-OL/chartData#0";
const String COLUMNAME_ID = "ID";
const String COLUMNAME_NAME = "COUNTRY";
const String COLUMNAME_LITRES = "LITRES";
const String COLUMNAME_DISTANCE = "DISTANCE";

class ChartCustomScreen extends CustomScreen {
  ChartCustomScreen(
      {Key? key,
      required SoScreenConfiguration configuration,
      required SoComponentCreator creator})
      : super(key: key, configuration: configuration, creator: creator);

  @override
  ChartCustomScreenState createState() => ChartCustomScreenState();
}

class ChartCustomScreenState extends CustomScreenState {
  List<Country> countries = <Country>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Charts'),
            automaticallyImplyLeading: true,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                ),
                onPressed: () {
                  getApplicationApi(context)
                      .closeScreen(widget.configuration.componentId);
                })),
        endDrawer: widget.configuration.drawer,
        body: ChartCustomWidget(
          countries: countries,
        ));
  }

  @override
  void update(ApiResponse response) {
    super.update(response);
    if (mounted) {
      // Updating the data objects
      if (response.hasDataBook) {
        DataBook? dataBook = response.getDataBookByProvider(CHART_DATAPROVIDER);
        if (dataBook != null) {
          for (int i = 0; i <= 3; i++) {
            countries.add(Country.fromDataBook(dataBook, i));
          }
        }
      }
    }
  }
}

class Country {
  int id;
  String name;
  double litres;
  double distance;

  Country(this.id, this.name, this.litres, this.distance);

  static Country fromDataBook(DataBook dataBook, int index) {
    int id = dataBook.getValue(COLUMNAME_ID, index);
    String name = dataBook.getValue(COLUMNAME_NAME, index);
    double litres = dataBook.getValue(COLUMNAME_LITRES, index);
    double distance = dataBook.getValue(COLUMNAME_DISTANCE, index);
    return Country(id, name, litres, distance);
  }
}
