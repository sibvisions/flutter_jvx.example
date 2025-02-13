import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_jvx/flutter_jvx.dart';
import 'package:intl/intl.dart';

class StyledTableCustomWidget extends StatefulWidget {
  const StyledTableCustomWidget({super.key});

  @override
  State<StyledTableCustomWidget> createState() => _StyledTableCustomWidgetState();
}

class _StyledTableCustomWidgetState extends State<StyledTableCustomWidget> {

  static DateFormat dateFormat = DateFormat('ddMMyy');

  final List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();
    IUiService().registerDataSubscription(
      pDataSubscription: DataSubscription(
        subbedObj: this,
        dataProvider: "JVxMobileDemo/StyTab-2G/contacts#4",
        from: 0,
        dataColumns: [
          "ID",
          "SALU_SALUTATION",
          "ACTI_ACADEMIC_TITLE",
          "FIRSTNAME",
          "LASTNAME",
          "IMAGE",
          "STREET",
          "NR",
          "ZIP",
          "TOWN",
          "BIRTHDAY",
          "SOCIALSECNR"
        ],
        onDataChunk: (DataChunk dataChunk) {
          contacts.clear();
          for (int i = 0; i < dataChunk.data.length; i++) {
            contacts.add(Contact(
              dataChunk.data[i]![0],
              dataChunk.data[i]![1],
              dataChunk.data[i]![2],
              dataChunk.data[i]![3],
              dataChunk.data[i]![4],
              dataChunk.data[i]![5],
              dataChunk.data[i]![6],
              dataChunk.data[i]![7],
              dataChunk.data[i]![8],
              dataChunk.data[i]![9],
              dataChunk.data[i]![10],
              dataChunk.data[i]![11],
            ));
          }
          setState(() {});
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.only(left: 10, right: 10, bottom: 8 ),
                  child: Row(
                    children: [
                      Container(color: Colors.grey.shade300,
                          child:Container(
                              margin: const EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 5),
                                  padding: const EdgeInsets.all(10),
                                  child: contacts[index].image != null
                                      ? CircleAvatar(
                                          backgroundImage: MemoryImage(base64Decode(contacts[index].image!)),
                                          minRadius: 45,
                                        )
                                      : CircleAvatar(
                                          backgroundColor: Theme.of(context).colorScheme.primary,
                                          minRadius: 45,
                                          child: Text(
                                            "${contacts[index].firstname[0]}${contacts[index].lastname[0]}",
                                            style: const TextStyle(fontSize: 40, color: Colors.white),
                                          ),
                                        ),
                                )),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (contacts[index].salutation != null)
                              Text(
                                "${contacts[index].salutation}",
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .titleLarge,
                                overflow: TextOverflow.ellipsis,
                              ),
                            Text(
                              "${contacts[index].academicTitle ?? ''}${contacts[index].academicTitle != null ? '. ' : ''}${contacts[index].firstname} ${contacts[index].lastname}",
                              style: Theme.of(context).textTheme.titleLarge,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (contacts[index].socialSecNr != null && contacts[index].dob != null)
                              Text(
                                "(${dateFormat.format(contacts[index].dob!)}${contacts[index].socialSecNr})",
                                style: const TextStyle(color: Colors.grey, fontSize: 12),
                                overflow: TextOverflow.ellipsis,
                              ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(
                                  Icons.map,
                                  color: Colors.grey,
                                  size: 13.0,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    contacts[index].formatAddress(),
                                    style: const TextStyle(color: Colors.black54, fontSize: 15),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: contacts.length,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    IUiService().disposeDataSubscription(pSubscriber: this);
    super.dispose();
  }
}

class Contact {
  final int id;
  final String? salutation;
  final String? academicTitle;
  final String firstname;
  final String lastname;
  final String? image;
  final String? street;
  final String? streetNr;
  final String? zip;
  final String? town;
  final DateTime? dob;
  final int? socialSecNr;

  Contact(
    this.id,
    this.salutation,
    this.academicTitle,
    this.firstname,
    this.lastname,
    this.image,
    this.street,
    this.streetNr,
    this.zip,
    this.town,
    int? dob,
    this.socialSecNr
  ) : dob = dob != null ? DateTime.fromMillisecondsSinceEpoch(dob) : null;

  String formatAddress() {
      String? address = _concat(street, streetNr);
      address = _concat(address, zip, ", ");
      address = _concat(address, town);

      return address ?? "Address unknown";
  }

  String? _concat(String? first, String? second, [String delimiter = " "]) {
      if (first != null && second != null) {
          return "$first$delimiter$second";
      }

      if (first != null) {
          return first;
      }

      return second;
  }

}
