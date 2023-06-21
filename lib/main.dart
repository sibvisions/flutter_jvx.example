import 'package:flutter_jvx/flutter_jvx.dart';

import 'customization/login.dart';
import 'customization/menu.dart';
import 'customization/splash.dart';
import 'screen_manager.dart';

void main() async {
  await FlutterUI.start(FlutterUI(
    appConfig: AppConfig(
      title: "JVx Example",
      uiConfig: const UiConfig(
        showRememberMe: true,
        rememberMeChecked: false,
      ),
      connectTimeout: const Duration(seconds: 10),
      serverConfigs: [
        PredefinedServerConfig(
          baseUrl: Uri.parse("http://172.20.0.119:8888/JVx.mobile/services/mobile"),
          appName: "demo",
          username: "features",
          password: "features",
        ),
      ],
      logConfig: const LogConfig(
        levels: LogLevelConfig(
          general: Level.info,
          api: Level.info,
          command: Level.info,
          ui: Level.info,
          layout: Level.info,
        ),
      ),
      versionConfig: const VersionConfig(
        commit: "070a55e2",
        buildDate: "2021-09-26",
      ),
    ),
    appManager: ExampleCustomScreenManager(),
    splashBuilder: (context, snapshot) => ExampleSplash(snapshot),
    loginBuilder: (context, mode) => ExampleLogin(mode: mode),
    menuBuilder: (context, key, mode, menuModel, onClick, grouped, sticky, groupOnlyOnMultiple) {
      if (mode != MenuMode.GRID) return null;
      return ExampleMenu(key: key, menuModel, onClick, grouped, sticky, groupOnlyOnMultiple);
    },
  ));
}
