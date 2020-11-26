import 'package:checklst/models/reminder_db.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

import 'reminder_sheet_textfield.dart';

class BottomReminderSheet extends StatefulWidget {
  @override
  _BottomReminderSheetState createState() => _BottomReminderSheetState();
}

class _BottomReminderSheetState extends State<BottomReminderSheet> {
  final titleTextController = TextEditingController();
  final descriptionTextController = TextEditingController();

  String date;
  String time;

  void formatDate() {
    DateTime parsedDate = DateTime.parse(date);
    print(parsedDate);

    var newFormat = DateFormat("d MMM y");
    date = newFormat.format(parsedDate);
  }

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void initState() {
    super.initState();
    var initializationSettingsAndroid =
        AndroidInitializationSettings('playstore');
    // var initializationSettingsIOs = IOSInitializationSettings();
    // var initSetttings = InitializationSettings(
    //     android: initializationSettingsAndroid, iOS: initializationSettingsIOs);

    var initSetttings =
        InitializationSettings(android: initializationSettingsAndroid);

    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onSelectNotification);
  }

// ignore: missing_return
  Future onSelectNotification(String payload) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return IndexView();
    //     },
    //   ),
    // );
  }

  Future<void> scheduleNotification() async {
    // days: on hold TODO
    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(hours: 2, minutes: 3, seconds: 1));
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'channel id',
      'channel name',
      'channel description',
      icon: 'playstore',
      largeIcon: DrawableResourceAndroidBitmap('playstore'),
    );
    // var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    // var platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics, iOS: IOSNotificationDetails);
    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.schedule(
        0,
        titleTextController.text,
        descriptionTextController.text,
        scheduledNotificationDateTime,
        platformChannelSpecifics);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550.0,
      child: Container(
        padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Add Reminder',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40.0,
                fontFamily: 'WorkSans',
                color: Colors.black,
              ),
            ),
            Column(
              children: [
                ReminderSheetTextField(
                    taskTextController: titleTextController,
                    hintText: 'Reminder Title'),
                SizedBox(height: 10.0),
                ReminderSheetTextField(
                    taskTextController: descriptionTextController,
                    hintText: 'Reminder Description'),
                SizedBox(height: 10.0),
                DateTimePicker(
                  type: DateTimePickerType.date,
                  dateMask: 'd MMM, yyyy',
                  // initialValue: '26 Nov,2020',
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  icon: Icon(Icons.event),
                  dateLabelText: 'Date',
                  onChanged: (val) {
                    date = val;
                  },
                  validator: (val) {
                    return null;
                  },
                ),
                DateTimePicker(
                  type: DateTimePickerType.time,
                  // initialValue: '22:34',
                  icon: Icon(Icons.access_time),
                  timeLabelText: "Time",
                  use24HourFormat: false,
                  onChanged: (val) {
                    time = val;
                    print(time);
                  },
                  validator: (val) {
                    return null;
                  },
                  onSaved: (val) {},
                )
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              buttonMinWidth: 150.0,
              children: <Widget>[
                RaisedButton(
                  elevation: 8.0,
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  onPressed: () {
                    formatDate();

                    Provider.of<ReminderDB>(context, listen: false).addReminder(
                        titleTextController.text,
                        descriptionTextController.text,
                        date,
                        time);

                    titleTextController.clear();
                    titleTextController.clear();
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                RaisedButton(
                  color: Colors.grey[300],
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
