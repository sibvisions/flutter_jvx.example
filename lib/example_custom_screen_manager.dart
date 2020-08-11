import 'package:flutter/cupertino.dart';
import 'package:jvx_flutterclient/jvx_flutterclient.dart';
import 'package:jvx_flutterclient/ui/editor/celleditor/co_text_cell_editor.dart';
import 'package:jvx_flutterclient/utils/globals.dart' as globals;

import 'screens/calendar_custom_screen.dart';
import 'screens/chart_custom_screen.dart';
import 'screens/contact_custom_screen.dart';
import 'screens/hello_custom_screen.dart';
import 'screens/map_custom_screen.dart';
import 'screens/qr_scanner_custom_screen.dart';
import 'screens/signature_custom_screen.dart';
import 'screens/styled_table_custom_screen.dart';
import 'screens/telephone_call_custom_screen.dart';
import 'screens/user_data_custom_screen.dart';

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
const String USER_DATA_COMP_ID = "USER_DATA_SCREEN";

class ExampleCustomScreenManager extends CustomScreenManager {
  @override
  void initScreenManager() {
    SoComponentCreator componentCreator = SoComponentCreator();

    // The method is for setting the standard of each CellEditor or Component,
    // which is being used to build the screen.
    // componentCreator.setStandardCellEditors('TextCellEditor', (cellEditor, context) => CustomCellEditor(cellEditor, context));
    // componentCreator.setStandardComponent('Panel', (globalKey, context) => CustomComponent(globalKey, context));

    super.registerScreen(CHART_COMP_ID, ChartCustomScreen(componentCreator));
    super.registerScreen(HELLO_COMP_ID, HelloCustomScreen(componentCreator));
    super.registerScreen(
        TELEPHONE_CALL_COMP_ID, TelephoneCallCustomScreen(componentCreator));
    super.registerScreen(MAP_COMP_ID, MapCustomScreen(componentCreator));
    super.registerScreen(
        SIGNATURE_COMP_ID, SignatureCustomScreen(componentCreator));
    super.registerScreen(
        QR_SCANNER_COMP_ID, QrScannerCustomScreen(componentCreator));
    super.registerScreen(
        USER_DATA_COMP_ID, UserDataCustomScreen(componentCreator));
    super.registerScreen(
        CALENDAR_COMP_ID, CalendarCustomScreen(componentCreator));
    super.registerScreen(
        STYLED_TABLE_COMP_ID, StyledTableCustomScreen(componentCreator));
    super.registerScreen(
        CONTACTS_COMP_ID, ContactCustomScreen(componentCreator));
  }

  @override
  void onMenu(SoMenuManager menuManager) {
    //Add Item via your own MenuItem
    MenuItem toAddHelloCustomScreen = MenuItem(
        action:
            SoAction(componentId: HELLO_COMP_ID, label: 'Hello Custom Screen'),
        image: 'FontAwesome.star-o',
        group: 'Customscreens');
    menuManager.addItem(toAddHelloCustomScreen);

    //Or directly via named parameters
    menuManager.addItemToMenu(
      id: TELEPHONE_CALL_COMP_ID,
      group: 'Customscreens',
      text: 'Telephone Call Screen',
      image: 'FontAwesome.phone',
    );

    menuManager.addItemToMenu(
      id: MAP_COMP_ID,
      group: 'Customscreens',
      text: 'Map Custom Screen',
      image: 'FontAwesome.map',
    );

    menuManager.addItemToMenu(
      id: QR_SCANNER_COMP_ID,
      group: 'Customscreens',
      text: 'QR Scanner Custom Screen',
      image: 'FontAwesome.qrcode',
    );

    menuManager.addItemToMenu(
      id: USER_DATA_COMP_ID,
      group: 'Customscreens',
      text: 'User Data Screen',
      image: 'FontAwesome.user',
    );

    menuManager.addItemToMenu(
      id: CONTACTS_COMP_ID,
      group: 'Customscreens',
      text: 'Contact Custom Screen',
      image: 'FontAwesome.group',
      templateName: 'ContactCustomTemplate',
      checkUnique: true,
    );
  }
}
