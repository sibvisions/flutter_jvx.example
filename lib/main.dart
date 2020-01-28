import 'package:flutter/material.dart';
import 'package:jvx_mobile_v3/main.dart';
import 'package:jvx_mobile_v3/utils/config.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return JVxStartingWidget(
      config: Config(
        baseUrl: 'http://192.168.1.42:8080/JVx.mobile/services/mobile',
        appName: 'demo',
        appMode: 'full',
        debug: true,
        username: 'features',
        password: 'features'
      ),
      package: true,
    );
  }
}