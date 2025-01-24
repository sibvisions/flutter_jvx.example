import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomPopup extends StatelessWidget {
  const CustomPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(180),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          padding: const EdgeInsets.all(5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNameAndLocation(),
            ],
          ),
        ),
      ],
    );
  }

  Expanded _buildNameAndLocation() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 6.0, top: 8, right: 6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                    Text(
                  "SIB Visions GmbH",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(onTap: launch,
                  child: const Text("https://www.sibvisions.com",
                                style: TextStyle(color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.blueAccent),
                              ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void launch() async {
    await launchUrl(Uri.parse("https://www.sibvisions.com"));
  }
}
