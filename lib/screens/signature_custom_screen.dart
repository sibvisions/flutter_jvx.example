import 'package:flutter/material.dart';
import 'package:flutterclient/flutterclient.dart';
import 'package:flutterclient_example/widgets/signature_custom_widget.dart';

const String CONTACT_DATAPROVIDER = "JVxMobileDemo/Sig-3V/contacts#4";

class SignatureCustomScreen extends CustomScreen {
  SignatureCustomScreen(
      {Key? key,
      required SoScreenConfiguration configuration,
      required SoComponentCreator creator})
      : super(key: key, configuration: configuration, creator: creator);

  @override
  SignatureCustomScreenState createState() => SignatureCustomScreenState();
}

class SignatureCustomScreenState extends CustomScreenState {
  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }

  @override
  void onState(ApiState? state) {
    super.onState(state);
  }

  @override
  void update(ApiResponse response) {
    super.update(response);

    SoComponentData componentData = this.getComponentData(CONTACT_DATAPROVIDER);

    ComponentWidget? comp;
    try {
      comp = components.values.toList().firstWhere((component) =>
          component.componentModel.componentId == 'signaturePanel');
    } catch (e) {}

    if (comp == null || !(comp is CoCustomPanelWidget))
      // var rng = new Random();
      this.replaceComponentByName(
          'signaturePanel',
          CoCustomPanelWidget(
            componentModel: ContainerComponentModel(
                changedComponent:
                    ChangedComponent(id: "SIGPAN_01", name: "signaturePanel")),
            child: SignatureCustomWidget(componentData: componentData),
          ));

    try {
      comp = components.values.toList().firstWhere(
          (component) => component.componentModel.name == 'signaturePanel');
    } catch (e) {}
  }
}

class CoCustomPanelWidget extends CoPanelWidget {
  final Widget child;

  CoCustomPanelWidget(
      {required this.child, required ContainerComponentModel componentModel})
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
