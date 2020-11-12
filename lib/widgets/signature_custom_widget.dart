import 'package:flutter/material.dart';
import 'package:jvx_flutterclient/core/ui/screen/so_component_data.dart';
import 'package:signature/signature.dart';
import 'dart:convert';

class SignatureCustomWidget extends StatefulWidget {
  final SoComponentData componentData;

  SignatureCustomWidget({Key key, this.componentData}) : super(key: key);

  @override
  _SignatureCustomWidgetState createState() => _SignatureCustomWidgetState();
}

class _SignatureCustomWidgetState extends State<SignatureCustomWidget> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  void selectRecord(int index) {
    widget.componentData?.selectRecord(context, index);
  }

  void setValues(List<dynamic> values) {
    widget.componentData?.setValues(context, values, ['SIGNATURE']);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Text(
              'Sign here:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor)),
              child: Signature(
                controller: _controller,
                height: 200,
                backgroundColor: Colors.white,
              ),
            ),
            //CLEAR CANVAS
            Row(
              children: <Widget>[
                Expanded(
                  child: IconButton(
                    icon: const Icon(Icons.save),
                    color: Theme.of(context).primaryColor,
                    onPressed: () async {
                      if (_controller.isNotEmpty) {
                        var data = await _controller.toPngBytes();
                        setValues([base64Encode(data)]);
                      }
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: const Icon(Icons.delete),
                    color: Theme.of(context).primaryColor,
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
