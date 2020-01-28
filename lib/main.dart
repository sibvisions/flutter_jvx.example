import 'package:flutter/material.dart';
import 'package:jvx_mobile_v3/main.dart';
import 'package:jvx_mobile_v3/utils/config.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(child: Image(image: AssetImage('assets/images/sib_visions.jpg', package: 'jvx_mobile_v3'),),);
    return JVxStartingWidget(
      config: Config(
        baseUrl: 'http://127.0.0.1:8080/JVx.mobile/services/mobile',
        appName: 'demo',
        appMode: 'full',
        debug: true,
        username: 'features',
        password: 'features'
      ),
    );
  }
}