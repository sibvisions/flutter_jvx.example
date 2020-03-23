import 'package:flutter/material.dart';
import 'package:jvx_flutterclient/custom_screen/custom_screen.dart';
import 'package:jvx_flutterclient/model/api/request/request.dart';
import 'package:jvx_flutterclient/model/api/response/response_data.dart';
import 'package:jvx_flutterclient/ui/screen/component_creator.dart';

import '../widgets/chart_custom_widget.dart';

class ChartCustomScreen extends CustomScreen {
  List<Country> countries = <Country>[];

  ChartCustomScreen(ComponentCreator componentCreator) : super(componentCreator);

  @override
  Widget getWidget() {
    return ChartCustomWidget(countries: countries,);
  }

  @override
  void update(Request request, ResponseData responeData) {
    if (responeData != null && responeData.jVxData!=null && responeData.jVxData.length > 0) {
      for (int i = 0; i <= 3; i++) {
        countries.add(Country.fromJson(responeData.jVxData[0].records[i]));
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