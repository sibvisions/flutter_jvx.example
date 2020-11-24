import 'package:flutter/material.dart';
import 'package:jvx_flutterclient/core/models/api/request.dart';
import 'package:jvx_flutterclient/core/models/api/response.dart';
import 'package:jvx_flutterclient/core/models/api/response/response_data.dart';
import 'package:jvx_flutterclient/core/ui/screen/so_component_creator.dart';
import 'package:jvx_flutterclient/features/custom_screen/ui/screen/custom_screen.dart';

class AlteringCustomScreen extends CustomScreen {
  AlteringCustomScreen(String componentId, String templateName,
      SoComponentCreator componentCreator)
      : super(templateName,
            creator: componentCreator, componentId: componentId);

  @override
  void update(Response response) {
    super.update(response);
  }

  @override
  Widget getWidget(BuildContext context) {
    return super.getWidget(context);
  }

  @override
  bool withServer() {
    return true;
  }
}
