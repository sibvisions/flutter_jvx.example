import 'package:flutter/material.dart';
import 'package:flutterclient_example/widgets/signature_custom_widget.dart';
import 'package:jvx_flutterclient/core/models/api/response.dart';
import 'package:jvx_flutterclient/core/ui/component/models/component_model.dart';
import 'package:jvx_flutterclient/core/ui/container/co_panel_widget.dart';
import 'package:jvx_flutterclient/core/ui/screen/so_component_creator.dart';
import 'package:jvx_flutterclient/core/ui/screen/so_component_data.dart';
import 'package:jvx_flutterclient/core/ui/screen/so_screen_configuration.dart';
import 'package:jvx_flutterclient/features/custom_screen/ui/screen/custom_screen.dart';

class SignatureCustomScreen extends CustomScreen {
  SignatureCustomScreen(
      {Key key,
      String templateName,
      @required SoScreenConfiguration configuration,
      SoComponentCreator creator})
      : super(
            key: key,
            templateName: templateName,
            configuration: configuration,
            creator: creator);

  @override
  SignatureCustomScreenState createState() => SignatureCustomScreenState();
}

class SignatureCustomScreenState extends CustomScreenState {
  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }

  @override
  void update(Response response) {
    super.update(response);

    SoComponentData componentData =
        this.getComponentData("JVxMobileDemo/Sig-3V/contacts#4");

    this.replaceComponentByName(
        'signaturePanel',
        CoCustomPanelWidget(
          componentModel: ComponentModel(null),
          child: SignatureCustomWidget(componentData: componentData),
        ));
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
