import 'package:flutter/material.dart';
import 'package:jvx_flutterclient/core/models/api/request.dart';
import 'package:jvx_flutterclient/core/models/api/response/response_data.dart';
import 'package:jvx_flutterclient/features/custom_screen/ui/screen/custom_screen.dart';

import '../widgets/hello_custom_widget.dart';

class HelloCustomScreen extends CustomScreen {
  HelloCustomScreen(String templateName) : super(templateName);

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
