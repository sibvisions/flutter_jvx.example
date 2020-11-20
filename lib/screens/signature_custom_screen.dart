import 'package:flutter/material.dart';
import 'package:flutterclient_example/widgets/signature_custom_widget.dart';
import 'package:jvx_flutterclient/core/ui/component/component_model.dart';
import 'package:jvx_flutterclient/core/ui/container/co_panel_widget.dart';
import 'package:jvx_flutterclient/core/ui/screen/component_screen_widget.dart';
import 'package:jvx_flutterclient/core/ui/screen/so_component_creator.dart';
import 'package:jvx_flutterclient/core/ui/screen/so_component_data.dart';
import 'package:jvx_flutterclient/features/custom_screen/ui/screen/custom_screen.dart';

class SignatureCustomScreen extends CustomScreen {
  SignatureCustomScreen(String componentId, String templateName)
      : super(componentId, templateName);

  @override
  Widget build(BuildContext context) {
    SoComponentCreator creator = SoComponentCreator();
    SoComponentData data =
        this.getComponentData("JVxMobileDemo/Sig-3V/contacts#4");

    creator.replaceComponent(
        'Panel',
        (ComponentModel componentModel) => CoCustomPanelWidget(
              componentModel: componentModel,
              child: SignatureCustomWidget(componentData: data),
            ));

    return ComponentScreenWidget(
      response: this.currentResponse,
      closeCurrentScreen: false,
      componentCreator: creator,
      footerComponent: customHeaderAndFooter.footerComponent,
      headerComponent: customHeaderAndFooter.headerComponent,
      onData: (List<SoComponentData> data) {
        this.componentData.clear();
        this.componentData.addAll(data);
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
