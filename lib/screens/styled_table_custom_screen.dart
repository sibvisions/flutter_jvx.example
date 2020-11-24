import 'package:flutter/material.dart';
import 'package:flutterclient_example/widgets/styled_table_custom_widget.dart';
import 'package:jvx_flutterclient/core/models/api/request.dart';
import 'package:jvx_flutterclient/core/models/api/response.dart';
import 'package:jvx_flutterclient/core/models/api/response/response_data.dart';
import 'package:jvx_flutterclient/core/ui/screen/so_component_creator.dart';
import 'package:jvx_flutterclient/features/custom_screen/ui/screen/custom_screen.dart';

class StyledTableCustomScreen extends CustomScreen {
  final List<Contact> contacts = <Contact>[];

  StyledTableCustomScreen(String componentId, String templateName,
      SoComponentCreator componentCreator)
      : super(templateName,
            componentId: componentId, creator: componentCreator);

  @override
  void update(Response response) {
    super.update(response);
    if (response.responseData != null &&
        response.responseData.dataBooks != null &&
        response.responseData.dataBooks.length > 0) {
      for (int i = 0;
          i < response.responseData.dataBooks[0].records.length;
          i++) {
        contacts.add(
            Contact.fromJson(response.responseData.dataBooks[0].records[i]));
      }
    }
  }

  @override
  bool withServer() {
    return true;
  }

  @override
  Widget getWidget(BuildContext context) {
    return StyledTableCustomWidget(contacts: contacts);
  }
}

class Contact {
  int id;
  String firstname;
  String lastname;
  String image;
  String street;
  String streetNr;
  String zip;
  String town;

  Contact(this.id, this.firstname, this.lastname, this.image, this.street,
      this.streetNr, this.zip, this.town);

  Contact.fromJson(List json)
      : id = json[0],
        firstname = json[5],
        lastname = json[6],
        street = json[7],
        streetNr = json[8],
        zip = json[9],
        town = json[10],
        image = json[18];
}
