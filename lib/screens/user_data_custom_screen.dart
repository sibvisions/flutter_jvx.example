import 'package:flutter/material.dart';
import 'package:jvx_flutterclient/core/models/api/response.dart';
import 'package:jvx_flutterclient/core/ui/screen/so_component_creator.dart';
import 'package:jvx_flutterclient/features/custom_screen/ui/screen/custom_screen.dart';

import '../widgets/user_data_custom_widget.dart';

class UserDataCustomScreen extends CustomScreen {
  UserDataCustomScreen(String componentId, String templateName,
      SoComponentCreator componentCreator)
      : super(templateName,
            componentId: componentId, creator: componentCreator);

  @override
  bool withServer() {
    return false;
  }

  @override
  void update(Response response) {
    super.update(response);
  }

  @override
  Widget getWidget(BuildContext context) {
    return UserDataCustomWidget();
  }
}
