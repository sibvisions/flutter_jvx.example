import 'package:flutter/material.dart';
import 'package:flutterclient/flutterclient.dart';

class AlteringCustomScreen extends CustomScreen {
  AlteringCustomScreen(
      {Key? key,
      required SoScreenConfiguration configuration,
      required SoComponentCreator creator})
      : super(key: key, configuration: configuration, creator: creator);

  @override
  AlteringCustomScreenState createState() => AlteringCustomScreenState();
}

class AlteringCustomScreenState extends CustomScreenState {
  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }
}
