import 'package:flutter/material.dart';
import 'package:flutter_jvx/commands.dart';
import 'package:flutter_jvx/flutter_jvx.dart';
import 'package:flutter_jvx/services.dart';

/// This is an example login override with fallback logic
class ExampleLogin extends DefaultLogin {
  const ExampleLogin({super.key, required super.mode});

  @override
  Widget buildCard(BuildContext context, LoginMode? mode) {
    if (mode == LoginMode.MFWait) {
      return Column(
        children: [
          Text(
            "Not supported.",
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
          TextButton(
            onPressed: () => IUiService().routeToLogin(mode: LoginMode.Manual),
            child: Text(
              FlutterJVx.translate("Back"),
            ),
          )
        ],
      );
    }
    return super.buildCard(context, mode);
  }
}
