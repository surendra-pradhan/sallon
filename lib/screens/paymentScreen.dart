import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sallon/screens/addcard.dart';

final imgList = [
  'assets/images/card1.png',
  'assets/images/card2.png',
  'assets/images/card3.png'
];

class PaymentScreen extends StatelessWidget {
  static const routerName = '/paymentScreen';

  Widget paymentCrad(String iamge, double size) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          iamge,
          width: size,
        ),
        trailing: Icon(Icons.chevron_right),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add payment'),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            child: SizedBox(
              width: double.infinity,
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: false,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 700),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  viewportFraction: 0.7,
                  aspectRatio: 2,
                  initialPage: 1,
                ),
                items: imgList
                    .map(
                      (item) => Container(
                        width: double.infinity,
                        child: Image.asset(
                          item,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              paymentCrad('assets/images/pay1.png', 70),
              paymentCrad('assets/images/pay2.png', 100),
              paymentCrad('assets/images/pay3.png', 120),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed(AddCard.routerName);
              },
              label: Text("Add more Payment"),
              icon: Icon(Icons.add),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
