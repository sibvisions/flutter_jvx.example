import 'package:flutter/material.dart';
import 'package:jvx_flutterclient/core/models/api/request.dart';
import 'package:jvx_flutterclient/core/models/api/response.dart';
import 'package:jvx_flutterclient/core/models/api/response/response_data.dart';
import 'package:jvx_flutterclient/core/ui/screen/so_component_creator.dart';
import 'package:jvx_flutterclient/core/ui/screen/so_screen_configuration.dart';
import 'package:jvx_flutterclient/features/custom_screen/ui/screen/custom_screen.dart';

import '../widgets/map_custom_widget.dart';

class MapCustomScreen extends CustomScreen {
  MapCustomScreen(
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
  MapCustomScreenState createState() => MapCustomScreenState();
}

class MapCustomScreenState extends CustomScreenState {
  @override
  Widget build(BuildContext context) {
    return MapCustomWidget();
  }
}