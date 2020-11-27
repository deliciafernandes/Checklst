import 'package:checklst/models/check_if_user_logged_in.dart';
import 'package:checklst/views/body_widgets/auth_body.dart';
import 'package:checklst/views/body_widgets/profile_body.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class AccountView extends StatefulWidget {
  @override
  _AccountViewState createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    return Provider.of<CheckIfUserLoggedIn>(context).getCurrentUser()
        ? ProfileBody()
        : AuthBody();
  }
}

// 1234567
