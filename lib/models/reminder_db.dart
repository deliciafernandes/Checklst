import 'package:flutter/material.dart';
import 'reminder.dart';

class ReminderDB extends ChangeNotifier {
  List<Reminder> reminderList = [
    Reminder(
        title: 'Reminder Title',
        description: 'Reminder description',
        date: 'Today',
        time: '17:00 pm'),
  ];

  void addReminder(
      TextEditingController titleTextController,
      TextEditingController descriptionTextController,
      String date,
      String time) {
    final reminder = Reminder(
        title: titleTextController.text,
        description: descriptionTextController.text,
        date: date,
        time: time);

    reminderList.add(reminder);
    notifyListeners();
  }
}
