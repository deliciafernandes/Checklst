import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

import 'package:checklst/utilities/colors.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
    Color _color = colorsList[_random.nextInt(colorsList.length)];

    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 110.0,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(
          top: 20.0,
          left: 20.0,
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
                  width: 50.0,
                  height: 5.0,
                  decoration: BoxDecoration(
                      color: _color,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0))),
                )
              ],
            ),
            Expanded(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.alarm,
                      // color: Colors.grey[350],
                      color: _color,
                      size: 15.0,
                    ),
                    Text(
                      ' $date, $time',
                      style: TextStyle(
                        fontSize: 13.0,
                        fontFamily: 'WorkSans',
                        fontWeight: FontWeight.w600,
                        // color: Colors.grey[350],
                        color: _color,
                      ),
                    ),
                  ],
                ),
                Transform.scale(
                  scale: 0.7,
                  child: CircularCheckBox(
                    value: isChecked,
                    activeColor: Colors.grey[350],
                    checkColor: Colors.black,
                    inactiveColor: Colors.grey,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    onChanged: checkBoxCallBack,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      secondaryActions: [
        IconSlideAction(
          color: _color,
          icon: Icons.check,
          onTap: () {
            return print('Delete');
          },
        ),
      ],
    );
  }
}
