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
    //   title: 'Reminder Title',
    //   description: 'Reminder description',
    //   date: 'Today',
    //   time: '17:00 pm',
    //   userLocation: 'Andheri East',
    // ),
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

    //Add reminder to reminder local db
    _reminderList.add(reminder);

    //Add reminder to reminder remote db only if user is logged in
    if (checkIfUserLoggedIn.getCurrentUser()) {
      _firestore.collection('reminders').add({
        'title': title,
        'description': description,
        'date': date,
        'time': time,
        'user': checkIfUserLoggedIn.getCurrentUserEmail(),
      });
    }

    // retrieving user specific reminders
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

  void addReminderBasedOnLocation(
    String title,
    String description,
    var userLocation,
  ) {
    final reminder = Reminder(
      title: title,
      description: description,
      userLocation: userLocation,
    );

    //Add reminder to reminder local db
    _reminderList.add(reminder);

    //Add reminder to reminder remote db only if user is logged in
    if (checkIfUserLoggedIn.getCurrentUser()) {
      _firestore.collection('locationBasedReminders').add({
        'title': title,
        'description': description,
        'userLocation': userLocation,
        'user': checkIfUserLoggedIn.getCurrentUserEmail(),
      });
    }

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
