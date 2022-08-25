import 'package:flutter/material.dart';
import 'package:flutter_jvx/custom/app_manager.dart';
import 'package:flutter_jvx/custom/custom_component.dart';
import 'package:flutter_jvx/custom/custom_menu_item.dart';
import 'package:flutter_jvx/custom/custom_screen.dart';
import 'package:flutter_jvx_example/screens/contact_custom_screen.dart';
import 'package:flutter_jvx_example/widgets/chart_custom_widget.dart';
import 'package:flutter_jvx_example/widgets/signature_custom_widget.dart';
import 'package:flutter_jvx_example/widgets/styled_table_custom_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets/calendar_custom_widget.dart';
import 'widgets/hello_custom_widget.dart';
import 'widgets/map_custom_widget.dart';
import 'widgets/scanner_custom_widget.dart';
import 'widgets/telephone_call_custom_widget.dart';
import 'widgets/user_data_custom_widget.dart';

class ExampleCustomScreenManager extends AppManager {
  static const String CHART_COMP_ID =
      "com.sibvisions.apps.mobile.demo.screens.features.ChartWorkScreen:L1_MI_DOOPENWORKSCREEN_COM-SIB-APP-MOB-DEM-SCR-FEA-CHAWORSCR";
  static const String SIGNATURE_COMP_ID =
      "com.sibvisions.apps.mobile.demo.screens.features.SignatureWorkScreen:L1_MI_DOOPENWORKSCREEN_COM-SIB-APP-MOB-DEM-SCR-FEA-SIGWORSCR";
  static const String CALENDAR_COMP_ID =
      "com.sibvisions.apps.mobile.demo.screens.features.CalendarWorkScreen:L1_MI_DOOPENWORKSCREEN_COM-SIB-APP-MOB-DEM-SCR-FEA-CALWORSCR";
  static const String STYLED_TABLE_COMP_ID =
      "com.sibvisions.apps.mobile.demo.screens.features.StyledTableWorkScreen:L1_MI_DOOPENWORKSCREEN_COM-SIB-APP-MOB-DEM-SCR-FEA-STYTABWORSCR";
  static const String CONTACTS_COMP_ID =
      "com.sibvisions.apps.mobile.demo.screens.features.ContactsWorkScreen:L1_MI_DOOPENWORKSCREEN_COM-SIB-APP-MOB-DEM-SCR-FEA-CONWORSCR";
  static const String HELLO_COMP_ID = "HELLO_CUSTOM_SCREEN";
  static const String TELEPHONE_CALL_COMP_ID = "TELEPHONE_CALL_SCREEN";
  static const String MAP_COMP_ID = "MAP_SCREEN";
  static const String QR_SCANNER_COMP_ID = "QR_SCANNER_SCREEN";
  static const String USER_DATA_COMP_ID = "USER_DATA_SCREEN";
  static const String ALTERING_COMP_ID = "ALTERING_COMP_ID";

