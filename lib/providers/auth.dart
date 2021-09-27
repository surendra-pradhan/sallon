import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sallon/models/httpexception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  String _token;
  String _userId;
  DateTime _expiryDate;
  // Timer _authTime;
  bool get authenticate {
    return token != null;
  }

  String get token {
    if (_userId != null &&
        _token != null &&
        _expiryDate.isAfter(DateTime.now())) {
      return _token;
    }
    return null;
  }

  Future<void> signup(String username, String password) async {
    try {
      var url = Uri.parse(
          'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDXR4AeNDyL0wwwNCY8K6G4zNaDmih91qY');
      final response = await http.post(url,
          body: json.encode({
            "email": username,
            "password": password,
            "returnSecureToken": true
          }));

      final responsedata = json.decode(response.body);
      _token = responsedata['idToken'];
      _userId = responsedata['localId'];
      _expiryDate = DateTime.now()
          .add(Duration(seconds: int.parse(responsedata['expiresIn'])));
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> signin(String username, String password) async {
    try {
      var url = Uri.parse(
          'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDXR4AeNDyL0wwwNCY8K6G4zNaDmih91qY');
      final response = await http.post(url,
          body: json.encode({
            "email": username,
            "password": password,
            "returnSecureToken": true
          }));

      final responsedata = json.decode(response.body);
      if (responsedata['error'] != null) {
        throw HttpException(responsedata['error']['message']);
      }
      _token = responsedata['idToken'];
      _userId = responsedata['localId'];
      _expiryDate = DateTime.now()
          .add(Duration(seconds: int.parse(responsedata['expiresIn'])));
      notifyListeners();

      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode({
        "token": _token,
        "userId": _userId,
        "expiryDate": _expiryDate.toIso8601String()
      });
      prefs.setString("userData", userData);
    } catch (error) {
      throw error;
    }
  }

  Future<void> logout() async {
    _token = null;
    _expiryDate = null;
    _userId = null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  Future<void> autoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    final extractedUserData =
        json.decode(prefs.getString('userData')) as Map<String, Object>;
    final expiryDate = DateTime.parse(extractedUserData['expiryDate']);
    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }

    _token = extractedUserData['token'];
    _userId = extractedUserData['userId'];
    _expiryDate = expiryDate;

    notifyListeners();

    return true;
  }
}
