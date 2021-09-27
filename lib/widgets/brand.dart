import 'package:flutter/material.dart';

class Brands extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Brand We use",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Wrap(
              spacing: 3.0,
              runSpacing: 2.0,
              children: [
                Image.asset(
                  'assets/images/brand1.png',
                  width: 150,
                ),
                Image.asset(
                  'assets/images/brand2.png',
                  width: 150,
                ),
                SizedBox(
                  height: 70,
                ),
                Image.asset(
                  'assets/images/brand3.png',
                  width: 100,
                ),
                Image.asset(
                  'assets/images/brand4.png',
                  width: 110,
                ),
                Image.asset(
                  'assets/images/brand5.png',
                  width: 100,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
