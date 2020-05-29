import 'package:flutterclient_example/screens/map_custom_screen.dart';
import 'package:flutterclient_example/screens/telephone_call_custom_screen.dart';
import 'package:jvx_flutterclient/custom_screen/custom_screen_manager/custom_screen_manager.dart';
import 'package:jvx_flutterclient/model/action.dart';
import 'package:jvx_flutterclient/model/api/response/user_data.dart';
import 'package:jvx_flutterclient/model/menu_item.dart';
import 'package:jvx_flutterclient/ui/screen/component_creator.dart';
import 'package:jvx_flutterclient/ui/screen/menu_manager.dart';

import 'screens/chart_custom_screen.dart';
import 'screens/hello_custom_screen.dart';
import 'screens/signature_custom_screen.dart';

const String CHART_COMP_ID =
    "com.sibvisions.apps.mobile.demo.screens.features.ChartWorkScreen:L1_MI_DOOPENWORKSCREEN_COM-SIB-APP-MOB-DEM-SCR-FEA-CHAWORSCR";
const String SIGNATURE_COMP_ID =
    "com.sibvisions.apps.mobile.demo.screens.features.SignatureWorkScreen:L1_MI_DOOPENWORKSCREEN_COM-SIB-APP-MOB-DEM-SCR-FEA-SIGWORSCR";
const String HELLO_COMP_ID = "HELLO_CUSTOM_SCREEN";
const String TELEPHONE_CALL_COMP_ID = "TELEPHONE_CALL_SCREEN";
const String MAP_COMP_ID = "MAP_SCREEN";

class ExampleCustomScreenManager extends CustomScreenManager {
  @override
  getScreen(String componentId) {
    print(componentId);
    if (componentId == CHART_COMP_ID) {
      return ChartCustomScreen(ComponentCreator());
    } else if (componentId == HELLO_COMP_ID) {
      return HelloCustomScreen(ComponentCreator());
    } else if (componentId == TELEPHONE_CALL_COMP_ID) {
      return TelephoneCallCustomScreen(ComponentCreator());
    } else if (componentId == MAP_COMP_ID) {
      return MapCustomScreen(ComponentCreator());
    } else if (componentId == SIGNATURE_COMP_ID) {
      return SignatureCustomScreen(ComponentCreator());
    }
    return super.getScreen(componentId);
  }

  @override
  void onMenu(JVxMenuManager menuManager) {
    MenuItem toAddHelloCustomScreen = MenuItem(
        action:
            Action(componentId: HELLO_COMP_ID, label: 'Hello Custom Screen'),
        group: 'Customscreens');

    MenuItem toAddTelephoneCallCustomScreen = MenuItem(
        action: Action(
            componentId: TELEPHONE_CALL_COMP_ID,
            label: 'Telephone Call Screen'),
        group: 'Customscreens');

    MenuItem toAddMapCustomScreen = MenuItem(
        action: Action(componentId: MAP_COMP_ID, label: 'Map Custom Screen'),
        group: 'Customscreens');

    menuManager.addItem(toAddHelloCustomScreen);
    menuManager.addItem(toAddTelephoneCallCustomScreen);
    menuManager.addItem(toAddMapCustomScreen);
  }

  @override
  onUserData(UserData userData) {}
}
