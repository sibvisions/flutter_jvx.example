import 'package:flutter/material.dart';
import 'package:jvx_flutterclient/custom_screen/custom_screen.dart';
import 'package:jvx_flutterclient/model/api/request/request.dart';
import 'package:jvx_flutterclient/model/api/response/response_data.dart';
import 'package:jvx_flutterclient/ui/screen/component_creator.dart';

import '../widgets/hello_custom_widget.dart';

class HelloCustomScreen extends CustomScreen {
  HelloCustomScreen(ComponentCreator componentCreator)
      : super(componentCreator);

  @override
  Widget getWidget() {
    return HelloCustomWidget();
  }

  @override
  void update(Request request, ResponseData responeData) {}

  @override
  bool withServer() {
    return false;
  }
}
