import 'package:flutter/material.dart';
import 'package:jvx_flutterclient/utils/globals.dart' as globals;

class CustomRoundedButton extends StatelessWidget {
  final Function onTapFunction;
  final String buttonText;
  final Icon buttonIcon;

  CustomRoundedButton(this.buttonText, this.buttonIcon, this.onTapFunction);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size(56, 56),
      child: ClipOval(
        child: Material(
          color: globals.applicationStyle.themeColor, 
          child: InkWell(
            splashColor: Colors.orange, 
            onTap: onTapFunction, 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buttonIcon, 
                Text(buttonText, style: TextStyle(color: Colors.white),), 
              ],
            ),
          ),
        ),
      ),
    );
  }
}