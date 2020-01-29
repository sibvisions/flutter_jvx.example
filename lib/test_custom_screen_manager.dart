import 'package:flutterclient_example/test_custom_screeen_2.dart';
import 'package:flutterclient_example/test_custom_screen.dart';
import 'package:jvx_mobile_v3/custom_screen/custom_screen_manager/custom_screen_manager.dart';
import 'package:jvx_mobile_v3/model/action.dart';
import 'package:jvx_mobile_v3/model/api/response/user_data.dart';
import 'package:jvx_mobile_v3/model/menu_item.dart';
import 'package:jvx_mobile_v3/ui/screen/component_creator.dart';
import 'package:jvx_mobile_v3/ui/screen/i_screen.dart';

const String CHART_COMP_ID =
    "com.sibvisions.apps.mobile.demo.screens.features.ChartWorkScreen:L1_MI_COM-SIB-APP-MOB-DEM-SCR-FEA-CHAWORSCR";
const String HELLO_COMP_ID = "HELLO_CUSTOM_SCREEN";

class TestCustomScreenManager extends CustomScreenManager {
  Map<String, IScreen> customScreens = <String, IScreen>{
    CHART_COMP_ID: TestCustomScreen(ComponentCreator()),
    HELLO_COMP_ID: TestCustomScreen2(ComponentCreator()),
  };

  @override
  getScreen(String componentId) {
    if (componentId == CHART_COMP_ID) {
      return customScreens[CHART_COMP_ID];
    } else if (componentId == HELLO_COMP_ID) {
      return customScreens[HELLO_COMP_ID];
    }
    return super.getScreen(componentId);
  }

  @override
  List<MenuItem> onMenu(List<MenuItem> menu) {
    MenuItem toAdd = MenuItem(
        action:
            Action(componentId: HELLO_COMP_ID, label: 'Hello Custom Screen'),
        group: 'Customscreens');
    menu.add(toAdd);
    return menu;
  }

  @override
  bool withServer(String componentId) {
    if (componentId == HELLO_COMP_ID) {
      return false;
    }
    return true;
  }

  @override
  onUserData(UserData userData) {
  }
}
