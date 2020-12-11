import 'package:flutter/material.dart';

import 'package:jvx_flutterclient/core/ui/screen/so_component_creator.dart';
import 'package:jvx_flutterclient/core/ui/screen/so_screen_configuration.dart';
import 'package:jvx_flutterclient/features/custom_screen/ui/screen/custom_screen.dart';

class AlteringCustomScreen extends CustomScreen {
  AlteringCustomScreen(
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
  AlteringCustomScreenState createState() => AlteringCustomScreenState();
}

class AlteringCustomScreenState extends CustomScreenState {
  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }
}
