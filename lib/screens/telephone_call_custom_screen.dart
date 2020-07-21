import 'package:flutter/material.dart';
import 'package:flutterclient_example/widgets/telephone_call_custom_widget.dart';
import 'package:jvx_flutterclient/custom_screen/custom_screen.dart';
import 'package:jvx_flutterclient/model/api/request/request.dart';
import 'package:jvx_flutterclient/model/api/response/response_data.dart';
import 'package:jvx_flutterclient/ui/screen/so_component_creator.dart';

class TelephoneCallCustomScreen extends CustomScreen {
  TelephoneCallCustomScreen(SoComponentCreator componentCreator)
      : super(componentCreator);

  @override
  Widget getWidget() {
    return TelephoneCallCustomWidget();
  }

  @override
  void update(Request request, ResponseData responseData) {}

  @override
  bool withServer() {
    return false;
  }
}
