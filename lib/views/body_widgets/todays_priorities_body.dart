import 'package:checklst/widgets/reminder_tile.dart';
import 'package:flutter/material.dart';

class TodaysPrioritiesBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550.0,
      margin: EdgeInsets.only(right: 20.0),
      child: GridView.count(
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        shrinkWrap: true,
        children: List.generate(3, (index) {
          return ReminderTile();
        }),
      ),
    );
  }
}
