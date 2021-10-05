import 'package:flutter/material.dart';
import 'package:flutterclient/flutterclient.dart';
import '../widgets/hello_custom_widget.dart';

class HelloCustomScreen extends CustomScreen {
  HelloCustomScreen(
      {Key? key,
      required SoScreenConfiguration configuration,
      required SoComponentCreator creator})
      : super(key: key, configuration: configuration, creator: creator);

  @override
  HelloCustomScreenState createState() => HelloCustomScreenState();
}

class HelloCustomScreenState extends CustomScreenState {
  @override
  Widget build(BuildContext context) {
    return HelloCustomWidget();
  }
}
