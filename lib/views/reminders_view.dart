import 'package:checklst/utilities/constants.dart';
import 'package:checklst/views/body_widgets/todays_priorities_body.dart';
import 'package:checklst/views/body_widgets/upcoming_body.dart';
import 'package:flutter/material.dart';
import 'body_widgets/no_reminders_body.dart';

class RemindersView extends StatefulWidget {
  @override
  _RemindersViewState createState() => _RemindersViewState();
}

class _RemindersViewState extends State<RemindersView> {
  String greeting = 'Good Day';
  String _isClicked = 'today\'s priorities';
  bool _remindersExist = true;

  void getGreeting() {
    TimeOfDay now = TimeOfDay.now();

    greeting = (now.hour <= 12
        ? 'Good Morning'
        : (now.hour <= 17 ? 'Good Afternoon' : 'Good Evening'));
  }

  @override
  void initState() {
    getGreeting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'Hello Dwayne, $greeting!',
                  style: TextStyle(
                    fontSize: 25.5,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'WorkSans',
                  ),
                ),
              ),
              SizedBox(height: 3.0),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'You have some important tasks to do for today.',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'WorkSans',
                    color: Colors.grey[500],
                  ),
                ),
              ),
            ],
          ),
        ),
        (_remindersExist)
            ? Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 20.0, right: 20.0, top: 25.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isClicked = 'today\'s priorities';
                                });
                              },
                              child: Text(
                                'TODAY\'S PRIORITIES',
                                style: _isClicked == 'today\'s priorities'
                                    ? kActiveTextStyle
                                    : kInactiveTextStyle,
                              ),
                            ),
                            SizedBox(width: 22.0),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isClicked = 'upcoming';
                                });
                              },
                              child: Text(
                                'UPCOMING',
                                style: _isClicked == 'today\'s priorities'
                                    ? kInactiveTextStyle
                                    : kActiveTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  (_isClicked == 'today\'s priorities'
                      ? TodaysPrioritiesBody()
                      : UpcomingBody()),
                ],
              )
            : NoRemindersBody(),
      ],
    );
  }
}
