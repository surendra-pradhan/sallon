import 'package:flutter/material.dart';
import 'package:sallon/screens/sigin_screen.dart';
import 'package:sallon/widgets/signupform.dart';
import '../widgets/gradiantImage.dart';

class SignUp extends StatelessWidget {
  static const routename = '/signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
              Navigator.of(context).pushNamedAndRemoveUntil(
                  SignInScreen.routename, (Route<dynamic> route) => false);
            },
            child: Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(bottom: 14),
              child: Text(
                'Aleready have an account ? Sign In',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          SignupForm()
        ],
      ),
    );
  }
}
