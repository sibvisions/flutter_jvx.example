import 'package:flutter/material.dart';
import 'package:jvx_flutterclient/features/custom_screen/ui/screen/custom_screen.dart';

class SignatureCustomScreen extends CustomScreen {
  SignatureCustomScreen(String componentId, String templateName) : super(componentId, templateName);

  void selectRecord() {}

  @override
  Widget build(BuildContext context) {
    return super.build(context);
    // SoComponentData data = ComponentScreenWidget.of(context)
    //     .getComponentData("JVxMobileDemo/Sig-3V/contacts#4");
    // CoCustomComponent contactComp = new CoCustomComponent(
    //   GlobalKey(debugLabel: 'contact'),
    //   componentScreen.context,
    // );
    // contactComp.widget = SignatureCustomWidget(componentData: data);

    // CoPanel comp = this.componentScreen.getComponentFromName('signaturePanel');
    // this.componentScreen.replaceComponent(comp, contactComp);

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
