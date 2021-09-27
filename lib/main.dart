import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sallon/providers/userdata.dart';
import 'package:sallon/screens/addcard.dart';
import 'package:sallon/screens/paymentScreen.dart';
import 'package:sallon/screens/profilesetting_screen.dart';
import '../providers/auth.dart';
import '../screens/cartScreen.dart';
import '../screens/overview_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/sigin_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/spalshscreen.dart';
import '../screens/tabscreen.dart';

Map<int, Color> color = {
  50: Color.fromRGBO(51, 153, 255, .1),
  100: Color.fromRGBO(51, 153, 255, .2),
  200: Color.fromRGBO(51, 153, 255, .3),
  300: Color.fromRGBO(51, 153, 255, .4),
  400: Color.fromRGBO(51, 153, 255, .5),
  500: Color.fromRGBO(51, 153, 255, .6),
  600: Color.fromRGBO(51, 153, 255, .7),
  700: Color.fromRGBO(51, 153, 255, .8),
  800: Color.fromRGBO(51, 153, 255, .9),
  900: Color.fromRGBO(51, 153, 255, 1),
};
void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
        ChangeNotifierProvider.value(value: Userdata())
      ],
      child: Consumer<Auth>(
        builder: (ctx, authdata, _) => MaterialApp(
          theme: ThemeData(
            primarySwatch: MaterialColor(0xFFE91E63, color),
            accentColor: MaterialColor(0xFFF50057, color),
          ),
          home: authdata.authenticate
              ? TabScreen()
              : FutureBuilder(
                  future: authdata.autoLogin(),
                  builder: (ctx, authresultsnapshot) =>
                      authresultsnapshot.connectionState ==
                              ConnectionState.waiting
                          ? SplashScreen()
                          : SignInScreen(),
                ),
          // home: TabScreen(),
          // initialRoute: '/',
          routes: {
            // '/': (ctx) => TabScreen(),
            OverviewScreen.routename: (ctx) => OverviewScreen(),
            SignInScreen.routename: (ctx) => SignInScreen(),
            SignUp.routename: (ctx) => SignUp(),
            ProfileScreen.routName: (ctx) => ProfileScreen(),
            CartScreen.routerName: (ctx) => CartScreen(),
            PaymentScreen.routerName: (ctx) => PaymentScreen(),
            ProfileSetting.routerName: (ctx) => ProfileSetting(),
            AddCard.routerName: (ctx) => AddCard()
          },
        ),
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text("Sallon"),
//       // ),
//       body: SignUp(),
//     );
//   }
// }
