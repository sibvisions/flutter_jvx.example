import 'package:flutter/material.dart';
import 'package:flutterclient_example/test_custom_screen.dart';
import 'package:flutterclient_example/test_custom_screen_manager.dart';
import 'package:jvx_mobile_v3/main.dart';
import 'package:jvx_mobile_v3/ui/screen/component_creator.dart';
import 'package:jvx_mobile_v3/ui/screen/i_screen.dart';
import 'package:jvx_mobile_v3/utils/config.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // To use the JVx flutter application you need to return the JVxStartingWidget
    // This manages all the Utils needed for the App to run.
    return JVxStartingWidget(
      // Also if you want to run with a Developer Config you can pass one as a parameter
      config: Config(
          baseUrl: 'http://192.168.1.42:8080/JVx.mobile/services/mobile',
          appName: 'demo',
          appMode: 'full',
          debug: true,
          username: 'features',
          password: 'features'),
      // Set package to true so that the application knows where it should look for assets such as images
      package: true,
      // To add a Custom Screen pass it as an parameter here:
      iScreen: TestCustomScreenManager(),
    );
  }
}
