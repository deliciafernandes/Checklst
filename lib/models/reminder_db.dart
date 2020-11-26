import 'dart:collection';

import 'package:flutter/material.dart';
import 'reminder.dart';

class ReminderDB extends ChangeNotifier {
  List<Reminder> _reminderList = [
    Reminder(
        title: 'Reminder Title',
        description: 'Reminder description',
        date: 'Today',
        time: '17:00 pm'),
    Reminder(
        title: 'Reminder Title',
        description: 'Reminder description',
        date: 'Today',
        time: '17:00 pm'),
  ];

  UnmodifiableListView<Reminder> get reminderList {
    return UnmodifiableListView(_reminderList);
  }

  void addReminder(
    String title,
    String description,
    String date,
    String time,
  ) {
    final reminder = Reminder(
      title: title,
      description: description,
      date: 'Today',
      time: time,
    );

    _reminderList.add(reminder);
    notifyListeners();
  }
}