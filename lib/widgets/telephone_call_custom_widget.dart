import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterclient/flutterclient.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_rounded_button.dart';

class TelephoneCallCustomWidget extends StatelessWidget {
  _launchWhatsApp(String numberToCall, String text) async {
    String number = numberToCall;

    if (number.startsWith('0')) {
      number = number.replaceFirst('0', '43');
    }

    if (Platform.isIOS || Platform.isAndroid) {
      await launch("whatsapp://send?phone=$number&text=${Uri.parse(text)}");
    } else {
      await launch('https://wa.me/$number/?text=${Uri.parse(text)}');
    }
  }

  @override
  Widget build(BuildContext context) {
    String numberToCall = '';

    return Scaffold(
      appBar: AppBar(
          title: Text('Telephone Call'),
          automaticallyImplyLeading: true,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.of(context).pop(OpenScreenPagePopStyle.CLOSE);
              })),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(15),
          height: 150,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
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
                    Expanded(
                      child: CustomRoundedButton("WhatsApp",
                          Icon(FontAwesomeIcons.whatsapp, color: Colors.white),
                          () {
                        _launchWhatsApp(numberToCall, "");
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
