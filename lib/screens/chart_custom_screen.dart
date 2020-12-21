import 'package:flutter/material.dart';
import 'package:jvx_flutterclient/core/models/api/response.dart';
import 'package:jvx_flutterclient/core/ui/screen/so_component_creator.dart';
import 'package:jvx_flutterclient/core/ui/screen/so_screen_configuration.dart';
import 'package:jvx_flutterclient/features/custom_screen/ui/screen/custom_screen.dart';

import '../widgets/chart_custom_widget.dart';

class ChartCustomScreen extends CustomScreen {
  ChartCustomScreen(
      {Key key,
      String templateName,
      @required SoScreenConfiguration configuration,
      SoComponentCreator creator})
      : super(
            key: key,
            templateName: templateName,
            configuration: configuration,
            creator: creator);

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
  void onResponse(Response response) {
    super.onResponse(response);
    if (response.responseData != null &&
        response.responseData.dataBooks != null &&
        response.responseData.dataBooks.length > 0) {
      for (int i = 0; i <= 3; i++) { 
        countries.add(
            Country.fromJson(response.responseData.dataBooks[0].records[i]));
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
