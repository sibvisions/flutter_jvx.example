import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_jvx/flutter_jvx.dart';
import 'package:signature/signature.dart';

class SignatureCustomWidget extends StatefulWidget {
  const SignatureCustomWidget({super.key});

  @override
  State<SignatureCustomWidget> createState() => _SignatureCustomWidgetState();
}

class _SignatureCustomWidgetState extends State<SignatureCustomWidget> {
  static const String CONTACT_DATA_PROVIDER = "JVxMobileDemo/Sig-3V/contacts#4";
  static const String COLUMN_NAME_SIGNATURE = "SIGNATURE";

  final SignatureController _controller = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 30,
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Text(
              "Sign here:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.primary),
                color: Colors.white,
              ),
              child: Signature(
                controller: _controller,
                height: 200,
                backgroundColor: Colors.transparent,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: IconButton(
                    icon: const Icon(Icons.save),
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: () async {
                      if (_controller.isNotEmpty) {
                        var data = await _controller.toPngBytes();
                        await DataBook.updateRecord(
                          pDataProvider: CONTACT_DATA_PROVIDER,
                          pColumnNames: [COLUMN_NAME_SIGNATURE],
                          pValues: [base64Encode(data!)],
                        );
                      }
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: const Icon(Icons.delete),
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: () {
                      setState(() => _controller.clear());
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
