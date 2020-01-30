import 'package:jvx_mobile_v3/custom_screen/custom_screen_manager/custom_screen_manager.dart';
import 'package:jvx_mobile_v3/model/action.dart';
import 'package:jvx_mobile_v3/model/api/response/user_data.dart';
import 'package:jvx_mobile_v3/model/menu_item.dart';
import 'package:jvx_mobile_v3/ui/screen/component_creator.dart';
import 'package:jvx_mobile_v3/ui/screen/i_screen.dart';

import 'screens/chart_custom_screen.dart';
import 'screens/hello_custom_screeen.dart';

const String CHART_COMP_ID =
    "com.sibvisions.apps.mobile.demo.screens.features.ChartWorkScreen:L1_MI_COM-SIB-APP-MOB-DEM-SCR-FEA-CHAWORSCR";
const String HELLO_COMP_ID = "HELLO_CUSTOM_SCREEN";

class ExampleCustomScreenManager extends CustomScreenManager {
  Map<String, IScreen> customScreens = <String, IScreen>{
    CHART_COMP_ID: ChartCustomScreen(ComponentCreator()),
    HELLO_COMP_ID: HelloCustomScreen(ComponentCreator()),
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
  onUserData(UserData userData) {
  }
}
