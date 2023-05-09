import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_jvx/flutter_jvx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/custom_rounded_button.dart';

class CustomHeaderAndFooterWidget extends StatelessWidget implements PreferredSizeWidget {
  final String text;

  const CustomHeaderAndFooterWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20.0),
        child: Text(text, style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)));
  }

  @override
  Size get preferredSize => const Size(100, 70);
}

class CoCustomComponentWidget extends StatefulWidget {
  const CoCustomComponentWidget({super.key});

  @override
  State<CoCustomComponentWidget> createState() => _CoCustomComponentWidgetState();
}

class _CoCustomComponentWidgetState extends State<CoCustomComponentWidget> {
  static const String CONTACT_DATA_PROVIDER = "JVxMobileDemo/Con-CG/contacts#4";
  static const String COLUMN_NAME_PHONE = "PHONE";

  String phone = "";

  @override
  void initState() {
    super.initState();
    IUiService().registerDataSubscription(
      pDataSubscription: DataSubscription(
        subbedObj: this,
        dataProvider: CONTACT_DATA_PROVIDER,
        dataColumns: [COLUMN_NAME_PHONE],
        onSelectedRecord: (DataRecord? dataRecord) {
          phone = dataRecord?.values[0] ?? "";
          setState(() {});
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 100,
        child: Row(
          children: [
            Expanded(
              child: CustomRoundedButton(
                text: const Text("Call"),
                icon: const Icon(Icons.call),
                onTap: () {
                  if (phone.isNotEmpty) {
                    launchUrl(Uri.parse("tel://$phone"));
                  }
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: CustomRoundedButton(
                text: const Text("SMS"),
                icon: const Icon(Icons.sms),
                onTap: () {
                  if (phone.isNotEmpty) {
                    launchUrl(Uri.parse("sms://$phone"));
                  }
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: CustomRoundedButton(
                text: const Text("WhatsApp"),
                icon: const Icon(FontAwesomeIcons.whatsapp),
                onTap: () {
                  if (phone.isNotEmpty) {
                    if (phone.startsWith("0")) {
                      phone = phone.replaceFirst("0", "43");
                    }

                    if (Platform.isIOS || Platform.isAndroid) {
                      launchUrl(Uri.parse("whatsapp://send?phone=$phone&text="));
                    } else {
                      launchUrl(Uri.parse("whatsapp://wa.me/$phone/?text="));
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    IUiService().disposeDataSubscription(pSubscriber: this);
    super.dispose();
  }
}
