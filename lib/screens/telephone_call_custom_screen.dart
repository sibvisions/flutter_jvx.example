import 'package:flutter/material.dart';
import 'package:flutterclient/flutterclient.dart';
import 'package:flutterclient_example/widgets/telephone_call_custom_widget.dart';

class TelephoneCallCustomScreen extends CustomScreen {
  TelephoneCallCustomScreen(
      {Key? key,
      required SoScreenConfiguration configuration,
      required SoComponentCreator creator})
      : super(key: key, configuration: configuration, creator: creator);

  @override
  TelephoneCallCustomScreenState createState() =>
      TelephoneCallCustomScreenState();
}

class TelephoneCallCustomScreenState extends CustomScreenState {
  @override
  Widget build(BuildContext context) {
    return TelephoneCallCustomWidget();
  }
}
