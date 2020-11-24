import 'package:flutter/material.dart';
import 'package:flutterclient_example/widgets/signature_custom_widget.dart';
import 'package:jvx_flutterclient/core/ui/component/component_model.dart';
import 'package:jvx_flutterclient/core/ui/container/co_panel_widget.dart';
import 'package:jvx_flutterclient/core/ui/screen/component_screen_widget.dart';
import 'package:jvx_flutterclient/core/ui/screen/so_component_creator.dart';
import 'package:jvx_flutterclient/core/ui/screen/so_component_data.dart';
import 'package:jvx_flutterclient/features/custom_screen/ui/screen/custom_screen.dart';

class SignatureCustomScreen extends CustomScreen {
  SignatureCustomScreen(String componentId, String templateName,
      SoComponentCreator componentCreator)
      : super(templateName,
            componentId: componentId, creator: componentCreator);

  @override
  Widget getWidget(BuildContext context) {
    return ComponentScreenWidget(
      response: this.currentResponse,
      closeCurrentScreen: this.closeCurrentScreen,
      componentCreator: this.creator,
      footerComponent: this.footer,
      headerComponent: this.header,
      onData: (List<SoComponentData> data) {
        this.data = data;

        SoComponentData componentData =
            this.getComponentData("JVxMobileDemo/Sig-3V/contacts#4");

        this.replaceComponent(
            'signaturePanel',
            CoCustomPanelWidget(
              componentModel: ComponentModel(null),
              child: SignatureCustomWidget(componentData: componentData),
            ));
      },
    );
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

class CoCustomPanelWidget extends CoPanelWidget {
  final Widget child;

  CoCustomPanelWidget({this.child, ComponentModel componentModel})
      : super(componentModel: componentModel);

  @override
  State<StatefulWidget> createState() => CoCustomPanelWidgetState();
}

class CoCustomPanelWidgetState extends CoPanelWidgetState {
  @override
  Widget build(BuildContext context) {
    return (widget as CoCustomPanelWidget).child;
  }
}
