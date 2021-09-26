import 'package:flutter/material.dart';
import 'package:flutterclient/flutterclient.dart';
import '../widgets/user_data_custom_widget.dart';

class UserDataCustomScreen extends CustomScreen {
  UserDataCustomScreen(
      {Key? key,
      required SoScreenConfiguration configuration,
      required SoComponentCreator creator})
      : super(key: key, configuration: configuration, creator: creator);

  @override
  UserDataCustomScreenState createState() => UserDataCustomScreenState();
}

class UserDataCustomScreenState extends CustomScreenState {
  @override
  Widget build(BuildContext context) {
    return UserDataCustomWidget();
  }
}
