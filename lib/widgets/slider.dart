import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final imgList = [
  'assets/images/bg1.jpg',
  'assets/images/bg2.jpg',
  'assets/images/bg3.jpg'
];

class SliderCourosol extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: double.infinity,
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 700),
            autoPlayCurve: Curves.fastOutSlowIn,
            viewportFraction: 1,
          ),
          items: imgList
              .map(
                (item) => Container(
                  width: double.infinity,
                  child: Image.asset(
                    item,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
