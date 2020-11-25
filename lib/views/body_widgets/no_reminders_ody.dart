import 'package:flutter/material.dart';

class NoRemindersBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: Image.asset(
            'assets/images/noreminder.png',
            width: double.maxFinite,
          ),
        ),
        Text(
          'No reminders',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'WorkSans',
          ),
        ),
        SizedBox(height: 5.0),
        Text(
          'Create a reminder and it will',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,
            fontFamily: 'WorkSans',
            color: Colors.grey[500],
          ),
        ),
        Text(
          'show up here',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,
            fontFamily: 'WorkSans',
            color: Colors.grey[500],
          ),
        ),
        SizedBox(height: 10.0),
        Icon(
          Icons.keyboard_arrow_down,
          color: Colors.grey[500],
        ),
      ],
    );
  }
}
