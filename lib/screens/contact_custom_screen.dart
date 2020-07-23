import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterclient_example/widgets/custom_rounded_button.dart';
import 'package:jvx_flutterclient/custom_screen/custom_screen.dart';
import 'package:jvx_flutterclient/model/api/request/request.dart';
import 'package:jvx_flutterclient/model/api/response/response_data.dart';
import 'package:jvx_flutterclient/ui/component/i_component.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:jvx_flutterclient/ui/component/co_custom_component.dart';
import 'package:jvx_flutterclient/ui/container/co_panel.dart';
import 'package:jvx_flutterclient/ui/screen/so_component_creator.dart';
import 'package:jvx_flutterclient/utils/data_api.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactCustomScreen extends CustomScreen {
  ContactCustomScreen(SoComponentCreator componentCreator)
      : super(componentCreator);

  @override
  Widget getWidget() {
    DataApi dataApi = getDataApi('JVxMobileDemo/Con-CG/contacts#4');
    dynamic phone = dataApi.getValue('PHONE');

    CoCustomComponent contactComp = new CoCustomComponent(
      GlobalKey(debugLabel: 'contact'),
      componentScreen.context,
    );
    contactComp.widget = Center(
      child: Container(
        width: 300,
        height: 100,
        child: Row(
          children: <Widget>[
            Expanded(
              child: CustomRoundedButton(
                  "Call", Icon(Icons.call, color: Colors.white), () {
                phone = dataApi.getValue("PHONE");
                launch("tel://$phone");
              }),
            ),
            SizedBox(width: 10),
            Expanded(
              child: CustomRoundedButton(
                  "SMS", Icon(Icons.sms, color: Colors.white), () {
                phone = dataApi.getValue("PHONE");
                launch("sms://$phone");
              }),
            ),
            SizedBox(width: 10),
            Expanded(
              child: CustomRoundedButton("WhatsApp",
                  Icon(FontAwesomeIcons.whatsapp, color: Colors.white), () {
                phone = dataApi.getValue("PHONE");
                if (!Platform.isIOS) {
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

    CoPanel comp = this.componentScreen.getComponentFromName('contactPanel');
    this.componentScreen.replaceComponent(comp, contactComp);

    IComponent component = this.componentScreen.getRootComponent();
    if (component != null) {
      return component.getWidget();
    } else {
      return Container(
        alignment: Alignment.center,
        child: Text('No root component defined'),
      );
    }
  }

  @override
  void update(Request request, ResponseData responeData) {
    componentScreen.updateData(request, responeData);
    if (responeData.screenGeneric != null)
      componentScreen
          .updateComponents(responeData.screenGeneric.changedComponents);
  }

  @override
  bool withServer() {
    return true;
  }
}
