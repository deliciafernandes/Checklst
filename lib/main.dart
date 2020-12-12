import 'package:checklst/models/reminder_db.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'utilities/app_theme.dart';
import 'utilities/router.dart' as router;
import 'utilities/routing_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(Checklst());
}

class Checklst extends StatefulWidget {
  @override
  _ChecklstState createState() => _ChecklstState();
}

class _ChecklstState extends State<Checklst> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReminderDB>(
      create: (_) {
        return ReminderDB();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,

        // Pass the generateRoute function to onGenerateRoute
        // To define the home view as the starting view, instead of setting the home property to a widget we’ll use initialRoute instead.
        // initialRoute: ... vs home: ...
        onGenerateRoute: router.generateRoute,
        // initialRoute: kLocationSelectionView,
        initialRoute: kIndexView,
      ),
    );
  }
}
