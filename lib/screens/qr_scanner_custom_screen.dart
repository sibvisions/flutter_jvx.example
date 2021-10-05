import 'package:flutter/material.dart';
import 'package:flutterclient/flutterclient.dart';
import 'package:flutterclient_example/widgets/qr_scanner_custom_widget.dart';

class QrScannerCustomScreen extends CustomScreen {
  QrScannerCustomScreen(
      {Key? key,
      required SoScreenConfiguration configuration,
      required SoComponentCreator creator})
      : super(key: key, configuration: configuration, creator: creator);

  @override
  QrScannerCustomScreenState createState() => QrScannerCustomScreenState();
}

class QrScannerCustomScreenState extends CustomScreenState {
  @override
  Widget build(BuildContext context) {
    return QrScannerCustomWidget();
  }
}
