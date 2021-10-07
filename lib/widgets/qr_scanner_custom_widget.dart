import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterclient/flutterclient.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_rounded_button.dart';

class QrScannerCustomWidget extends StatefulWidget {
  @override
  _QrScannerCustomWidgetState createState() => _QrScannerCustomWidgetState();
}

class _QrScannerCustomWidgetState extends State<QrScannerCustomWidget> {
  ScanResult? scanResult;

  // static final _possibleFormats = BarcodeFormat.values.toList()
  //   ..removeWhere((e) => e == BarcodeFormat.unknown);
  // final _flashOnController = TextEditingController(text: "Flash on");
  // final _flashOffController = TextEditingController(text: "Flash off");
  // final _cancelController = TextEditingController(text: "Cancel");

  // var _aspectTolerance = 0.00;
  // var _numberOfCameras = 0;
  // var _selectedCamera = -1;
  // var _useAutoFocus = true;
  // var _autoEnableFlash = false;

  // List<BarcodeFormat> selectedFormats = _possibleFormats.toList();

  Future scan() async {
    try {
      // var options = ScanOptions(
      //   strings: {
      //     "cancel": _cancelController.text,
      //     "flash_on": _flashOnController.text,
      //     "flash_off": _flashOffController.text,
      //   },
      //   restrictFormat: selectedFormats,
      //   useCamera: _selectedCamera,
      //   autoEnableFlash: _autoEnableFlash,
      //   android: AndroidOptions(
      //     aspectTolerance: _aspectTolerance,
      //     useAutoFocus: _useAutoFocus,
      //   ),
      // );

      // var result = await BarcodeScanner.scan(options: options);

      var result = await BarcodeScanner.scan();

      setState(() {
        scanResult = result;
        print("THIS WAS SCANNED " + scanResult!.rawContent);
      });
    } on PlatformException catch (e) {
      var result = 'Error';
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          result = 'The user did not grant the camera permission!';
        });
      } else {
        result = 'Unknown error: $e';
      }
      setState(() {
        print("THIS WAS SCANNED " + result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Scan QR Code'),
          automaticallyImplyLeading: true,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.of(context).pop(OpenScreenPagePopStyle.CLOSE);
              })),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(15),
          height: 150,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Result:',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  scanResult == null
                      ? 'Nothing scanned yet!'
                      : scanResult!.rawContent,
                ),
              ),
              Container(
                width: double.infinity,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: CustomRoundedButton("Scan",
                          Icon(FontAwesomeIcons.qrcode, color: Colors.white),
                          () {
                        scan();
                      }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
