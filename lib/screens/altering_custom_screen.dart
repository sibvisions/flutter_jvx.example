import 'package:flutter/material.dart';
import 'package:jvx_flutterclient/custom_screen/custom_screen.dart';
import 'package:jvx_flutterclient/model/api/request/request.dart';
import 'package:jvx_flutterclient/model/api/response/response_data.dart';
import 'package:jvx_flutterclient/ui/component/i_component.dart';
import 'package:jvx_flutterclient/ui/screen/component_creator.dart';

class AlteringCustomScreen extends CustomScreen {
  AlteringCustomScreen(ComponentCreator componentCreator) : super(componentCreator);

  @override
  Widget getWidget() {
    IComponent component = this.componentScreen.getRootComponent();

    if (component != null) {
      return component.getWidget();
    } else {
      return Container(
        alignment: Alignment.center,
        child: Text('No root component defined'),
      );
    }
  }

  @override
  void update(Request request, ResponseData responeData) {
    componentScreen.updateData(request, responeData);
    if (responeData.screenGeneric != null) componentScreen.updateComponents(responeData.screenGeneric.changedComponents);
  }

  @override
  bool withServer() {
    return true;
  }
}