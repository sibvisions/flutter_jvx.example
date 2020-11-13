import 'package:flutter/material.dart';
import 'package:flutterclient_example/widgets/qr_scanner_custom_widget.dart';
import 'package:jvx_flutterclient/core/models/api/request.dart';
import 'package:jvx_flutterclient/core/models/api/response.dart';
import 'package:jvx_flutterclient/core/models/api/response/response_data.dart';
import 'package:jvx_flutterclient/features/custom_screen/ui/screen/custom_screen.dart';

class QrScannerCustomScreen extends CustomScreen {
  QrScannerCustomScreen(String componentId, String templateName) : super(componentId, templateName);

  @override
  Widget build(BuildContext context) {
    return QrScannerCustomWidget();
  }

  @override
  void update(Response response) {
    super.update(response);
  }

  @override
  bool withServer() {
    return false;
  }
}
