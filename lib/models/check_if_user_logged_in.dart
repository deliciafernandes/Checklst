import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CheckIfUserLoggedIn extends ChangeNotifier {
  bool _userLoggedIn = false;
  User loggedInUser;

  String getCurrentUserEmail() {
    loggedInUser = _auth.currentUser;

    return loggedInUser.email;
  }

  final _auth = FirebaseAuth.instance;
  bool getCurrentUser() {
    try {
      if (_auth.currentUser != null) {
        _userLoggedIn = true;
      }
    } catch (e) {
      print(e);
    }

    return _userLoggedIn;
  }

  void changeState(state) {
    _userLoggedIn = state;
    notifyListeners();
  }
}
