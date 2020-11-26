import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

import 'package:checklst/utilities/colors.dart';

class ReminderTile extends StatelessWidget {
  final _random = new Random();
  final String title;
  final String description;
  final String date;
  final String time;
  final bool isChecked;
  final Function checkBoxCallBack;

  ReminderTile(
      {@required this.title,
      @required this.description,
      @required this.date,
      @required this.time,
      this.isChecked,
      this.checkBoxCallBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      height: 30.0,
      margin: EdgeInsets.only(top: 20.0, left: 20.0),
      padding: EdgeInsets.only(
        top: 20.0,
        left: 20.0,
        bottom: 15.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300], width: 2.0),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                width: 28.0,
                height: 5.0,
                decoration: BoxDecoration(
                    color: colorsList[_random.nextInt(colorsList.length)],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0))),
              )
            ],
          ),
          SizedBox(height: 10.0),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Text(
                description,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'WorkSans',
                  color: Colors.grey[450],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$date, $time',
                style: TextStyle(
                  fontSize: 13.0,
                  fontFamily: 'WorkSans',
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[350],
                ),
              ),
              Transform.scale(
                scale: 0.7,
                child: Checkbox(
                  activeColor: Colors.white,
                  // hoverColor: colorsList[_random.nextInt(colorsList.length)],
                  checkColor: Colors.black,
                  value: isChecked,
                  onChanged: checkBoxCallBack,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
