// import 'package:flutter/material.dart';
// import 'package:flutterclient/flutterclient.dart';
// import 'package:flutterclient_example/widgets/signature_custom_widget.dart';

// class SignatureCustomScreen extends CustomScreen {
//   SignatureCustomScreen(
//       {Key? key,
//       required SoScreenConfiguration configuration,
//       required SoComponentCreator creator})
//       : super(key: key, configuration: configuration, creator: creator);

//   @override
//   SignatureCustomScreenState createState() => SignatureCustomScreenState();
// }

// class SignatureCustomScreenState extends CustomScreenState {
//   @override
//   Widget build(BuildContext context) {
//     return super.build(context);
//   }

//   @override
//   void update(ApiResponse response) {
//     super.update(response);

//     SoComponentData componentData =
//         this.getComponentData("JVxMobileDemo/Sig-3V/contacts#4");

//     this.replaceComponentByName(
//         'signaturePanel',
//         CoCustomPanelWidget(
//           componentModel: ComponentModel(),
//           child: SignatureCustomWidget(componentData: componentData),
//         ));
//   }
// }

// class CoCustomPanelWidget extends CoPanelWidget {
//   final Widget child;

//   CoCustomPanelWidget({this.child, ComponentModel componentModel})
//       : super(componentModel: componentModel);

//   @override
//   State<StatefulWidget> createState() => CoCustomPanelWidgetState();
// }

// class CoCustomPanelWidgetState extends CoPanelWidgetState {
//   @override
//   Widget build(BuildContext context) {
//     return (widget as CoCustomPanelWidget).child;
//   }
// }
