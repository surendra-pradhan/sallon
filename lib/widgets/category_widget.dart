import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  Widget _categoryItem(String image, String iconname) {
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        Image.asset(
          image,
          height: 50,
        ),
        SizedBox(
          height: 7,
        ),
        Text(
          iconname,
          style: TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Our Category",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _categoryItem('assets/images/all.png', "All"),
                _categoryItem('assets/images/hair.png', "Hair"),
                _categoryItem('assets/images/makeup.png', "Make up"),
                _categoryItem('assets/images/spa.png', "Spa"),
                _categoryItem('assets/images/facial.png', "Facial")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
