import 'package:flutter/material.dart';

class Banners extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'assets/images/banner1.png',
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
