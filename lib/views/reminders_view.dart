import 'package:checklst/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'body_widgets/no_reminders_ody.dart';

class RemindersView extends StatefulWidget {
  @override
  _RemindersViewState createState() => _RemindersViewState();
}

class _RemindersViewState extends State<RemindersView> {
  String greeting = 'Good Day';
  String _isClicked = 'today\'s priorities';
  bool _remindersExist = false;

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
    return Padding(
      padding:
          EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 30.0),
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
          (_remindersExist)
              ? Column(
                  children: [
                    SizedBox(height: 25.0),
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
                        SizedBox(width: 30.0),
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
                    (_isClicked == 'today\'s priorities'
                        ? Container(
                            color: Colors.black, width: 200, height: 200)
                        : Container(
                            color: Colors.pink, width: 200, height: 200))
                  ],
                )
              : NoRemindersBody(),
        ],
      ),
    );
  }
}
