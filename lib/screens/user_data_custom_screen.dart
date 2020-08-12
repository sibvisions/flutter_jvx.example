import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterclient_example/widgets/user_data_custom_widget.dart';
import 'package:jvx_flutterclient/custom_screen/custom_screen.dart';
import 'package:jvx_flutterclient/jvx_flutterclient.dart';
import 'package:jvx_flutterclient/model/api/request/request.dart';
import 'package:jvx_flutterclient/model/api/response/response_data.dart';
import 'package:jvx_flutterclient/ui/screen/so_component_creator.dart';

class UserDataCustomScreen extends CustomScreen {
  UserDataCustomScreen(SoComponentCreator componentCreator)
      : super(componentCreator);

  @override
  Widget getWidget() {
    return UserDataCustomWidget();
  }

  @override
  void update(Request request, ResponseData responeData) {}

  @override
  bool withServer() {
    return false;
  }
}
