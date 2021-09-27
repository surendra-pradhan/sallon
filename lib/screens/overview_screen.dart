import 'package:flutter/material.dart';
import 'package:sallon/screens/bottomScreen.dart';
import 'package:sallon/screens/draw_screen.dart';
import 'package:sallon/widgets/bookservices.dart';
import 'package:sallon/widgets/brand.dart';
import 'package:sallon/widgets/category_widget.dart';
import 'package:sallon/widgets/slider.dart';
import '../widgets/banner.dart';

class OverviewScreen extends StatefulWidget {
  static const routename = '/homeScreen';

  @override
  _OverviewScreenState createState() => _OverviewScreenState();
}

var scaffoldKey = GlobalKey<ScaffoldState>();

class _OverviewScreenState extends State<OverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: DrawScreen(),
      body: ListView(shrinkWrap: true, children: [
        Stack(
          children: [
            SliderCourosol(),
            Positioned(
              left: 10,
              top: 5,
              child: IconButton(
                color: Colors.pink,
                icon: Icon(
                  Icons.menu,
                  size: 30,
                ),
                onPressed: () => scaffoldKey.currentState.openDrawer(),
              ),
            ),
          ],
        ),
        Category(),
        Banners(),
        BookServices(),
        Brands(),
        Divider(),
        BottomScreen()
      ]),
    );
  }
}
