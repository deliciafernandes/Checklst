import 'package:checklst/views/bodyWidgets/loginBody.dart';
import 'package:checklst/views/bodyWidgets/registerBody.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

class AccountView extends StatefulWidget {
  @override
  _AccountViewState createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  bool _userLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    return _userLoggedIn ? Column() : RegisterBody();
  }
}
