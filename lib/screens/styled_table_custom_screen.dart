import 'package:flutter/material.dart';
import 'package:flutterclient_example/widgets/styled_table_custom_widget.dart';
import 'package:jvx_flutterclient/custom_screen/custom_screen.dart';
import 'package:jvx_flutterclient/model/api/request/request.dart';
import 'package:jvx_flutterclient/model/api/response/response_data.dart';
import 'package:jvx_flutterclient/ui/screen/component_creator.dart';

class StyledTableCustomScreen extends CustomScreen {
  List<Contact> contacts = <Contact>[];

  StyledTableCustomScreen(ComponentCreator componentCreator) : super(componentCreator);

  @override
  Widget getWidget() {
    return StyledTableCustomWidget(contacts: contacts,);
  }

  @override
  void update(Request request, ResponseData responeData) {
    if (responeData != null && responeData.jVxData!=null && responeData.jVxData.length > 0) {
      for (int i = 0; i <= 3; i++) {
        contacts.add(Contact.fromJson(responeData.jVxData[0].records[i]));
      }
    }
  }
  
  @override
  bool withServer() {
    return true;
  }
}

class Contact {
  int id;
  String firstname;
  String lastname;
  String image;

  Contact(this.id, this.firstname, this.lastname, this.image);

  Contact.fromJson(List json)
    : id = json[0],
      firstname = json[5],
      lastname = json[6],
      image = json[18];
}