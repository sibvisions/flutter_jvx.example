import 'package:flutter_jvx/config/app_config.dart';
import 'package:flutter_jvx/config/server_config.dart';
import 'package:flutter_jvx/config/ui_config.dart';
import 'package:flutter_jvx/config/version_config.dart';
import 'package:flutter_jvx/main.dart';

import 'example_custom_screen_manager.dart';

void main() async {
  await FlutterJVx.start(FlutterJVx(
    appConfig: AppConfig(
        title: "JVx Example",
        uiConfig: const UiConfig(
          showRememberMe: true,
          rememberMeChecked: false,
        ),
        requestTimeout: 10,
        serverConfig: const ServerConfig(
          baseUrl: 'http://172.20.0.119:8888/JVx.mobile/services/mobile',
          appName: 'demo',
          username: 'features',
          password: 'features',
        ),
        versionConfig: const VersionConfig(
          commit: "070a55e2",
          buildDate: "2021-09-26",
          version: "1.2.3+1",
        ),
        startupParameters: {
          "apiKey": "<insert token here>",
        }),
    appManager: ExampleCustomScreenManager(),
  ));
}
