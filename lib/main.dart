import 'package:flutter_jvx/flutter_jvx.dart';

import 'customization/login.dart';
import 'customization/menu.dart';
import 'customization/splash.dart';
import 'screen_manager.dart';

void main() {
  FlutterUI.start(FlutterUI(
    appConfig: AppConfig(
      title: "JVx Example",
      privacyPolicy: Uri.tryParse("https://visionx.sibvisions.com/privacy-policy/"),
      customAppsAllowed: true,
      forceSingleAppMode: false,
      uiConfig: const UiConfig(
        showRememberMe: true,
      ),
      serverConfigs: [
        PredefinedServerConfig(
            baseUrl: Uri.parse("http://localhost:8081/JVx.mobile/services/mobile"),
            appName: "demo",
            username: "features",
            password: "features",
            icon: "https://upload.wikimedia.org/wikipedia/commons/a/a6/Jvx_2020.png",
            locked: true,
            parametersHidden: true),
      ],
      logConfig: const LogConfig(
        levels: LogLevelConfig(
          general: Level.error,
          api: Level.error,
          command: Level.error,
          ui: Level.error,
          layout: Level.error,
        ),
      ),
      versionConfig: const VersionConfig(
          commit: "7195b2d",
          buildDate: "2025-01-24",
          buildNumber: -1),
    ),
    appManager: ExampleCustomScreenManager(),
    splashBuilder: (context, snapshot) => ExampleSplash(snapshot),
    loginHandler: LoginHandler(builder: (context, mode) => ExampleLogin(mode: mode)),
    menuBuilder: (context, key, mode, menuModel, onClick, grouped, sticky, groupOnlyOnMultiple) {
      if (mode != MenuMode.GRID) return null;
      return ExampleMenu(key: key, menuModel, onClick, grouped, sticky, groupOnlyOnMultiple);
    },
  ));
}
