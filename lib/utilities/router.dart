import 'package:checklst/screens/mainNavPage.dart';
import 'package:checklst/screens/undefinedView.dart';
import 'package:flutter/material.dart';
import 'routingConstants.dart';

// The MaterialApp provides you with a property called onGenerateRoute where you can pass in a Function that returns a Route<dynamic> and takes in RouteSettings.
Route<dynamic> generateRoute(RouteSettings settings) {
  // The settings contain the route information of the requested route. It provides two key things to us: the name and the arguments.

  switch (settings.name) {
    case kHomePage:
      return MaterialPageRoute(builder: (_) => HomePage());
    // case '/feed':
    //   return MaterialPageRoute(builder: (_) => Feed());
    default:
      return MaterialPageRoute(
        builder: (_) => UndefinedView(pageName: settings.name),
      );
  }
}
