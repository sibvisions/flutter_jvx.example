import 'package:flutter/material.dart';
import 'package:flutterclient_example/widgets/telephone_call_custom_widget.dart';
import 'package:jvx_flutterclient/custom_screen/custom_screen.dart';
import 'package:jvx_flutterclient/model/api/request/request.dart';
import 'package:jvx_flutterclient/model/api/response/data/jvx_data.dart';
import 'package:jvx_flutterclient/model/api/response/meta_data/jvx_meta_data.dart';
import 'package:jvx_flutterclient/model/api/response/screen_generic.dart';
import 'package:jvx_flutterclient/ui/screen/component_creator.dart';

class TelephoneCallCustomScreen extends CustomScreen {
  TelephoneCallCustomScreen(ComponentCreator componentCreator)
      : super(componentCreator);

  @override
  Widget getWidget() {
    return TelephoneCallCustomWidget();
  }

  @override
  void update(Request request, List<JVxData> data, List<JVxMetaData> metaData,
      ScreenGeneric genericScreen) {}

  @override
  bool withServer() {
    return false;
  }
}
