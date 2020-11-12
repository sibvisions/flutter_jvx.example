import 'package:flutter/material.dart';
import 'package:jvx_flutterclient/core/models/api/request.dart';
import 'package:jvx_flutterclient/core/models/api/response/response_data.dart';
import 'package:jvx_flutterclient/features/custom_screen/ui/screen/custom_screen.dart';

import '../widgets/user_data_custom_widget.dart';

class UserDataCustomScreen extends CustomScreen {
  UserDataCustomScreen(String templateName) : super(templateName);

  @override
  void update(Request request, ResponseData data) {}

  @override
  Widget build(BuildContext context) {
    return UserDataCustomWidget();
  }
}
