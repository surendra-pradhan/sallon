import 'package:flutter/material.dart';
import 'package:sallon/screens/signup_screen.dart';
import '../widgets/gradiantImage.dart';
import '../widgets/signin_form.dart';

class SignInScreen extends StatelessWidget {
  static const routename = '/signin';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        BackgroundImage(),
        GradiantImage(),
        Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 80),
          child: Image(
            width: 120,
            image: AssetImage('assets/images/logo.png'),
            fit: BoxFit.cover,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(SignUp.routename);
          },
          child: Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 14),
            child: Text(
              'Don\'t have an account? Sign up',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        Sigin(),
      ]),
    );
  }
}
