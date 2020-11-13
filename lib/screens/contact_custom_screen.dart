import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterclient_example/widgets/custom_rounded_button.dart';
import 'package:jvx_flutterclient/core/models/api/request.dart';
import 'package:jvx_flutterclient/core/models/api/response.dart';
import 'package:jvx_flutterclient/core/models/api/response/response_data.dart';
import 'package:jvx_flutterclient/core/utils/app/listener/data_api.dart';
import 'package:jvx_flutterclient/features/custom_screen/ui/screen/custom_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactCustomScreen extends CustomScreen {
  ContactCustomScreen(String componentId, String templateName) : super(componentId, templateName);

  @override
  Widget build(BuildContext context) {
    return super.build(context);
    // DataApi dataApi = getDataApi('JVxMobileDemo/Con-CG/contacts#4');
    // dynamic phone = dataApi.getValue('PHONE');

    // String tempName = super.getTemplateName();

    // if (tempName != null && tempName == 'ContactCustomTemplate') {
    //   //Add a header and a footer when the template is ContactCustomTemplate
    //   CoCustomComponent headerLabel = new CoCustomComponent(
    //       GlobalKey(debugLabel: 'header'), this.componentScreen.context);
    //   headerLabel.widget = Container(
    //       margin: new EdgeInsets.all(20.0),
    //       child: Text('This is a custom Header',
    //           style: TextStyle(
    //               fontWeight: FontWeight.bold, color: UIData.ui_kit_color_2)));
    //   this.setHeader(headerLabel);

    //   CoCustomComponent footerLabel = new CoCustomComponent(
    //       GlobalKey(debugLabel: 'footer'), this.componentScreen.context);
    //   footerLabel.widget = Container(
    //       margin: new EdgeInsets.all(20.0),
    //       child: Text('This is a custom Footer',
    //           style: TextStyle(
    //               fontWeight: FontWeight.bold, color: UIData.ui_kit_color)));
    //   this.setFooter(footerLabel);
    // }

    // CoCustomComponent contactComp = new CoCustomComponent(
    //   GlobalKey(debugLabel: 'contact'),
    //   componentScreen.context,
    // );
    // contactComp.widget = Center(
    //   child: Container(
    //     width: 300,
    //     height: 100,
    //     child: Row(
    //       children: <Widget>[
    //         Expanded(
    //           child: CustomRoundedButton(
    //               "Call", Icon(Icons.call, color: Colors.white), () {
    //             phone = dataApi.getValue("PHONE");
    //             launch("tel://$phone");
    //           }),
    //         ),
    //         SizedBox(width: 10),
    //         Expanded(
    //           child: CustomRoundedButton(
    //               "SMS", Icon(Icons.sms, color: Colors.white), () {
    //             phone = dataApi.getValue("PHONE");
    //             launch("sms://$phone");
    //           }),
    //         ),
    //         SizedBox(width: 10),
    //         Expanded(
    //           child: CustomRoundedButton("WhatsApp",
    //               Icon(FontAwesomeIcons.whatsapp, color: Colors.white), () {
    //             phone = dataApi.getValue("PHONE");

    //             if (phone.startsWith('0')) {
    //               phone = phone.replaceFirst('0', '43');
    //             }

    //             if (Platform.isIOS || Platform.isAndroid) {
    //               launch("whatsapp://send?phone=$phone&text=");
    //             } else {
    //               launch("whatsapp://wa.me/$phone/?text=");
    //             }
    //           }),
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    // CoPanel comp = this.componentScreen.getComponentFromName('contactPanel');
    // this.componentScreen.replaceComponent(comp, contactComp);

    // IComponent component = this.componentScreen.getRootComponent();
    // if (component != null) {
    //   return component.getWidget();
    // } else {
    //   return Container(
    //     alignment: Alignment.center,
    //     child: Text('No root component defined'),
    //   );
    // }
  }

  @override
  Widget getWidget() {}

  @override
  void update(Response response) {
    super.update(response);
  }

  @override
  bool withServer() {
    return true;
  }
}
