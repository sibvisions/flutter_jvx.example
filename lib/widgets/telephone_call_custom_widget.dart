import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'custom_rounded_button.dart';

class TelephoneCallCustomWidget extends StatefulWidget {
  const TelephoneCallCustomWidget({super.key});

  @override
  State<TelephoneCallCustomWidget> createState() => _TelephoneCallCustomWidgetState();
}

class _TelephoneCallCustomWidgetState extends State<TelephoneCallCustomWidget> {
  final TextEditingController textController = TextEditingController();

  Future<void> _launchWhatsApp(String number, String message) async {
    if (number.startsWith("0")) {
      number = number.replaceFirst("0", "43");
    }

    try {
      if (Platform.isIOS || Platform.isAndroid) {
        await launchUrl(Uri.parse("whatsapp://send?phone=$number&text=${Uri.parse(message)}"));
      } else {
        await launchUrl(Uri.parse("https://wa.me/$number/?text=${Uri.parse(message)}"));
      }
    } catch (e, stack) {
      log("Failed to launch WhatsApp", error: e, stackTrace: stack);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.phone,
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
                    onChanged: (value) => setState(() {}),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: CustomRoundedButton(
                          color: Colors.white,
                          text: const Text(
                            "Call",
                            style: TextStyle(color: Colors.black),
                          ),
                          icon: const Icon(Icons.call, color: Colors.black),
                          onTap: textController.text.isNotEmpty
                              ? () => launchUrl(Uri.parse("tel://${textController.text}"))
                              : null,
                        ),
                      ),
                      Expanded(
                        child: CustomRoundedButton(
                          color: Colors.white,
                          text: const Text(
                            "SMS",
                            style: TextStyle(color: Colors.black),
                          ),
                          icon: const Icon(Icons.sms, color: Colors.black),
                          onTap: textController.text.isNotEmpty
                              ? () => launchUrl(Uri.parse("sms://${textController.text}"))
                              : null,
                        ),
                      ),
                      Expanded(
                        child: CustomRoundedButton(
                          color: Colors.white,
                          text: const Text(
                            "WhatsApp",
                            style: TextStyle(color: Colors.black),
                          ),
                          icon: const Icon(FontAwesomeIcons.whatsapp, color: Colors.black),
                          onTap: textController.text.isNotEmpty ? () => _launchWhatsApp(textController.text, "") : null,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}
