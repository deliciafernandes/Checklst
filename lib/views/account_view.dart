import 'package:checklst/views/body_widgets/auth_body.dart';
import 'package:checklst/views/body_widgets/profile_body.dart';
import "package:flutter/material.dart";

class AccountView extends StatefulWidget {
  @override
  _AccountViewState createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  bool _userLoggedIn = true;

  // void checkIfUserLoggedInd() {}

  @override
  void initState() {
    // checkIfUserLoggedInd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _userLoggedIn ? ProfileBody() : AuthBody();
  }
}
