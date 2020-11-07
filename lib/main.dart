import 'package:flutter/material.dart';

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
      home: Scaffold(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => Screen0(),
      // }
    );
  }
}
