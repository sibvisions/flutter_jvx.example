import 'package:flutter/material.dart';
import 'package:jvx_flutterclient/custom_screen/custom_screen.dart';
import 'package:jvx_flutterclient/ui/screen/so_component_creator.dart';
import 'package:jvx_flutterclient/ui/component/i_component.dart';
import 'package:jvx_flutterclient/ui/container/co_panel.dart';
import 'package:jvx_flutterclient/ui/component/co_custom_component.dart';
import 'package:jvx_flutterclient/ui/screen/so_component_data.dart';
import '../widgets/signature_custom_widget.dart';

class SignatureCustomScreen extends CustomScreen {
  SignatureCustomScreen(SoComponentCreator componentCreator)
      : super(componentCreator);

  void selectRecord() {}

  @override
  Widget getWidget() {
    SoComponentData data = this
        .componentScreen
        .getComponentData("JVxMobileDemo/Sig-3V/contacts#4");
    CoCustomComponent contactComp = new CoCustomComponent(
      GlobalKey(debugLabel: 'contact'),
      componentScreen.context,
    );
    contactComp.widget = SignatureCustomWidget(componentData: data);

    CoPanel comp = this.componentScreen.getComponentFromName('signaturePanel');
    this.componentScreen.replaceComponent(comp, contactComp);

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
