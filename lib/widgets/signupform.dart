import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sallon/providers/auth.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _passwordfocuse = FocusNode();
  final _cnfrmpassword = FocusNode();
  final _psswordctrl = TextEditingController();
  final _form = GlobalKey<FormState>();
  bool _isloading = false;
  Map<String, String> _authData = {'login': '', 'password': ''};

  @override
  void dispose() {
    _passwordfocuse.dispose();
    _cnfrmpassword.dispose();
    super.dispose();
  }

  Future<void> _saveForm() async {
    final _isvalidate = _form.currentState.validate();
    if (!_isvalidate) {
      return;
    }
    _form.currentState.save();
    setState(() {
      _isloading = true;
    });

    try {
      await Provider.of<Auth>(context, listen: false)
          .signup(_authData['login'], _authData['password']);
    } catch (error) {
      print(error);
    }
    setState(() {
      _isloading = false;
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
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 18),
          child: _isloading
              ? Center(child: CircularProgressIndicator())
              : Form(
                  key: _form,
                  child: ListView(
                    children: [
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Enter Username'),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_passwordfocuse);
                        },
                        onSaved: (newValue) => {
                          _authData = {
                            'login': newValue,
                            'password': _authData['password']
                          }
                        },
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'username field shouldn\'t be empty';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Enter Password'),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        focusNode: _passwordfocuse,
                        onFieldSubmitted: (_) => {
                          FocusScope.of(context).requestFocus(_cnfrmpassword)
                        },
                        controller: _psswordctrl,
                        onSaved: (newValue) => {
                          _authData = {
                            'login': _authData['login'],
                            'password': newValue
                          }
                        },
                        obscureText: true,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'password field shouldn\'t be empty';
                          } else if (val.length < 6) {
                            return 'password 6 letter longs';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Confirm password'),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        focusNode: _cnfrmpassword,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'password field shouldn\'t be empty';
                          } else if (value != _psswordctrl.text) {
                            return 'Passwords do not match!';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _saveForm,
                          child: Text(
                            "SIGN UP",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
