import 'package:flutter/material.dart';
import 'package:jvx_flutterclient/core/models/api/request.dart';
import 'package:jvx_flutterclient/core/models/api/response.dart';
import 'package:jvx_flutterclient/core/models/api/response/response_data.dart';
import 'package:jvx_flutterclient/features/custom_screen/ui/screen/custom_screen.dart';

class AlteringCustomScreen extends CustomScreen {
  AlteringCustomScreen(String componentId, String templateName) : super(componentId, templateName);

  @override
  Widget build(BuildContext context) {
    return super.build(context);
    // IComponent component = this.componentScreen.getRootComponent();

    // if (component != null) {
    //   return component.getWidget();
    // } else {
    //   return Container(
    //     alignment: Alignment.center,
    //     child: Text('No root component defined'),
    //   );
    // }
  }

  @override
  void update(Response response) {
    // componentScreen.updateData(request, responeData);
    // if (responeData.screenGeneric != null)
    //   componentScreen
    //       .updateComponents(responeData.screenGeneric.changedComponents);
    super.update(response);
  }

  @override
  bool withServer() {
    return true;
  }
}
