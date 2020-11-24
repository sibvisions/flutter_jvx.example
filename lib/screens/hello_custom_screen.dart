import 'package:flutter/material.dart';
import 'package:jvx_flutterclient/core/models/api/response.dart';
import 'package:jvx_flutterclient/core/ui/screen/so_component_creator.dart';
import 'package:jvx_flutterclient/features/custom_screen/ui/screen/custom_screen.dart';

import '../widgets/hello_custom_widget.dart';

class HelloCustomScreen extends CustomScreen {
  HelloCustomScreen(String componentId, String templateName,
      SoComponentCreator componentCreator)
      : super(templateName,
            componentId: componentId, creator: componentCreator);

  @override
  Widget getWidget(BuildContext context) {
    return HelloCustomWidget();
  }

  @override
  void update(Response response) {
    super.update(response);
  }

  @override
  bool withServer() {
    return false;
  }
}
