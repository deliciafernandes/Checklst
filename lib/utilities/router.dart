import 'package:checklst/views/index.dart';
import 'package:checklst/views/location_selection_view.dart';
import 'package:checklst/views/undefined_view.dart';
import 'package:flutter/material.dart';
import 'routing_constants.dart';

// The MaterialApp provides you with a property called onGenerateRoute where you can pass in a Function that returns a Route<dynamic> and takes in RouteSettings.
Route<dynamic> generateRoute(RouteSettings settings) {
  // The settings contain the route information of the requested route. It provides two key things to us: the name and the arguments.

  switch (settings.name) {
    case kIndexView:
      return MaterialPageRoute(builder: (_) => IndexView());
    case kLocationSelectionView:
      return MaterialPageRoute(builder: (_) => LocationSelectionView());
    default:
      return MaterialPageRoute(
        builder: (_) => UndefinedView(pageName: settings.name),
      );
  }
}
