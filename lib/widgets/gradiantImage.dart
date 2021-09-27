import 'package:flutter/material.dart';

class GradiantImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      decoration: BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
                Colors.pink.withOpacity(0.6),
                Colors.white.withOpacity(0.8),
              ],
              stops: [
                0.0,
                1.0
              ])),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            'assets/images/mainbg.jpg',
          ),
        ),
      ),
      height: 350.0,
    );
  }
}
