import 'package:checklst/models/reminder_db.dart';
import 'package:checklst/utilities/location_service.dart';
import 'package:checklst/utilities/routing_constants.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

import 'reminder_sheet_textfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomReminderSheet extends StatefulWidget {
  @override
  _BottomReminderSheetState createState() => _BottomReminderSheetState();
}

class _BottomReminderSheetState extends State<BottomReminderSheet> {
  LocationService locationService = LocationService();
  var userLocation = 'Mumbai';

  bool _isSwitched = false;
  final titleTextController = TextEditingController();
  final descriptionTextController = TextEditingController();

  String date;
  String time;
  int hours;
  int minutes;

  void getUserLocation() async {
    userLocation = await locationService.getLocation();
  }

  void formatDate() {
    DateTime parsedDate = DateTime.parse(date);

    var newFormat = DateFormat("d MMM y");
    date = newFormat.format(parsedDate);
  }

  //TODO: implement better logic
  void getDuration() {
    //splitting of time
    List reminderTime = time.split(':');

    DateTime now = DateTime.now();
    List currentTime = DateFormat('kk:mm').format(now).split(':');

    hours = int.parse(reminderTime[0]) - int.parse(currentTime[0]);
    minutes = int.parse(reminderTime[1]) - int.parse(currentTime[1]) - 1;
  }

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void initState() {
    getUserLocation();
    super.initState();
    var initializationSettingsAndroid =
        AndroidInitializationSettings('playstore');
    // '@mipmap/launcher_icon'
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

  Future<void> scheduleNotificationBasedOnTime() async {
    // days: on hold TODO
    getDuration();

    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(hours: hours, minutes: minutes));
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
    // ignore: deprecated_member_use
    await flutterLocalNotificationsPlugin.schedule(
        0,
        titleTextController.text,
        descriptionTextController.text,
        scheduledNotificationDateTime,
        platformChannelSpecifics);
  }

  Future<void> scheduleNotificationBasedOnLocation() async {
    var android = new AndroidNotificationDetails(
        'id', 'channel ', 'description',
        priority: Priority.high, importance: Importance.max);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android: android);
    await flutterLocalNotificationsPlugin.show(
        0, titleTextController.text, descriptionTextController.text, platform,
        payload: 'Your Checklst. Reminder!');
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(432.0, 816.0), allowFontScaling: true);

    return Container(
      padding: EdgeInsets.all(30.0.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0.w),
          topRight: Radius.circular(30.0.w),
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
              fontSize: 40.0.ssp,
              fontFamily: 'WorkSans',
              color: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0.h),
            child: Column(
              children: [
                ReminderSheetTextField(
                    taskTextController: titleTextController,
                    hintText: 'Reminder Title'),
                SizedBox(height: 10.0.h),
                ReminderSheetTextField(
                    taskTextController: descriptionTextController,
                    hintText: 'Reminder Description'),
                SizedBox(height: 10.0.h),
                Visibility(
                  visible: !_isSwitched,
                  child: Column(
                    children: [
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
                        icon: Icon(Icons.access_time),
                        timeLabelText: "Time",
                        use24HourFormat: true,
                        onChanged: (val) {
                          time = val;
                        },
                        validator: (val) {
                          return null;
                        },
                        onSaved: (val) {},
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.0.h),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Remind me at a location',
                          style: TextStyle(
                            fontSize: 20.0.ssp,
                            fontFamily: 'WorkSans',
                            color: Colors.black,
                          ),
                        ),
                        FlutterSwitch(
                          width: 48.0.w,
                          height: 28.0.h,
                          valueFontSize: 20.0.ssp,
                          toggleSize: 22.0.h,
                          value: _isSwitched,
                          borderRadius: 30.0.w,
                          inactiveColor: Color(0xffadadad),
                          activeColor: Colors.lightBlueAccent,
                          onToggle: (val) {
                            setState(() {
                              _isSwitched = val;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 15.0.h),
                    Visibility(
                      visible: _isSwitched,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Location',
                            style: TextStyle(
                              fontSize: 20.0.ssp,
                              fontFamily: 'WorkSans',
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.keyboard_arrow_right,
                                size: 24.h, color: Colors.grey),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, kLocationSelectionView);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            buttonMinWidth: 150.0.w,
            children: <Widget>[
              RaisedButton(
                elevation: 8.0.h,
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0.h),
                ),
                padding: EdgeInsets.only(
                    left: 15.w, bottom: 11.h, top: 11.h, right: 15.w),
                onPressed: () {
                  if (titleTextController.text == '' ||
                      descriptionTextController.text == '') {
                    //Test case if user clicks add with null title and description
                  } else {
                    // Reminder based on location
                    if (_isSwitched) {
                      scheduleNotificationBasedOnLocation();
                      Provider.of<ReminderDB>(context, listen: false)
                          .addReminderBasedOnLocation(titleTextController.text,
                              descriptionTextController.text, userLocation);
                      titleTextController.clear();
                      titleTextController.clear();
                    } else {
                      scheduleNotificationBasedOnTime();
                      Provider.of<ReminderDB>(context, listen: false)
                          .addReminder(titleTextController.text,
                              descriptionTextController.text, date, time);

                      titleTextController.clear();
                      titleTextController.clear();
                    }

                    Navigator.pop(context);
                  }
                },
                child: Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 22.0.ssp,
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 10.0.w),
              RaisedButton(
                color: Colors.grey[200],
                elevation: 8.0.h,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0.h),
                ),
                padding: EdgeInsets.only(
                    left: 15.w, bottom: 11.h, top: 11.h, right: 15.w),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 22.0.ssp,
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 100.0.h),
        ],
      ),
    );
  }
}
