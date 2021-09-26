import 'package:flutter/material.dart';
import 'package:flutterclient/flutterclient.dart';
import 'example_custom_screen_manager.dart';
import 'package:flutterclient/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Creating all dependencies
  await di.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ExampleCustomScreenManager screenManager = ExampleCustomScreenManager();
    // To use the JVx flutter application you need to return the CustomApplicationWidget
    // This manages all the Utils needed for the App to run.
    return CustomApplicationWidget(
        screenManager: screenManager,

        // To add a Custom Screen pass it as an parameter here:
        appConfig: AppConfig(
          title: "Sample App",
          package: true,
          handleSessionTimeout: true,
          loginColorsInverted: false,
          rememberMeChecked: false,
          hideLoginCheckbox: false,
          requestTimeout: 10,
          // initialConfig: ServerConfig(
          //   appMode: 'full',
          //   baseUrl:
          //       'http://192.168.0.241:8888/JVx.mobile/services/mobile',
          //   appName: 'demo',
          // )
        ),
        // Also if you want to run with a Developer Config you can pass one as a parameter
        config: DevConfig(
            appMode: 'full',
            baseUrl: 'http://192.168.0.241:8888/JVx.mobile/services/mobile',
            appName: 'demo',
            username: 'layout',
            password: 'layout'),
        appVersion: AppVersion(
            commit: "070a55e2",
            date: "2021-09-26",
            buildName: "1.0.0",
            buildNumber: "1"));
  }
}
