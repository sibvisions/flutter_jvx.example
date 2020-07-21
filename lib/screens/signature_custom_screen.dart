import 'package:flutter/material.dart';
import 'package:jvx_flutterclient/custom_screen/custom_screen.dart';
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

  // if overriden, you have to handle server responses by your self or optionally call super.update to let the customScreen class do the work.
  // @override
  // void update(Request request, ResponseData responeData) {
  //   super.update(request, responeData);
  // }
  
  @override
  bool withServer() {
    return true;
  }
}