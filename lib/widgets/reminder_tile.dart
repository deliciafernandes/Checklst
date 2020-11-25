import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

import 'package:checklst/utilities/colors.dart';

class ReminderTile extends StatelessWidget {
  final _random = new Random();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0,
      height: 50.0,
      margin: EdgeInsets.only(top: 25.0, left: 25.0),
      padding: EdgeInsets.only(
        top: 20.0,
        left: 20.0,
        bottom: 20.0,
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
                  'Reminder Title',
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
                'Reminder Description dummy data',
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
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 18.0,
                  color: Colors.grey[350],
                ),
                Text(
                  'Location',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[350],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
