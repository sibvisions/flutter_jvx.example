import 'package:flutterclient_example/screens/calendar_custom_screen.dart';
import 'package:flutterclient_example/screens/customer_custom_screen.dart';
import 'package:flutterclient_example/screens/map_custom_screen.dart';
import 'package:flutterclient_example/screens/qr_scanner_custom_screen.dart';
import 'package:flutterclient_example/screens/styled_table_custom_screen.dart';
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
const String CALENDAR_COMP_ID =
    "com.sibvisions.apps.mobile.demo.screens.features.CalendarWorkScreen:L1_MI_DOOPENWORKSCREEN_COM-SIB-APP-MOB-DEM-SCR-FEA-CALWORSCR";
const String STYLED_TABLE_COMP_ID =
    "com.sibvisions.apps.mobile.demo.screens.features.StyledTableWorkScreen:L1_MI_DOOPENWORKSCREEN_COM-SIB-APP-MOB-DEM-SCR-FEA-STYTABWORSCR";
const String HELLO_COMP_ID = "HELLO_CUSTOM_SCREEN";
const String TELEPHONE_CALL_COMP_ID = "TELEPHONE_CALL_SCREEN";
const String MAP_COMP_ID = "MAP_SCREEN";
const String QR_SCANNER_COMP_ID = "QR_SCANNER_SCREEN";

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
    } else if (componentId == QR_SCANNER_COMP_ID) {
      return QrScannerCustomScreen(ComponentCreator());
    } else if (componentId == CALENDAR_COMP_ID) {
      return CalendarCustomScreen(ComponentCreator());
    } else if (componentId == STYLED_TABLE_COMP_ID) {
      return StyledTableCustomScreen(ComponentCreator());
    } else if (componentId ==
        'com.sibvisions.apps.mobile.demo.screens.features.ContactsWorkScreen:L1_MI_DOOPENWORKSCREEN_COM-SIB-APP-MOB-DEM-SCR-FEA-CONWORSCR') {
      return CustomerCustomScreen(ComponentCreator());
    }
    return super.getScreen(componentId);
  }

  @override
  void onMenu(JVxMenuManager menuManager) {
    MenuItem toAddHelloCustomScreen = MenuItem(
        action:
            Action(componentId: HELLO_COMP_ID, label: 'Hello Custom Screen'),
        image: 'FontAwesome.star-o',
        group: 'Customscreens');

    MenuItem toAddTelephoneCallCustomScreen = MenuItem(
        action: Action(
            componentId: TELEPHONE_CALL_COMP_ID,
            label: 'Telephone Call Screen'),
        image: 'FontAwesome.phone',
        group: 'Customscreens');

    MenuItem toAddMapCustomScreen = MenuItem(
        action: Action(componentId: MAP_COMP_ID, label: 'Map Custom Screen'),
        image: 'FontAwesome.map',
        group: 'Customscreens');

    MenuItem toAddQrScannerCustomScreen = MenuItem(
        action: Action(
            componentId: QR_SCANNER_COMP_ID, label: 'QR Scanner Custom Screen'),
        image: 'FontAwesome.qrcode',
        group: 'Customscreens');

    menuManager.addItem(toAddHelloCustomScreen);
    menuManager.addItem(toAddTelephoneCallCustomScreen);
    menuManager.addItem(toAddMapCustomScreen);
    menuManager.addItem(toAddQrScannerCustomScreen);
  }

  @override
  onUserData(UserData userData) {}
}
