import 'package:flutter/material.dart';
import 'package:flutter_jvx/flutter_jvx.dart';

class ExampleSplash extends StatelessWidget {
  final AsyncSnapshot? snapshot;

  const ExampleSplash(this.snapshot, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(32.0),
            child: FlutterLogo(size: 300),
          ),
          Center(
            child: Text(
              ConfigController().title.value ?? "JVx Example",
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: SizedBox.square(
              dimension: 100,
              child: snapshot?.connectionState == ConnectionState.waiting ? const CircularProgressIndicator() : null,
            ),
          ),
        ],
      ),
    );
  }
}
