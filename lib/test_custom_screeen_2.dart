import 'package:flutter/material.dart';
import 'package:flutterclient_example/screens/hello_custom_screen.dart';
import 'package:jvx_mobile_v3/custom_screen/custom_screen.dart';
import 'package:jvx_mobile_v3/model/api/request/request.dart';
import 'package:jvx_mobile_v3/model/api/response/data/jvx_data.dart';
import 'package:jvx_mobile_v3/model/api/response/meta_data/jvx_meta_data.dart';
import 'package:jvx_mobile_v3/model/api/response/screen_generic.dart';
import 'package:jvx_mobile_v3/ui/screen/component_creator.dart';

class TestCustomScreen2 extends CustomScreen {
  TestCustomScreen2(ComponentCreator componentCreator)
      : super(componentCreator);

  @override
  Widget getWidget() {
    return HelloCustomScreen();
  }

  @override
  void update(Request request, List<JVxData> data, List<JVxMetaData> metaData,
      ScreenGeneric genericScreen) {}
}
