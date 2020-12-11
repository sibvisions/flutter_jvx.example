import 'package:flutter/material.dart';
import 'package:flutterclient_example/widgets/qr_scanner_custom_widget.dart';
import 'package:jvx_flutterclient/core/models/api/response.dart';
import 'package:jvx_flutterclient/core/ui/screen/so_component_creator.dart';
import 'package:jvx_flutterclient/core/ui/screen/so_screen_configuration.dart';
import 'package:jvx_flutterclient/features/custom_screen/ui/screen/custom_screen.dart';

class QrScannerCustomScreen extends CustomScreen {
  QrScannerCustomScreen(
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
  QrScannerCustomScreenState createState() => QrScannerCustomScreenState();
}

class QrScannerCustomScreenState extends CustomScreenState {
  @override
  Widget build(BuildContext context) {
    return QrScannerCustomWidget();
  }
}