  ExampleCustomScreenManager() {
    // The method is for setting the standard of each CellEditor or Component,
    // which is being used to build the screen.
    // An example for a panel
    // creator.replaceComponent('Panel', getCustomComponent);

    registerScreen(CustomScreen(
      screenLongName: HELLO_COMP_ID,
      screenTitle: 'Hello',
      menuItemModel: CustomMenuItem(
        screenLongName: HELLO_COMP_ID,
        label: "Hello",
        group: "Example",
        // faIcon: FontAwesomeIcons.star,
        iconBuilder: (size, color) => CircleAvatar(
          backgroundColor: Colors.transparent,
          child: FaIcon(
            FontAwesomeIcons.ello,
            size: size,
            color: color,
          ),
        ),
      ),
      screenBuilder: (context, screen) => const HelloCustomWidget(),
    ));

    registerScreen(CustomScreen(
      screenLongName: ALTERING_COMP_ID,
      screenTitle: 'Altering Custom Screen',
      menuItemModel: CustomMenuItem(
        screenLongName: ALTERING_COMP_ID,
        label: "Altering Custom Screen",
        group: "Example",
        faIcon: FontAwesomeIcons.airbnb,
      ),
      screenBuilder: (context, screen) => Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.green, width: 10, style: BorderStyle.solid),
        ),
        child: screen,
      ),
    ));

    registerScreen(CustomScreen(
      screenLongName: CALENDAR_COMP_ID,
      menuItemModel: CustomMenuItem(
        screenLongName: CALENDAR_COMP_ID,
        label: 'Calendar',
        group: "Example",
        faIcon: FontAwesomeIcons.calendar,
      ),
      screenBuilder: (context, screen) => const CalendarCustomWidget(),
    ));

    registerScreen(CustomScreen(
      screenLongName: CHART_COMP_ID,
      menuItemModel: CustomMenuItem(
        screenLongName: CHART_COMP_ID,
        label: 'Charts',
        group: "Example",
        faIcon: FontAwesomeIcons.chartBar,
      ),
      screenBuilder: (context, screen) => const ChartCustomWidget(),
    ));

    registerScreen(CustomScreen(
      screenLongName: CONTACTS_COMP_ID,
      menuItemModel: CustomMenuItem(
        screenLongName: CONTACTS_COMP_ID,
        label: 'Contacts',
        group: "Example",
        faIcon: FontAwesomeIcons.userLarge,
      ),
      replaceComponents: [
        CustomComponent(
          componentName: "contactPanel",
          componentBuilder: () => const CoCustomComponentWidget(),
        )
      ],
      headerBuilder: (context) => const CustomHeaderAndFooterWidget(
        text: 'This is a custom header',
      ),
      footerBuilder: (context) => const CustomHeaderAndFooterWidget(
        text: 'This is a custom footer',
      ),
    ));

    registerScreen(CustomScreen(
      screenLongName: MAP_COMP_ID,
      menuItemModel: CustomMenuItem(
        screenLongName: MAP_COMP_ID,
        label: 'Map',
        group: "Example",
        faIcon: FontAwesomeIcons.mapLocationDot,
      ),
      screenBuilder: (context, screen) => const MapCustomWidget(),
    ));

    registerScreen(CustomScreen(
      screenLongName: QR_SCANNER_COMP_ID,
      showOffline: true,
      menuItemModel: CustomMenuItem(
        screenLongName: QR_SCANNER_COMP_ID,
        label: 'QR Scanner',
        group: "Example",
        faIcon: FontAwesomeIcons.qrcode,
      ),
      screenBuilder: (context, screen) => const ScannerCustomWidget(),
    ));

    registerScreen(CustomScreen(
      screenLongName: SIGNATURE_COMP_ID,
      menuItemModel: CustomMenuItem(
        screenLongName: SIGNATURE_COMP_ID,
        label: 'Signature',
        group: "Example",
        faIcon: FontAwesomeIcons.signature,
      ),
      replaceComponents: [
        CustomComponent(
          componentName: 'signaturePanel',
          componentBuilder: () => const SignatureCustomWidget(),
        ),
      ],
    ));

    registerScreen(CustomScreen(
      screenLongName: STYLED_TABLE_COMP_ID,
      menuItemModel: CustomMenuItem(
        screenLongName: STYLED_TABLE_COMP_ID,
        label: 'Styled Table',
        group: "Example",
        faIcon: FontAwesomeIcons.table,
      ),
      screenBuilder: (context, screen) => const StyledTableCustomWidget(),
    ));

    registerScreen(CustomScreen(
      screenLongName: TELEPHONE_CALL_COMP_ID,
      screenTitle: 'Telephone',
      menuItemModel: CustomMenuItem(
        screenLongName: TELEPHONE_CALL_COMP_ID,
        label: "Telephone",
        group: "Example",
        faIcon: FontAwesomeIcons.phone,
      ),
      screenBuilder: (context, screen) => const TelephoneCallCustomWidget(),
    ));

    registerScreen(CustomScreen(
      screenLongName: USER_DATA_COMP_ID,
      showOffline: true,
      menuItemModel: CustomMenuItem(
        screenLongName: USER_DATA_COMP_ID,
        label: 'Userdata',
        group: "Example",
        faIcon: FontAwesomeIcons.user,
      ),
      screenBuilder: (context, screen) => const UserDataCustomWidget(),
    ));
  }
}
