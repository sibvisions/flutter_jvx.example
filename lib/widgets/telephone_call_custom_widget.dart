import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jvx_flutterclient/ui/page/menu_page.dart';
import 'package:jvx_flutterclient/ui/widgets/menu_drawer_widget.dart';
import 'package:jvx_flutterclient/utils/globals.dart' as globals;
import 'package:jvx_flutterclient/jvx_flutterclient.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_rounded_button.dart';

class TelephoneCallCustomWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  _launchWhatapp(String numberToCall, String text) async {
    if (!Platform.isIOS) {
      await launch("whatsapp://send?phone=$numberToCall&text=");
    } else {
      await launch('https://wa.me/$numberToCall?text=$text');
    }
  }

  @override
  Widget build(BuildContext context) {
    String numberToCall;

    return WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              settings: RouteSettings(name: '/Menu'),
              builder: (_) => MenuPage(
                    menuItems: globals.items,
                  )));
          return false;
        },
        child: Scaffold(
          key: _scaffoldKey,
          appBar: globals.appFrame.showScreenHeader
              ? AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          settings: RouteSettings(name: '/Menu'),
                          builder: (_) => MenuPage(
                                menuItems: globals.items,
                              )));
                    },
                  ),
                  title: Text('Telephone Call'),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(FontAwesomeIcons.ellipsisV),
                      onPressed: () =>
                          _scaffoldKey.currentState.openEndDrawer(),
                    )
                  ],
                )
              : null,
          endDrawer: MenuDrawerWidget(
              menuItems: globals.items,
              listMenuItems: true,
              currentTitle: 'Telephone Call',
              groupedMenuMode: true),
          body: Center(
            child: Container(
              margin: EdgeInsets.all(15),
              height: 150,
              decoration: BoxDecoration(
                color: UIData.ui_kit_color_2,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Enter telephone number',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      onChanged: (String change) => numberToCall = change,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: CustomRoundedButton(
                              "Call", Icon(Icons.call, color: Colors.white),
                              () {
                            launch("tel://$numberToCall");
                          }),
                        ),
                        Expanded(
                          child: CustomRoundedButton(
                              "SMS", Icon(Icons.sms, color: Colors.white), () {
                            launch("sms://$numberToCall");
                          }),
                        ),
                        Expanded(
                          child: CustomRoundedButton(
                              "WhatsApp",
                              Icon(FontAwesomeIcons.whatsapp,
                                  color: Colors.white), () {
                            _launchWhatapp(numberToCall, "");
                          }),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
