import 'package:checklst/models/reminder.dart';
import 'package:checklst/widgets/reminder_tile.dart';
import 'package:flutter/material.dart';

class TodaysPrioritiesBody extends StatefulWidget {
  @override
  _TodaysPrioritiesBodyState createState() => _TodaysPrioritiesBodyState();
}

class _TodaysPrioritiesBodyState extends State<TodaysPrioritiesBody> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  Future<void> _rebuild() async {
    setState(() {});
  }

  List<Reminder> reminderList = [
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
    Reminder(
        title: 'Reminder Title',
        description: 'Reminder description',
        date: 'Today',
        time: '17:00 pm'),
  ];

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: _rebuild,
      child: Container(
        height: 550.0,
        margin: EdgeInsets.only(right: 20.0),
        child: GridView.count(
          crossAxisCount: 2,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          shrinkWrap: true,
          children: List.generate(reminderList.length, (index) {
            return ReminderTile(
                title: reminderList[index].title,
                description: reminderList[index].description,
                date: reminderList[index].date,
                time: reminderList[index].time,
                isChecked: reminderList[index].isDone,
                checkBoxCallBack: (checkBoxState) {
                  setState(() {
                    reminderList[index].toggleDone();
                  });
                });
          }),
        ),
      ),
    );
  }
}
