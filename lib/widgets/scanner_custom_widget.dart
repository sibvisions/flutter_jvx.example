import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'custom_rounded_button.dart';

class ScannerCustomWidget extends StatefulWidget {
  const ScannerCustomWidget({super.key});

  @override
  State<ScannerCustomWidget> createState() => _ScannerCustomWidgetState();
}

class _ScannerCustomWidgetState extends State<ScannerCustomWidget> {
  BarcodeCapture? scanResult;

  @override
  Widget build(BuildContext context) {
    return scanResult == null
        ? MobileScanner(
            onDetect: (barcode) {
              scanResult = barcode;
              setState(() {});
            },
          )
        : Column(
            children: [
              const Spacer(),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Text("Result:",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              scanResult?.barcodes[0].rawValue ?? "Nothing scanned yet!",
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomRoundedButton(
                                    text: const Text("Scan"),
                                    icon: const Icon(FontAwesomeIcons.qrcode, color: Colors.white),
                                    onTap: () {
                                      scanResult = null;
                                      setState(() {});
                                    }),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Spacer(),
            ],
          );
  }
}
