import 'package:flutter/material.dart';
import 'package:flutterclient/flutterclient.dart';

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
          automaticallyImplyLeading: true,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.of(context).pop(OpenScreenPagePopStyle.CLOSE);
              })),
      body: Center(
        child: TextButton(
          child: Text('Press this to get back to the Menu'),
          onPressed: () {
            Navigator.of(context).pop(OpenScreenPagePopStyle.CLOSE);
          },
        ),
      ),
    );
  }
}
