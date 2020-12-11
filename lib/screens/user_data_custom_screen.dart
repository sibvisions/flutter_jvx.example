import 'package:flutter/material.dart';
import 'package:jvx_flutterclient/core/models/api/response.dart';
import 'package:jvx_flutterclient/core/ui/screen/so_component_creator.dart';
import 'package:jvx_flutterclient/core/ui/screen/so_screen_configuration.dart';
import 'package:jvx_flutterclient/features/custom_screen/ui/screen/custom_screen.dart';

import '../widgets/user_data_custom_widget.dart';

class UserDataCustomScreen extends CustomScreen {
  UserDataCustomScreen(
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
  UserDataCustomScreenState createState() => UserDataCustomScreenState();
}

class UserDataCustomScreenState extends CustomScreenState {
  @override
  Widget build(BuildContext context) {
    return UserDataCustomWidget();
  }
}
