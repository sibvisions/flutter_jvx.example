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
    return ChartCustomWidget(
      countries: countries,
    );
  }

  @override
  void onState(ApiState? state) {
    super.onState(state);
    if (state != null && state is ApiResponse && mounted) {
      // Updating the data objects
      if (state.hasDataBook) {
        DataBook? dataBook = state.getDataBookByProvider(CHART_DATAPROVIDER);
        if (dataBook != null) {
          for (int i = 0; i <= 3; i++) {
            int id = dataBook.getValue(COLUMNAME_ID, i);
            String name = dataBook.getValue(COLUMNAME_NAME, i);
            double litres = dataBook.getValue(COLUMNAME_LITRES, i);
            double distance = dataBook.getValue(COLUMNAME_DISTANCE, i);

            countries.add(Country(id, name, litres, distance));
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
}
