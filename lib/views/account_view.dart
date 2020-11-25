import 'package:checklst/views/auth_view.dart';
import "package:flutter/material.dart";

class AccountView extends StatefulWidget {
  @override
  _AccountViewState createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  bool _userLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    return _userLoggedIn ? Column() : AuthView();
  }
}
