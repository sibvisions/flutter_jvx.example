import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jvx_flutterclient/model/menu_item.dart';
import 'package:jvx_flutterclient/ui/widgets/menu_drawer_widget.dart';
import 'package:jvx_flutterclient/utils/globals.dart' as globals;
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                        onPressed: () =>
                            _scaffoldKey.currentState.openEndDrawer(),
                      )
                    ],),
      endDrawer: MenuDrawerWidget(
                    menuItems: globals.items,
                    listMenuItems: true,
                    currentTitle: 'Telephone Call',
                    groupedMenuMode: true),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter telephone number'
                ),
                onChanged: (String change) => numberToCall = change,
              ),
            ),
            RaisedButton(
              child: Text('Make call'),
              onPressed: () {
                launch("tel://$numberToCall"); 
              },
            )
          ],
        ),
      ),
    );
  }
}