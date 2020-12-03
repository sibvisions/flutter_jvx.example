import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jvx_flutterclient/core/models/api/response/menu_item.dart';
import 'package:jvx_flutterclient/core/ui/component/component_widget.dart';
import 'package:jvx_flutterclient/core/ui/component/models/component_model.dart';
import 'package:jvx_flutterclient/core/ui/container/co_panel_widget.dart';
import 'package:jvx_flutterclient/core/ui/screen/screen_manager.dart';
import 'package:jvx_flutterclient/core/ui/screen/so_component_creator.dart';
import 'package:jvx_flutterclient/core/ui/screen/so_menu_manager.dart';

import 'screens/chart_custom_screen.dart';
import 'screens/contact_custom_screen.dart';
import 'screens/hello_custom_screen.dart';
import 'screens/map_custom_screen.dart';
import 'screens/qr_scanner_custom_screen.dart';
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

class ExampleCustomScreenManager extends ScreenManager {
  @override
  void init() {
    SoComponentCreator creator = SoComponentCreator();

    // The method is for setting the standard of each CellEditor or Component,
    // which is being used to build the screen.
    // An example for a panel
    // creator.replaceComponent('Panel', getCustomComponent);

    this.registerScreen(
        TelephoneCallCustomScreen(TELEPHONE_CALL_COMP_ID, null, creator));

    this.registerScreen(UserDataCustomScreen(USER_DATA_COMP_ID, null, creator));

    this.registerScreen(HelloCustomScreen(HELLO_COMP_ID, null, creator));

    this.registerScreen(MapCustomScreen(MAP_COMP_ID, null, creator));

    this.registerScreen(QrScannerCustomScreen(QR_SCANNER_COMP_ID, null, creator));

    this.registerScreen(ChartCustomScreen(CHART_COMP_ID, null, creator));

    this.registerScreen(ContactCustomScreen(CONTACTS_COMP_ID, 'ContactCustomTemplate', creator));
  }

  @override
  void onMenu(SoMenuManager menuManager) {
    //Add Item via your own MenuItem
    MenuItem toAddHelloCustomScreen = MenuItem(
      componentId: HELLO_COMP_ID,
      text: 'Hello Custom Screen',
      image: 'FontAwesome.star-o',
      group: 'Customscreens',
    );

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

  ComponentWidget getCustomComponent(ComponentModel componentModel) =>
      CoGreenPanelWidget(
        componentModel: componentModel,
      );
}

class CoGreenPanelWidget extends CoPanelWidget {
  CoGreenPanelWidget({ComponentModel componentModel})
      : super(componentModel: componentModel);

  @override
  State<StatefulWidget> createState() => CoGreenPanelWidgetState();
}

class CoGreenPanelWidgetState extends CoPanelWidgetState {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.green, width: 10, style: BorderStyle.solid)),
      child: super.build(context),
    );
  }
}
