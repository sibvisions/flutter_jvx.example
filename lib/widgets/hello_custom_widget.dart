import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class HelloCustomWidget extends StatefulWidget {
  const HelloCustomWidget({Key? key}) : super(key: key);

  @override
  _HelloCustomWidgetState createState() => _HelloCustomWidgetState();
}

class _HelloCustomWidgetState extends State<HelloCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('Press this to get back to the Menu'),
        onPressed: () {
          context.beamBack();
        },
      ),
    );
  }
}
