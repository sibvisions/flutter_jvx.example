import 'package:flutter/material.dart';
import 'package:flutter_jvx/flutter_jvx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'screens/contact_custom_screen.dart';
import 'widgets/calendar_custom_widget.dart';
import 'widgets/chart_custom_widget.dart';
import 'widgets/hello_custom_widget.dart';
import 'widgets/map_custom_widget.dart';
import 'widgets/scanner_custom_widget.dart';
import 'widgets/signature_custom_widget.dart';
import 'widgets/styled_table_custom_widget.dart';
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
  static const String HELLO_ID = "Hello";
  static const String TELEPHONE_CALL_ID = "Telephone";
  static const String MAP_ID = "Map";
  static const String QR_SCANNER_ID = "QR_Scanner";
  static const String USER_DATA_ID = "UserData";
  static const String ALTERING_ID = "AlteringScreen";

  ExampleCustomScreenManager() {
    // The method is for setting the standard of each CellEditor or Component,
    // which is being used to build the screen.
    // An example for a panel
    // creator.replaceComponent("Panel", getCustomComponent);

    registerScreen(
      CustomScreen(
        key: HELLO_ID,
        sendOpenScreenRequests: false,
        screenTitle: "Hello",
        screenBuilder: (context, screen) => const HelloCustomWidget(),
      ),
      menuItem: CustomMenuItem(
        label: "Hello",
        group: "Example",
        // Shortcut for Font Awesome Icons
        // faIcon: FontAwesomeIcons.star,
        imageBuilder: (_) => const CircleAvatar(
          backgroundColor: Colors.transparent,
          child: FaIcon(FontAwesomeIcons.star),
        ),
      ),
    );

    registerScreen(
      CustomScreen(
        key: ALTERING_ID,
        sendOpenScreenRequests: false,
        screenTitle: "Altering Custom Screen",
        screenBuilder: (context, screen) => Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.green,
              width: 10,
              style: BorderStyle.solid,
            ),
          ),
          child: screen,
        ),
      ),
      menuItem: CustomMenuItem(
        label: "Altering Custom Screen",
        group: "Example",
        faIcon: FontAwesomeIcons.airbnb,
      ),
    );

    registerScreen(
      CustomScreen.online(
        key: CALENDAR_COMP_ID,
        screenBuilder: (context, screen) => const CalendarCustomWidget(),
      ),
      menuItem: CustomMenuItem(
        label: "Calendar",
        group: "Example",
        faIcon: FontAwesomeIcons.calendar,
      ),
    );

    registerScreen(
      CustomScreen.online(
        key: CHART_COMP_ID,
        screenBuilder: (context, screen) => const ChartCustomWidget(),
      ),
      menuItem: CustomMenuItem(
        label: "Charts",
        group: "Example",
        faIcon: FontAwesomeIcons.chartBar,
      ),
    );

    registerScreen(
      CustomScreen.online(
        key: CONTACTS_COMP_ID,
        screenTitle: "Custom Contacts",
        replaceComponents: [
          CustomComponent(
            componentName: "contactPanel",
            componentBuilder: () => const CoCustomComponentWidget(),
          )
        ],
        headerBuilder: (context) => const CustomHeaderAndFooterWidget(
          text: "This is a custom header",
        ),
        footerBuilder: (context) => const CustomHeaderAndFooterWidget(
          text: "This is a custom footer",
        ),
      ),
      menuItem: CustomMenuItem(
        label: "Contacts",
        group: "Example",
        faIcon: FontAwesomeIcons.userLarge,
      ),
    );

    registerScreen(
      CustomScreen(
        key: MAP_ID,
        screenTitle: "Map",
        sendOpenScreenRequests: false,
        screenBuilder: (context, screen) => const MapCustomWidget(),
      ),
      menuItem: CustomMenuItem(
        label: "Map",
        group: "Example",
        faIcon: FontAwesomeIcons.mapLocationDot,
      ),
    );

    registerScreen(
      CustomScreen(
        key: QR_SCANNER_ID,
        screenTitle: "Custom Scanner",
        showOffline: true,
        sendOpenScreenRequests: false,
        screenBuilder: (context, screen) => const ScannerCustomWidget(),
      ),
      menuItem: CustomMenuItem(
        label: "QR Scanner",
        group: "Example",
        faIcon: FontAwesomeIcons.qrcode,
      ),
    );

    registerScreen(
      CustomScreen.online(
        key: SIGNATURE_COMP_ID,
        replaceComponents: [
          CustomComponent(
            componentName: "signaturePanel",
            componentBuilder: () => const SignatureCustomWidget(),
          ),
        ],
      ),
      menuItem: CustomMenuItem(
        label: "Signature",
        group: "Example",
        faIcon: FontAwesomeIcons.signature,
      ),
    );

    registerScreen(
      CustomScreen.online(
        key: STYLED_TABLE_COMP_ID,
        screenBuilder: (context, screen) => const StyledTableCustomWidget(),
      ),
      menuItem: CustomMenuItem(
        label: "Styled Table",
        group: "Example",
        faIcon: FontAwesomeIcons.table,
      ),
    );

    registerScreen(
      CustomScreen.online(
        key: TELEPHONE_CALL_ID,
        sendOpenScreenRequests: false,
        screenTitle: "Telephone",
        screenBuilder: (context, screen) => const TelephoneCallCustomWidget(),
      ),
      menuItem: CustomMenuItem(
        label: "Telephone",
        group: "Example",
        faIcon: FontAwesomeIcons.phone,
      ),
    );

    registerScreen(
      CustomScreen(
        key: USER_DATA_ID,
        screenTitle: "User Data",
        showOffline: true,
        sendOpenScreenRequests: false,
        screenBuilder: (context, screen) => const UserDataCustomWidget(),
      ),
      menuItem: CustomMenuItem(
        label: "Userdata",
        group: "Example",
        faIcon: FontAwesomeIcons.user,
      ),
    );
  }
}
