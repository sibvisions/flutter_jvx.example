import 'package:flutter/material.dart';
import 'package:flutterclient_example/widgets/qr_scanner_custom_widget.dart';
import 'package:jvx_flutterclient/custom_screen/custom_screen.dart';
import 'package:jvx_flutterclient/model/api/request/request.dart';
import 'package:jvx_flutterclient/model/api/response/response_data.dart';
import 'package:jvx_flutterclient/ui/screen/component_creator.dart';

class QrScannerCustomScreen extends CustomScreen {
  QrScannerCustomScreen(ComponentCreator componentCreator)
      : super(componentCreator);

  @override
  Widget getWidget() {
    return QrScannerCustomWidget();
  }

  @override
  void update(Request request, ResponseData responseData) {}

  @override
  bool withServer() {
    return false;
  }
}
