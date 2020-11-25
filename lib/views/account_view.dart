import "package:flutter/material.dart";

import 'body_widgets/register_body.dart';

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
