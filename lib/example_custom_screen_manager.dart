import 'package:flutter/cupertino.dart';
import 'package:flutterclient_example/screens/calendar_custom_screen.dart';
import 'package:flutterclient_example/screens/contact_custom_screen.dart';
import 'package:flutterclient_example/screens/map_custom_screen.dart';
import 'package:flutterclient_example/screens/qr_scanner_custom_screen.dart';
import 'package:flutterclient_example/screens/styled_table_custom_screen.dart';
import 'package:flutterclient_example/screens/telephone_call_custom_screen.dart';
import 'package:jvx_flutterclient/custom_screen/custom_screen_manager/custom_screen_manager.dart';
import 'package:jvx_flutterclient/model/so_action.dart';
import 'package:jvx_flutterclient/model/api/response/user_data.dart';
import 'package:jvx_flutterclient/model/menu_item.dart';
import 'package:jvx_flutterclient/ui/component/co_custom_component.dart';
import 'package:jvx_flutterclient/ui/screen/so_component_creator.dart';
import 'package:jvx_flutterclient/ui/screen/so_menu_manager.dart';
import 'package:jvx_flutterclient/utils/uidata.dart';
import 'package:jvx_flutterclient/utils/globals.dart' as globals;

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
const String CONTACTS_COMP_ID =
    "com.sibvisions.apps.mobile.demo.screens.features.ContactsWorkScreen:L1_MI_DOOPENWORKSCREEN_COM-SIB-APP-MOB-DEM-SCR-FEA-CONWORSCR";
const String HELLO_COMP_ID = "HELLO_CUSTOM_SCREEN";
const String TELEPHONE_CALL_COMP_ID = "TELEPHONE_CALL_SCREEN";
const String MAP_COMP_ID = "MAP_SCREEN";
const String QR_SCANNER_COMP_ID = "QR_SCANNER_SCREEN";

class ExampleCustomScreenManager extends CustomScreenManager {
  @override
  getScreen(String componentId, {String templateName}) {
    print(componentId);
    globals.currentTempalteName = templateName;
    if (componentId == CHART_COMP_ID) {
      return ChartCustomScreen(SoComponentCreator());
    } else if (componentId == HELLO_COMP_ID) {
      return HelloCustomScreen(SoComponentCreator());
    } else if (componentId == TELEPHONE_CALL_COMP_ID) {
      return TelephoneCallCustomScreen(SoComponentCreator());
    } else if (componentId == MAP_COMP_ID) {
      return MapCustomScreen(SoComponentCreator());
    } else if (componentId == SIGNATURE_COMP_ID) {
      return SignatureCustomScreen(SoComponentCreator());
    } else if (componentId == QR_SCANNER_COMP_ID) {
      return QrScannerCustomScreen(SoComponentCreator());
    } else if (componentId == CALENDAR_COMP_ID) {
      return CalendarCustomScreen(SoComponentCreator());
    } else if (componentId == STYLED_TABLE_COMP_ID) {
      return StyledTableCustomScreen(SoComponentCreator());
    } else if (componentId == CONTACTS_COMP_ID) {
      ContactCustomScreen customerScreen =
          ContactCustomScreen(SoComponentCreator());

      //Add a header and a footer when the template is ContactCustomTemplate
      if (templateName == null || templateName == 'ContactCustomTemplate') {
        CoCustomComponent headerLabel = new CoCustomComponent(
            GlobalKey(debugLabel: 'header'),
            customerScreen.componentScreen.context);
        headerLabel.widget = Container(
            margin: new EdgeInsets.all(20.0),
            child: Text('This is a custom Header',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: UIData.ui_kit_color_2)));
        customerScreen.setHeader(headerLabel);

        CoCustomComponent footerLabel = new CoCustomComponent(
            GlobalKey(debugLabel: 'footer'),
            customerScreen.componentScreen.context);
        footerLabel.widget = Container(
            margin: new EdgeInsets.all(20.0),
            child: Text('This is a custom Footer',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: UIData.ui_kit_color)));
        customerScreen.setFooter(footerLabel);
      }

      return customerScreen;
    }
    return super.getScreen(componentId);
  }

  @override
  void onMenu(SoMenuManager menuManager) {
    MenuItem toAddHelloCustomScreen = MenuItem(
        action:
            SoAction(componentId: HELLO_COMP_ID, label: 'Hello Custom Screen'),
        image: 'FontAwesome.star-o',
        group: 'Customscreens');

    MenuItem toAddTelephoneCallCustomScreen = MenuItem(
        action: SoAction(
            componentId: TELEPHONE_CALL_COMP_ID,
            label: 'Telephone Call Screen'),
        image: 'FontAwesome.phone',
        group: 'Customscreens');

    MenuItem toAddMapCustomScreen = MenuItem(
        action: SoAction(componentId: MAP_COMP_ID, label: 'Map Custom Screen'),
        image: 'FontAwesome.map',
        group: 'Customscreens');

    MenuItem toAddQrScannerCustomScreen = MenuItem(
        action: SoAction(
            componentId: QR_SCANNER_COMP_ID, label: 'QR Scanner Custom Screen'),
        image: 'FontAwesome.qrcode',
        group: 'Customscreens');

    MenuItem toAddCustomContactScreen = MenuItem(
        action: SoAction(
            componentId: CONTACTS_COMP_ID, label: 'Contact Custom Screen'),
        image: 'FontAwesome.group',
        group: 'Customscreens',
        templateName: 'ContactCustomTemplate');

    menuManager.addItem(toAddHelloCustomScreen);
    menuManager.addItem(toAddTelephoneCallCustomScreen);
    menuManager.addItem(toAddMapCustomScreen);
    menuManager.addItem(toAddQrScannerCustomScreen);
    menuManager.addItem(toAddCustomContactScreen, checkUnique: false);
  }

  @override
  onUserData(UserData userData) {}
}
