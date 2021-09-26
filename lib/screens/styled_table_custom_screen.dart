// import 'package:flutter/material.dart';
// import 'package:flutterclient/flutterclient.dart';
// import 'package:flutterclient_example/widgets/styled_table_custom_widget.dart';

// class StyledTableCustomScreen extends CustomScreen {
//   StyledTableCustomScreen(
//       {Key? key,
//       required SoScreenConfiguration configuration,
//       required SoComponentCreator creator})
//       : super(key: key, configuration: configuration, creator: creator);

//   @override
//   StyledTableCustomScreenState createState() => StyledTableCustomScreenState();
// }

// class StyledTableCustomScreenState extends CustomScreenState {
//   List<Contact> contacts = <Contact>[];

//   @override
//   Widget build(BuildContext context) {
//     return StyledTableCustomWidget(contacts: contacts);
//   }

//   @override
//   void onResponse(ApiResponse response) {
//     super.onResponse(response);
//     if (response.responseData != null &&
//         response.responseData.dataBooks != null &&
//         response.responseData.dataBooks.length > 0) {
//       for (int i = 0;
//           i < response.responseData.dataBooks[0].records.length;
//           i++) {
//         contacts.add(
//             Contact.fromJson(response.responseData.dataBooks[0].records[i]));
//       }
//     }
//   }
// }

// class Contact {
//   int id;
//   String firstname;
//   String lastname;
//   String image;
//   String street;
//   String streetNr;
//   String zip;
//   String town;

//   Contact(this.id, this.firstname, this.lastname, this.image, this.street,
//       this.streetNr, this.zip, this.town);

//   Contact.fromJson(List json)
//       : id = json[0],
//         firstname = json[5],
//         lastname = json[6],
//         street = json[7],
//         streetNr = json[8],
//         zip = json[9],
//         town = json[10],
//         image = json[18];
// }
