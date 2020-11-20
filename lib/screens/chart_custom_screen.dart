import 'package:flutter/material.dart';
import 'package:jvx_flutterclient/core/models/api/response.dart';
import 'package:jvx_flutterclient/features/custom_screen/ui/screen/custom_screen.dart';

import '../widgets/chart_custom_widget.dart';

class ChartCustomScreen extends CustomScreen {
  final List<Country> countries = <Country>[];

  ChartCustomScreen(String componentId, String templateName) : super(componentId, templateName);

  @override
  Widget build(BuildContext context) {
    return ChartCustomWidget(
      countries: countries,
    );
  }

  @override
  void update(Response response) {
    super.update(response);
    if (response.responseData != null &&
        response.responseData.dataBooks != null &&
        response.responseData.dataBooks.length > 0) {
      for (int i = 0; i <= 3; i++) {
        countries.add(Country.fromJson(response.responseData.dataBooks[0].records[i]));
      }
    }
  }

  @override
  bool withServer() {
    return true;
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
