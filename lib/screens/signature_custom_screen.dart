import 'package:flutter/material.dart';
import 'package:jvx_flutterclient/custom_screen/custom_screen.dart';
import 'package:jvx_flutterclient/model/api/request/request.dart';
import 'package:jvx_flutterclient/model/api/response/response_data.dart';
import 'package:jvx_flutterclient/ui/screen/component_creator.dart';
import 'package:jvx_flutterclient/ui/screen/component_data.dart';

import '../widgets/signature_custom_widget.dart';

class SignatureCustomScreen extends CustomScreen {

  SignatureCustomScreen(ComponentCreator componentCreator) : super(componentCreator);

  void selectRecord() {
    

  }

  @override
  Widget getWidget() {
    ComponentData data = this.componentScreen.getComponentData("JVxMobileDemo/Sig-3V/contacts#4");
    return SignatureCustomWidget(componentData: data);
  }

  @override
  void update(Request request, ResponseData responeData) {
  }
  
  @override
  bool withServer() {
    return true;
  }
}