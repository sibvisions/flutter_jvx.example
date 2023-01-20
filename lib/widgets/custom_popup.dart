import 'package:flutter/material.dart';

class CustomPopup extends StatelessWidget {
  const CustomPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      width: 279.0,
      height: 121.0,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            margin: const EdgeInsets.only(top: 40.0),
            padding: const EdgeInsets.all(5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildNameAndLocation(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildNameAndLocation() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 6.0, top: 8, right: 6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.work,
                  color: Colors.grey,
                  size: 20.0,
                ),
                SizedBox(width: 5),
                Expanded(
                    child: Text(
                  "SIB Visions GmbH",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: const [
                Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 15.0,
                ),
                Text(
                  "Wehlistraße 29 / Stiege 1 / 2. Stock",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
