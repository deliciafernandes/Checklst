import 'package:flutter/material.dart';

class UndefinedView extends StatelessWidget {
  final String pageName;
  UndefinedView({this.pageName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('No route defined for $pageName'),
      ),
    );
  }
}
