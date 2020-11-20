import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jvx_flutterclient/core/models/app/app_state.dart';
import 'package:jvx_flutterclient/core/models/app/menu_arguments.dart';
import 'package:jvx_flutterclient/core/ui/widgets/menu/menu_drawer_widget.dart';
import 'package:jvx_flutterclient/core/ui/widgets/util/app_state_provider.dart';

class UserDataCustomWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    AppState appState = AppStateProvider.of(context).appState;

    return WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pushReplacementNamed('/menu',
              arguments: MenuArguments(appState.items, true, null));
          return false;
        },
        child: Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            key: _scaffoldKey,
            appBar: appState.appFrame.showScreenHeader
                ? AppBar(
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/menu',
                            arguments:
                                MenuArguments(appState.items, true, null));
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
                appState: appState,
                menuItems: appState.items,
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
                      backgroundImage: appState.profileImage != null && appState.profileImage.isNotEmpty
                          ? MemoryImage(base64Decode(appState.profileImage))
                          : null,
                      child: appState.profileImage != null && appState.profileImage.isNotEmpty
                          ? null
                          : Icon(
                              FontAwesomeIcons.userTie,
                              color: Theme.of(context).primaryColor,
                              size: 60,
                            )),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'User: ' + appState.username,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).textTheme.bodyText1.color),
                  ),
                  Divider(
                    height: 20,
                    color: Colors.white,
                  ),
                  Text('Roles: ',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1.color,
                        fontSize: 20,
                      )),
                  SizedBox(height: 20),
                  Text(appState.roles.join(', '),
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1.color,
                        fontSize: 16,
                      )),
                  Divider(height: 20, color: Colors.white),
                ],
              ),
            )));
  }
}
