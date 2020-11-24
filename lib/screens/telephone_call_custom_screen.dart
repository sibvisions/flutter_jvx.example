import 'package:flutter/material.dart';
import 'package:flutterclient_example/widgets/telephone_call_custom_widget.dart';
import 'package:jvx_flutterclient/core/models/api/request.dart';
import 'package:jvx_flutterclient/core/models/api/response.dart';
import 'package:jvx_flutterclient/core/models/api/response/response_data.dart';
import 'package:jvx_flutterclient/core/ui/screen/so_component_creator.dart';
import 'package:jvx_flutterclient/features/custom_screen/ui/screen/custom_screen.dart';

class TelephoneCallCustomScreen extends CustomScreen {
  TelephoneCallCustomScreen(String componentId, String templateName,
      SoComponentCreator componentCreator)
      : super(templateName,
            componentId: componentId, creator: componentCreator);

  @override
  void update(Response response) {
    super.update(response);
  }

  @override
  bool withServer() {
    return false;
  }

  @override
  Widget getWidget(BuildContext context) {
    return TelephoneCallCustomWidget();
  }
}
