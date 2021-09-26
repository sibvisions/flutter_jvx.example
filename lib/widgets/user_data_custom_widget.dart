import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterclient/flutterclient.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserDataCustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppState appState = AppStateProvider.of(context)!.appState;

    return Scaffold(
        appBar: AppBar(
            title: Text('User Data'),
            automaticallyImplyLeading: true,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                ),
                onPressed: () {
                  Navigator.of(context).pop(OpenScreenPagePopStyle.CLOSE);
                })),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                  radius: 70,
                  backgroundImage: appState.userData!.profileImage.isNotEmpty
                      ? MemoryImage(
                          base64Decode(appState.userData!.profileImage))
                      : null,
                  child: appState.userData!.profileImage.isNotEmpty
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
                'User: ' + appState.userData!.username,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).textTheme.bodyText1!.color),
              ),
              Divider(
                height: 20,
                color: Colors.white,
              ),
              Text('Roles: ',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1!.color,
                    fontSize: 20,
                  )),
              SizedBox(height: 20),
              Text(appState.userData!.roles.join(', '),
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1!.color,
                    fontSize: 16,
                  )),
              Divider(height: 20, color: Colors.white),
            ],
          ),
        ));
  }
}
