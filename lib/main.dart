import 'package:flutter_jvx/config/app_config.dart';
import 'package:flutter_jvx/config/server_config.dart';
import 'package:flutter_jvx/config/ui_config.dart';
import 'package:flutter_jvx/config/version_config.dart';
import 'package:flutter_jvx/flutter_jvx.dart';

import 'example_custom_screen_manager.dart';

void main() async {
  await FlutterJVx.start(FlutterJVx(
    appConfig: const AppConfig(
        title: "JVx Example",
        uiConfig: UiConfig(
          showRememberMe: true,
          rememberMeChecked: false,
        ),
        requestTimeout: 10,
        serverConfig: ServerConfig(
          baseUrl: 'http://172.20.0.119:8888/JVx.mobile/services/mobile',
          appName: 'demo',
          username: 'features',
          password: 'features',
        ),
        versionConfig: VersionConfig(
          commit: "070a55e2",
          buildDate: "2021-09-26",
        ),
        startupParameters: {
          "apiKey": "<insert token here>",
        }),
    appManager: ExampleCustomScreenManager(),
  ));
}
