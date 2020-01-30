import 'package:flutter/material.dart';
import 'package:jvx_mobile_v3/custom_screen/custom_screen.dart';
import 'package:jvx_mobile_v3/model/api/request/request.dart';
import 'package:jvx_mobile_v3/model/api/response/data/jvx_data.dart';
import 'package:jvx_mobile_v3/model/api/response/meta_data/jvx_meta_data.dart';
import 'package:jvx_mobile_v3/model/api/response/screen_generic.dart';
import 'package:jvx_mobile_v3/ui/screen/component_creator.dart';

import '../widgets/chart_custom_widget.dart';

class ChartCustomScreen extends CustomScreen {
  List<Country> countries = <Country>[];

  ChartCustomScreen(ComponentCreator componentCreator) : super(componentCreator);

  @override
  Widget getWidget() {
    return ChartCustomWidget(countries: countries,);
  }

  @override
  void update(Request request, List<JVxData> data, List<JVxMetaData> metaData, ScreenGeneric genericScreen) {
    if (data != null && data.length > 0) {
      for (int i = 0; i <= 3; i++) {
        countries.add(Country.fromJson(data[0].records[i]));
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