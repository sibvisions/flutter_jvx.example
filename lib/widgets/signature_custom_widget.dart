import 'package:flutter/material.dart';
import 'package:jvx_flutterclient/ui/screen/component_data.dart';
import 'package:jvx_flutterclient/utils/uidata.dart';
import 'package:signature/signature.dart';
import 'dart:convert';

class SignatureCustomWidget extends StatefulWidget {
  final ComponentData componentData;

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
    return Center(
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
            decoration:
                BoxDecoration(border: Border.all(color: UIData.ui_kit_color_2)),
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
                  color: UIData.ui_kit_color_2,
                  onPressed: () async {
                    if (_controller.isNotEmpty) {
                      var data = await _controller.toPngBytes();
                      selectRecord(0);
                      setValues([base64Encode(data)]);
                    }
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: const Icon(Icons.delete),
                  color: UIData.ui_kit_color_2,
                  onPressed: () {
                    setState(() => _controller.clear());
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
