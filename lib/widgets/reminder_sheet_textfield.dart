import 'package:flutter/material.dart';

class ReminderSheetTextField extends StatelessWidget {
  final TextEditingController taskTextController;
  String text;
  final String hintText;

  ReminderSheetTextField({this.taskTextController, this.text, this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: taskTextController,
      autocorrect: true,
      // autofocus:
      //     true, //To automatically enable the textfield and show keyboard
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Colors.grey[400],
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Colors.grey[400],
          ),
        ),
      ),
      onChanged: (value) {
        text = value;
      },
    );
  }
}
