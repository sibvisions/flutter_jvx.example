import 'package:flutter/material.dart';
import 'package:jvx_mobile_v3/custom_screen/custom_screen.dart';
import 'package:jvx_mobile_v3/model/api/request/request.dart';
import 'package:jvx_mobile_v3/model/api/response/data/jvx_data.dart';
import 'package:jvx_mobile_v3/model/api/response/meta_data/jvx_meta_data.dart';
import 'package:jvx_mobile_v3/model/api/response/screen_generic.dart';
import 'package:jvx_mobile_v3/model/changed_component.dart';
import 'package:jvx_mobile_v3/ui/component/i_component.dart';
import 'package:jvx_mobile_v3/ui/screen/component_creator.dart';

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
  void update(Request request, List<JVxData> data, List<JVxMetaData> metaData, ScreenGeneric genericScreen) {
    componentScreen.updateData(request, data, metaData);
    if (genericScreen != null) componentScreen.updateComponents(genericScreen.changedComponents);
  }

  @override
  bool withServer() {
    return true;
  }
}