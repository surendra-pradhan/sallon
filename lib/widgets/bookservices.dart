import 'package:flutter/material.dart';

class BookServices extends StatelessWidget {
  Widget _contentCard(String image, String tittle, String subtitle) {
    return Expanded(
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                child: Image.asset(image)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
              child: Text(
                tittle,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 2, bottom: 8),
              child: Text(
                subtitle,
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Servicess for You",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _contentCard('assets/images/service1.jpg',
                    "Female Beauty Services", "By Female Beautician"),
                _contentCard('assets/images/service2.jpg',
                    "Female Hair Services", "By Female Beautician"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _contentCard('assets/images/service3.jpg',
                    "Female Facial Services", "By Female Beautician"),
                _contentCard('assets/images/service4.jpg',
                    "Male Beauty Services", "By Male Beautician"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
