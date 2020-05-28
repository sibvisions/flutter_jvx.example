import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jvx_flutterclient/model/menu_item.dart';
import 'package:jvx_flutterclient/ui/widgets/menu_drawer_widget.dart';
import 'package:jvx_flutterclient/utils/globals.dart' as globals;
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_rounded_button.dart';

class TelephoneCallCustomWidget extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    String numberToCall;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Telephone Call'),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.ellipsisV),
            onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
          )
        ],
      ),
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
            color: globals.applicationStyle.themeColor,
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
                          "Call", Icon(Icons.call, color: Colors.white), () {
                        launch("tel://$numberToCall");
                      }),
                    ),
                    Expanded(
                      child: CustomRoundedButton(
                          "SMS", Icon(Icons.sms, color: Colors.white), () {
                        launch("sms://$numberToCall");
                      }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
