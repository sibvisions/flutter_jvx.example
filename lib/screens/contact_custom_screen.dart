import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterclient/flutterclient.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/custom_rounded_button.dart';

class ContactCustomScreen extends CustomScreen {
  ContactCustomScreen(
      {Key? key,
      required SoScreenConfiguration configuration,
      required SoComponentCreator creator})
      : super(key: key, configuration: configuration, creator: creator);

  @override
  ContactCustomScreenState createState() => ContactCustomScreenState();
}

class ContactCustomScreenState extends CustomScreenState {
  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }

  @override
  void update(ApiResponse response) {
    super.update(response);

    String? tempName = this.getTemplateName();

    if (tempName != null && tempName == 'ContactCustomTemplate') {
      this.setHeader(CustomHeaderAndFooterWidget(
        text: 'This is a custom header',
        componentModel: ComponentModel(changedComponent: ChangedComponent())
          ..componentId = 'header'
          ..preferredSize = Size(100, 70),
      ));
      this.setFooter(CustomHeaderAndFooterWidget(
        text: 'This is a custom footer',
        componentModel: ComponentModel(changedComponent: ChangedComponent())
          ..componentId = 'footer'
          ..preferredSize = Size(100, 70),
      ));
    }

    // ToDo: uncomment
    this.replaceComponentByName(
        'contactPanel',
        CoCustomComponentWidget(
            componentModel: ComponentModel(changedComponent: ChangedComponent())
              ..componentId = 'contactPanel'));
  }
}

class CustomHeaderAndFooterWidget extends ComponentWidget {
  final String text;

  CustomHeaderAndFooterWidget(
      {required this.text, required ComponentModel componentModel})
      : super(componentModel: componentModel);

  @override
  State<StatefulWidget> createState() => CustomHeaderAndFooterWidgetState();
}

class CustomHeaderAndFooterWidgetState extends ComponentWidgetState {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: new EdgeInsets.all(20.0),
        child: Text((widget as CustomHeaderAndFooterWidget).text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor)));
  }
}

class CoCustomComponentWidget extends ComponentWidget {
  CoCustomComponentWidget({required ComponentModel componentModel})
      : super(componentModel: componentModel);

  @override
  State<StatefulWidget> createState() => CoCustomComponentWidgetState();
}

class CoCustomComponentWidgetState extends ComponentWidgetState {
  @override
  Widget build(BuildContext context) {
    SoComponentData? data = SoScreen.of(context)!
        .getComponentData('JVxMobileDemo/Con-CG/contacts#4');

    // ToDo Nur einmal
    dynamic phone = data.getColumnData(context, 'PHONE');

    return Center(
      child: Container(
        width: 300,
        height: 100,
        child: Row(
          children: <Widget>[
            Expanded(
              child: CustomRoundedButton(
                  "Call", Icon(Icons.call, color: Colors.white), () {
                phone = data.getColumnData(context, 'PHONE');
                launch("tel://$phone");
              }),
            ),
            SizedBox(width: 10),
            Expanded(
              child: CustomRoundedButton(
                  "SMS", Icon(Icons.sms, color: Colors.white), () {
                phone = data.getColumnData(context, 'PHONE');
                launch("sms://$phone");
              }),
            ),
            SizedBox(width: 10),
            Expanded(
              child: CustomRoundedButton("WhatsApp",
                  Icon(FontAwesomeIcons.whatsapp, color: Colors.white), () {
                phone = data.getColumnData(context, 'PHONE');

                if (phone.startsWith('0')) {
                  phone = phone.replaceFirst('0', '43');
                }

                if (Platform.isIOS || Platform.isAndroid) {
                  launch("whatsapp://send?phone=$phone&text=");
                } else {
                  launch("whatsapp://wa.me/$phone/?text=");
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
