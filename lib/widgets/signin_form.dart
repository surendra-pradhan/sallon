import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sallon/models/httpexception.dart';
import 'package:sallon/providers/auth.dart';

class Sigin extends StatefulWidget {
  @override
  _SiginState createState() => _SiginState();
}

class _SiginState extends State<Sigin> {
  final passwordFocusNode = FocusNode();
  bool _isLoading = false;
  @override
  void dispose() {
    passwordFocusNode.dispose();
    super.dispose();
  }

  Map<String, String> _signInData = {'username': '', 'password': ''};

  final _form = GlobalKey<FormState>();

  void _showdialouge(String errormsg) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Ocoured'),
        content: Text(errormsg),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Okay'))
        ],
      ),
    );
  }

  Future<void> _onSubmited() async {
    final _isValidate = _form.currentState.validate();
    if (!_isValidate) {
      return;
    }
    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<Auth>(context, listen: false)
          .signin(_signInData['username'], _signInData['password']);
    } on HttpException catch (error) {
      print(error);
      var errorMessage = 'Authentication Failed!';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This Email Address Already used!';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = "This is not valid Email Address";
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = "This password is too weak";
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = "This Email Is Not Found";
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = "Invalid Password";
      }
      _showdialouge(errorMessage);
    } catch (error) {
      var errorMessage = 'Could not authenticate you; Please try again!';
      _showdialouge(errorMessage);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        top: 220,
        left: 20,
        right: 20,
      ),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 18),
          child: Form(
            key: _form,
            child: ListView(
              children: [
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(labelText: "Enter UserName"),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(passwordFocusNode);
                  },
                  onSaved: (val) => {
                    _signInData = {
                      'username': val,
                      'password': _signInData['password']
                    }
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'field Should not be empty';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(labelText: "Enter Password"),
                  obscureText: true,
                  focusNode: passwordFocusNode,
                  onSaved: (val) => {
                    _signInData = {
                      'username': _signInData['username'],
                      'password': val
                    },
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'field Should not be empty';
                    } else if (value.length < 6) {
                      return 'password Should be 6 letter long';
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) => _onSubmited(),
                ),
                SizedBox(
                  height: 30,
                ),
                _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _onSubmited,
                          child: Text(
                            "SIGN IN",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Forgot your Password?",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[600], fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
