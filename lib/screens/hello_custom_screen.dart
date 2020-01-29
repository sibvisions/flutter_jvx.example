import 'package:flutter/material.dart';

class HelloCustomScreen extends StatefulWidget {
  @override
  _HelloCustomScreenState createState() => _HelloCustomScreenState();
}

class _HelloCustomScreenState extends State<HelloCustomScreen> {
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
