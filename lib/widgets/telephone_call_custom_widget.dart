import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'custom_rounded_button.dart';

class TelephoneCallCustomWidget extends StatelessWidget {
  const TelephoneCallCustomWidget({super.key});

  Future<void> _launchWhatsApp(String numberToCall, String text) async {
    String number = numberToCall;

    if (number.startsWith("0")) {
      number = number.replaceFirst("0", "43");
    }

    if (Platform.isIOS || Platform.isAndroid) {
      await launchUrl(Uri.parse("whatsapp://send?phone=$number&text=${Uri.parse(text)}"));
    } else {
      await launchUrl(Uri.parse("https://wa.me/$number/?text=${Uri.parse(text)}"));
    }
  }

  @override
  Widget build(BuildContext context) {
    String numberToCall = "";

    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(),
        ),
        Expanded(
          flex: 1,
          child: Container(
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: const InputDecoration(
                        labelText: "Enter telephone number",
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
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomRoundedButton(
                              text: "Call",
                              icon: const Icon(Icons.call, color: Colors.white),
                              onTap: () {
                                launchUrl(Uri.parse("tel://$numberToCall"));
                              }),
                        ),
                        Expanded(
                          child: CustomRoundedButton(
                              text: "SMS",
                              icon: const Icon(Icons.sms, color: Colors.white),
                              onTap: () {
                                launchUrl(Uri.parse("sms://$numberToCall"));
                              }),
                        ),
                        Expanded(
                          child: CustomRoundedButton(
                              text: "WhatsApp",
                              icon: const Icon(FontAwesomeIcons.whatsapp, color: Colors.white),
                              onTap: () {
                                _launchWhatsApp(numberToCall, "");
                              }),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(),
        ),
      ],
    );
  }
}
