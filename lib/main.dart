import 'package:flutter/material.dart';
import 'package:jvx_flutterclient/jvx_flutterclient.dart';

import 'example_custom_screen_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // To use the JVx flutter application you need to return the CustomApplicationWidget
    // This manages all the Utils needed for the App to run.
    return CustomApplicationWidget(
      // Also if you want to run with a Developer Config you can pass one as a parameter
      config: Config(
          baseUrl: 'http://127.0.0.1:8080/JVx.mobile/services/mobile',
          appName: 'demo',
          debug: true,
          username: 'layout',
          password: 'layout'),
      // To add a Custom Screen pass it as an parameter here:
      screenManager: ExampleCustomScreenManager(),
    );
  }
}
