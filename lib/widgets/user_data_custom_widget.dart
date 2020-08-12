import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jvx_flutterclient/ui/page/menu_page.dart';
import 'package:jvx_flutterclient/ui/widgets/menu_drawer_widget.dart';
import 'package:jvx_flutterclient/utils/globals.dart' as globals;
import 'package:jvx_flutterclient/jvx_flutterclient.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserDataCustomWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
            backgroundColor: UIData.ui_kit_color,
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
                    title: Text('User Data'),
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
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                      radius: 70,
                      backgroundImage: globals.profileImage.isNotEmpty
                          ? MemoryImage(base64Decode(globals.profileImage))
                          : null,
                      child: globals.profileImage.isNotEmpty
                          ? null
                          : Icon(
                              FontAwesomeIcons.userTie,
                              color: UIData.ui_kit_color_2,
                              size: 60,
                            )),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'User: ' + globals.username,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: UIData.textColor),
                  ),
                  Divider(
                    height: 20,
                    color: Colors.white,
                  ),
                  Text('Roles: ',
                      style: TextStyle(
                        color: UIData.textColor,
                        fontSize: 20,
                      )),
                  SizedBox(height: 20),
                  Text(globals.roles.join(', '),
                      style: TextStyle(
                        color: UIData.textColor,
                        fontSize: 16,
                      )),
                  Divider(height: 20, color: Colors.white),
                ],
              ),
            )));
  }
}
