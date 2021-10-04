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
  bool replaced = false;

  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }

  @override
  void update(ApiResponse response) {
    super.update(response);

    SoComponentData componentData = this.getComponentData(CONTACT_DATAPROVIDER);

    if (!replaced) {
      replaced = this.replaceComponentByName(
        'signaturePanel',
        SignatureCustomWidget(
            componentData: componentData,
            componentModel: ComponentModel(changedComponent: ChangedComponent())
              ..componentId = 'SIGPAN_01'),
      );
    }
  }
}
