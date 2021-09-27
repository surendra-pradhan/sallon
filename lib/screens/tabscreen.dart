import 'package:flutter/material.dart';
import 'package:sallon/screens/cartScreen.dart';
//
import 'package:sallon/screens/overview_screen.dart';
import 'package:sallon/screens/profile_screen.dart';
import 'package:flutter/services.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:motion_tab_bar/motiontabbar.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> with TickerProviderStateMixin {
  final List _pages = [
    {'page': ProfileScreen(), 'title': 'Profile'},
    {'page': OverviewScreen(), 'title': 'Home'},
    {'page': CartScreen(), 'title': 'Cart'}
  ];
  MotionTabController _tabController;
  int _selectedPageIndex = 1;
  @override
  void initState() {
    super.initState();
    _tabController = MotionTabController(initialIndex: 1, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MotionTabBar(
        labels: ["Profile", "Home", "Cart"],
        initialSelectedTab: "Home",
        tabIconColor: Colors.amber,
        tabSelectedColor: Colors.red,
        onTabItemSelected: (int value) {
          setState(() {
            _tabController.index = _selectedPageIndex;
            _selectedPageIndex = value;
          });
        },
        icons: [Icons.account_circle, Icons.home, Icons.shopping_cart],
        textStyle: TextStyle(color: Colors.red),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light
            .copyWith(statusBarColor: Theme.of(context).primaryColor),
        child: SafeArea(
          child: _pages[_selectedPageIndex]['page'],
        ),
      ),
    );
  }
}
