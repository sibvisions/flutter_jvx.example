import 'package:flutter/material.dart';
import 'package:flutterclient_example/widgets/map_custom_widget.dart';
import 'package:jvx_flutterclient/custom_screen/custom_screen.dart';
import 'package:jvx_flutterclient/model/api/request/request.dart';
import 'package:jvx_flutterclient/model/api/response/response_data.dart';
import 'package:jvx_flutterclient/ui/screen/so_component_creator.dart';

class MapCustomScreen extends CustomScreen {
  MapCustomScreen(SoComponentCreator componentCreator)
      : super(componentCreator);

  @override
  Widget getWidget() {
    return MapCustomWidget();
  }

  @override
  void update(Request request, ResponseData responseData) {}

  @override
  bool withServer() {
    return false;
  }
}
