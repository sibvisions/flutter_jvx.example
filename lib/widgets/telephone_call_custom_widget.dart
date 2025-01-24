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

  @override
  void initState() {
    super.initState();
    
    textController.addListener(() {
      if (textController.text.isNotEmpty) {
        if (!textController.text.startsWith("+")) {
          textController.text = "+43 ${textController.text}";
          setState(() {});
        }
        else if (textController.text == "+43 " || textController.text == "+43") {
          textController.text = "";
          setState(() {});
        }
      }
    });
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
                    style: const TextStyle(color: Colors.black),
                    keyboardType: TextInputType.phone,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      prefix: Container(padding: const EdgeInsets.only(right: 5), child: Icon( Icons.call, size: 11, color: Colors.grey.shade800)),
                      hintText: "+43",
                      labelText: "Enter telephone number",
                      labelStyle: TextStyle(color: Colors.grey.shade800),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade800),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade800),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade800),
                      ),
                    ),
                    onChanged: (value) {

                      if (value.length == 1) {
                        value = "+32";
                      }

                      setState(() {});
                    }
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: CustomRoundedButton(
                          color: Colors.white,
                          text: const Text("Call"),
                          icon: const Icon(Icons.call),
                          onTap: textController.text.isNotEmpty
                              ? () => launchUrl(Uri.parse("tel://${_formatTelnr()}"))
                              : null,
                        ),
                      ),
                      Expanded(
                        child: CustomRoundedButton(
                          color: Colors.white,
                          text: const Text("SMS",),
                          icon: const Icon(Icons.sms),
                          onTap: textController.text.isNotEmpty
                              ? () => launchUrl(Uri.parse("sms://${_formatTelnr()}"))
                              : null,
                        ),
                      ),
                      Expanded(
                        child: CustomRoundedButton(
                          color: Colors.white,
                          text: const Text("WhatsApp"),
                          icon: const Icon(FontAwesomeIcons.whatsapp),
                          onTap: textController.text.isNotEmpty ? () => _launchWhatsApp() : null,
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

  String _formatTelnr() {
    String text = textController.text;
    if (text.startsWith("00")) {
      text.replaceFirst("00", "+");
    }
//    text.replaceAll(from, replace)


    return text;
  }

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
}
