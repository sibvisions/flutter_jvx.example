import 'package:flutter/material.dart';
import 'package:jvx_flutterclient/core/ui/screen/so_component_creator.dart';
import 'package:jvx_flutterclient/core/ui/screen/so_screen_configuration.dart';
import 'package:jvx_flutterclient/features/custom_screen/ui/screen/custom_screen.dart';

import '../widgets/hello_custom_widget.dart';

class HelloCustomScreen extends CustomScreen {
  HelloCustomScreen(
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
  HelloCustomScreenState createState() => HelloCustomScreenState();
}

class HelloCustomScreenState extends CustomScreenState {
  @override
  Widget build(BuildContext context) {
    return HelloCustomWidget();
  }
}
