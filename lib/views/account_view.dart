import 'package:checklst/views/body_widgets/login_body.dart';
import 'package:checklst/views/body_widgets/register_body.dart';
import "package:flutter/material.dart";

class AccountView extends StatefulWidget {
  @override
  _AccountViewState createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  bool _userLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    return _userLoggedIn ? Column() : LoginBody();
    // return _userLoggedIn ? Column() : RegisterBody();
  }
}
