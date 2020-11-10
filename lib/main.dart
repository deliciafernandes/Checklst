import 'package:flutter/material.dart';
import 'utilities/appTheme.dart';
import 'utilities/router.dart' as router;
import 'utilities/routingConstants.dart';

void main() => runApp((Checklst()));

class Checklst extends StatefulWidget {
  @override
  _ChecklstState createState() => _ChecklstState();
}

class _ChecklstState extends State<Checklst> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,

      // Pass the generateRoute function to onGenerateRoute
      // To define the home view as the starting view, instead of setting the home property to a widget we’ll use initialRoute instead.
      // initialRoute: ... vs home: ...
      onGenerateRoute: router.generateRoute,
      initialRoute: kHomePage,
    );
  }
}
