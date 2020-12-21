import 'package:flutter/material.dart';
import 'package:jvx_flutterclient/core/utils/config/config.dart';
import 'package:jvx_flutterclient/features/custom_screen/ui/screen/custom_application_widget.dart';
import 'package:jvx_flutterclient/injection_container.dart' as di;

import 'example_custom_screen_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // To use the JVx flutter application you need to return the CustomApplicationWidget
    // This manages all the Utils needed for the App to run.
    return CustomApplicationWidget(
      // Also if you want to run with a Developer Config you can pass one as a parameter
      config: Config(
          baseUrl: 'http://172.16.0.67:8080/JVx.mobile/services/mobile',
          appName: 'demo',
          debug: true,
          username: 'features',
          password: 'features'),
      // To add a Custom Screen pass it as an parameter here:
      screenManager: ExampleCustomScreenManager(),
    );
  }
}
