import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:sallon/models/user.dart';

class Userdata with ChangeNotifier {
  User _userdata = User(name: null, phone: null, image: null);
  get userdata {
    return _userdata;
  }

  void addUser(String names, int phones, File images) {
    final User user = User(name: names, phone: phones, image: images);
    _userdata = user;
    notifyListeners();
  }
}
