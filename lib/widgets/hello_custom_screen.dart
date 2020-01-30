import 'package:flutter/material.dart';

class HelloCustomWidget extends StatefulWidget {
  @override
  _HelloCustomWidgetState createState() => _HelloCustomWidgetState();
}

class _HelloCustomWidgetState extends State<HelloCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
      ),
      body: Center(
        child: FlatButton(
          child: Text('Press this to get back to the Menu'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
