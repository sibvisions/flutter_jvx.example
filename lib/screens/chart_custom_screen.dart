import 'package:flutter/material.dart';
import 'package:flutterclient/flutterclient.dart';

import '../widgets/chart_custom_widget.dart';

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
        // toDo set dataProvider
        DataBook? dataBook = state.getDataBookByProvider('');
        if (dataBook != null) {
          for (int i = 0; i < dataBook.records.length; i++) {
            countries.add(Country.fromJson(dataBook.records[i]));
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

  Country.fromJson(List json)
      : id = json[0],
        name = json[1],
        litres = json[2],
        distance = json[3];
}
