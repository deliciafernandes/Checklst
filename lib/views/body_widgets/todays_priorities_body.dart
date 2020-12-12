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
              //TODO : responsive
              padding: EdgeInsets.symmetric(vertical: 10.0),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final simple = reminderDB.reminderList[index];
                return ReminderTile(
                  title: simple.title,
                  description: simple.description,
                  date: simple.date,
                  time: simple.time,
                  userLocation: simple.userLocation,
                  isLocationBased: simple.userLocation != null ? true : false,
                  isChecked: simple.isDone,
                  checkBoxCallBack: (checkBoxState) {
                    reminderDB.updateReminder(simple);
                  },
                  deleteCallBack: () {
                    reminderDB.deleteReminder(simple);
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
