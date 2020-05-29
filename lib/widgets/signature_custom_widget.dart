import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'package:jvx_flutterclient/utils/globals.dart' as globals;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jvx_flutterclient/ui/widgets/menu_drawer_widget.dart';

class SignatureCustomWidget extends StatefulWidget {
  @override
  _SignatureCustomWidgetState createState() => _SignatureCustomWidgetState();
}

class _SignatureCustomWidgetState extends State<SignatureCustomWidget> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

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
            decoration: BoxDecoration(
                border: Border.all(color: globals.applicationStyle.themeColor)),
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
                  color: globals.applicationStyle.themeColor,
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: const Icon(Icons.delete),
                  color: globals.applicationStyle.themeColor,
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
