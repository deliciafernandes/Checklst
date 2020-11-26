import 'package:checklst/models/reminder.dart';
import 'package:checklst/models/reminder_db.dart';
import 'package:checklst/widgets/reminder_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: _rebuild,
      child: Container(
        height: 550.0,
        child: Consumer<ReminderDB>(
          builder: (context, reminderDB, child) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              padding: EdgeInsets.symmetric(vertical: 10.0),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ReminderTile(
                  title: reminderDB.reminderList[index].title,
                  description: reminderDB.reminderList[index].description,
                  date: reminderDB.reminderList[index].date,
                  time: reminderDB.reminderList[index].time,
                  isChecked: reminderDB.reminderList[index].isDone,
                  checkBoxCallBack: (checkBoxState) {
                    setState(
                      () {
                        reminderDB.reminderList[index].toggleDone();
                      },
                    );
                  },
                );
              },
              itemCount: reminderDB.reminderList.length,
            );
          },
        ),
      ),
    );
  }
}
