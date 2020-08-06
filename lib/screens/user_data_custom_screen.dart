import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jvx_flutterclient/custom_screen/custom_screen.dart';
import 'package:jvx_flutterclient/jvx_flutterclient.dart';
import 'package:jvx_flutterclient/model/api/request/request.dart';
import 'package:jvx_flutterclient/model/api/response/response_data.dart';
import 'package:jvx_flutterclient/ui/screen/so_component_creator.dart';
import 'package:jvx_flutterclient/utils/globals.dart' as globals;

class UserDataCustomScreen extends CustomScreen {
  UserDataCustomScreen(SoComponentCreator componentCreator)
      : super(componentCreator);

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget getWidget() {
    return Scaffold(
        backgroundColor: UIData.ui_kit_color,
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('User Data'),
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
              Text(globals.roles.join(', '), style: TextStyle(
                    color: UIData.textColor,
                    fontSize: 16,
                  )),
              Divider(height: 20, color: Colors.white),
            ],
          ),
        ));
  }

  @override
  void update(Request request, ResponseData responeData) {}

  @override
  bool withServer() {
    return false;
  }
}
