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
          children: List.generate(3, (index) {
            return ReminderTile();
          }),
        ),
      ),
    );
  }
}
