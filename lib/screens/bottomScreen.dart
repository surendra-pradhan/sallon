import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FaIcon(
                FontAwesomeIcons.facebook,
              ),
              FaIcon(FontAwesomeIcons.instagram),
              FaIcon(FontAwesomeIcons.twitter),
              FaIcon(FontAwesomeIcons.google)
            ],
          )),
    );
  }
}
