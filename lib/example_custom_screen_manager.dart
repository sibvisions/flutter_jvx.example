import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterclient/flutterclient.dart';
import 'package:flutterclient_example/screens/calendar_custom_screen.dart';
import 'package:flutterclient_example/screens/signature_custom_screen.dart';
import 'package:flutterclient_example/screens/styled_table_custom_screen.dart';

import 'screens/altering_custom_screen.dart';
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
const String ALTERING_COMP_ID = "ALTERING_COMP_ID";

class ExampleCustomScreenManager extends ScreenManager {
  @override
  void init(Key navigatorKey) {
    super.init(navigatorKey);
    SoComponentCreator creator = SoComponentCreator();

    // The method is for setting the standard of each CellEditor or Component,
    // which is being used to build the screen.
    // An example for a panel
    // creator.replaceComponent('Panel', getCustomComponent);

    this.registerScreen(AlteringCustomScreen(
        configuration: SoScreenConfiguration(
            response: ApiInitial(),
            screenComponentId: ALTERING_COMP_ID,
            componentId: 'ALT',
            screenTitle: 'Altering Custom Screen'),
        creator: creator));

    this.registerScreen(
      TelephoneCallCustomScreen(
          configuration: SoScreenConfiguration(
              response: ApiInitial(),
              screenComponentId: TELEPHONE_CALL_COMP_ID,
              componentId: 'TELEPHONE',
              screenTitle: 'Telephone',
              withServer: false),
          creator: creator),
    );

    this.registerScreen(
      CalendarCustomScreen(
          configuration: SoScreenConfiguration(
              response: ApiInitial(),
              screenComponentId: CALENDAR_COMP_ID,
              componentId: 'Cal-7V',
              screenTitle: 'Calendar',
              withServer: true),
          creator: creator),
    );

    this.registerScreen(
      StyledTableCustomScreen(
          configuration: SoScreenConfiguration(
              response: ApiInitial(),
              screenComponentId: STYLED_TABLE_COMP_ID,
              componentId: 'StyTab-2G',
              screenTitle: 'Styled Table',
              withServer: true),
          creator: creator),
    );

    this.registerScreen(
      SignatureCustomScreen(
          configuration: SoScreenConfiguration(
              response: ApiInitial(),
              screenComponentId: SIGNATURE_COMP_ID,
              componentId: 'Sig-3V',
              screenTitle: 'Signature',
              withServer: true),
          creator: creator),
    );

    this.registerScreen(UserDataCustomScreen(
        configuration: SoScreenConfiguration(
            response: ApiInitial(),
            screenComponentId: USER_DATA_COMP_ID,
            componentId: 'USER_DATA',
            screenTitle: 'Userdata',
            withServer: false),
        creator: creator));

    this.registerScreen(HelloCustomScreen(
        configuration: SoScreenConfiguration(
            response: ApiInitial(),
            screenComponentId: HELLO_COMP_ID,
            componentId: 'HELLO',
            screenTitle: 'Hello',
            withServer: false),
        creator: creator));

    this.registerScreen(MapCustomScreen(
        configuration: SoScreenConfiguration(
            response: ApiInitial(),
            screenComponentId: MAP_COMP_ID,
            componentId: 'MAP',
            screenTitle: 'Map',
            withServer: false),
        creator: creator));

    this.registerScreen(QrScannerCustomScreen(
        configuration: SoScreenConfiguration(
            response: ApiInitial(),
            screenComponentId: QR_SCANNER_COMP_ID,
            componentId: 'QR_SCANNER',
            screenTitle: 'Qr Scanner',
            withServer: false),
        creator: creator));

    this.registerScreen(ChartCustomScreen(
        configuration: SoScreenConfiguration(
            response: ApiInitial(),
            screenComponentId: CHART_COMP_ID,
            componentId: 'Cha-OL',
            screenTitle: 'Charts',
            withServer: true),
        creator: creator));

    this.registerScreen(ContactCustomScreen(
      configuration: SoScreenConfiguration(
        response: ApiInitial(),
        screenComponentId: CONTACTS_COMP_ID,
        componentId: 'Con-CG',
        screenTitle: 'Contacts',
        withServer: true,
        templateName: 'ContactCustomTemplate',
      ),
      creator: creator,
    ));
  }

  @override
  SoMenuManager onMenu(SoMenuManager menuManager) {
    // If you need userData you just need to call the getter
    print(this.userData?.displayName);

    // Add Item via your own MenuItem
    MenuItem toAddHelloCustomScreen = MenuItem(
      componentId: HELLO_COMP_ID,
      group: 'Customscreens',
      text: 'Hello Custom Screen',
      image: 'FontAwesome.star-o',
    );

    menuManager.addItem(toAddHelloCustomScreen);

    // Or directly via named parameters
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

    return menuManager;
  }

  @override
  Future<ApiState?> onResponse(Request request, String responseBody,
      Future<ApiState> Function() callback) async {
    return super.onResponse(request, responseBody, callback);
  }

  @override
  String onCookie(String cookie) {
    return super.onCookie(cookie);
  }

  ComponentWidget getCustomComponent(ContainerComponentModel componentModel) =>
      CoGreenPanelWidget(
        componentModel: componentModel,
      );
}

class CoGreenPanelWidget extends CoPanelWidget {
  CoGreenPanelWidget({required ContainerComponentModel componentModel})
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
