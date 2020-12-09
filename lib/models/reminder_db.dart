import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'check_if_user_logged_in.dart';
import 'reminder.dart';

class ReminderDB extends ChangeNotifier {
  final _firestore = FirebaseFirestore.instance;
  CheckIfUserLoggedIn checkIfUserLoggedIn = CheckIfUserLoggedIn();

  List<Reminder> _reminderList = [
    // Reminder(
    //     title: 'Reminder Title',
    //     description: 'Reminder description',
    //     date: 'Today',
    //     time: '17:00 pm'),
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
      date: date,
      time: time,
    );

    _reminderList.add(reminder);
    _firestore.collection('reminders').add({
      'title': title,
      'description': description,
      'date': date,
      'time': time,
    });

    // if (checkIfUserLoggedIn.getCurrentUserEmail() != null) {
    //   _reminderList.add(reminder);
    //   _firestore.collection('reminders').add({
    //     'title': title,
    //     'description': description,
    //     'date': date,
    //     'time': time,
    //   });
    // }

    notifyListeners();
  }

  void updateReminder(Reminder reminder) {
    reminder.toggleDone();
    notifyListeners();
  }

  void deleteReminder(Reminder reminder) {
    _reminderList.remove(reminder);

    // _firestore.collection('reminders').document('wgbhYkrUEKDMnsvYTiHZ')
    notifyListeners();
  }
}
