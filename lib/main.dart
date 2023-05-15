import 'package:flutter_jvx/flutter_jvx.dart';

import 'example_custom_screen_manager.dart';
import 'example_login.dart';
import 'splash.dart';

void main() async {
  await FlutterUI.start(FlutterUI(
    appConfig: AppConfig(
      title: "JVx Example",
      uiConfig: const UiConfig(
        showRememberMe: true,
        rememberMeChecked: false,
      ),
      requestTimeout: const Duration(seconds: 10),
      serverConfigs: [
        PredefinedServerConfig(
          baseUrl: Uri.parse("http://172.20.0.119:8888/JVx.mobile/services/mobile"),
          appName: "demo",
          username: "features",
          password: "features",
        ),
      ],
      versionConfig: const VersionConfig(
        commit: "070a55e2",
        buildDate: "2021-09-26",
      ),
    ),
    appManager: ExampleCustomScreenManager(),
    splashBuilder: (context, snapshot) => ExampleSplash(snapshot),
    loginBuilder: (context, mode) => ExampleLogin(mode: mode),
  ));
}
