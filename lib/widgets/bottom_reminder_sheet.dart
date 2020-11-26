import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import 'reminder_sheet_textfield.dart';

class BottomReminderSheet extends StatefulWidget {
  final Function reminderTitleCallBack;

  BottomReminderSheet(
      {@required
          this.reminderTitleCallBack}); //TODO 2: Once the constructor is initialised, the function passed just comes and sits in the class memory.

  @override
  _BottomReminderSheetState createState() => _BottomReminderSheetState();
}

class _BottomReminderSheetState extends State<BottomReminderSheet> {
  final titleTextController = TextEditingController();
  final descriptionTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550.0,
      child: Container(
        padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Add Reminder',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40.0,
                fontFamily: 'WorkSans',
                color: Colors.black,
              ),
            ),
            Column(
              children: [
                ReminderSheetTextField(
                    taskTextController: titleTextController,
                    hintText: 'Reminder Title'),
                SizedBox(height: 10.0),
                ReminderSheetTextField(
                    taskTextController: descriptionTextController,
                    hintText: 'Reminder Description'),
                SizedBox(height: 10.0),
                DateTimePicker(
                  type: DateTimePickerType.date,
                  dateMask: 'yyyy/MM/dd',
                  //initialValue: _initialValue,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  icon: Icon(Icons.event),
                  dateLabelText: 'Date',
                  onChanged: (val) {
                    //date
                  },
                  validator: (val) {
                    return null;
                  },
                  onSaved: (val) {},
                ),
                DateTimePicker(
                  type: DateTimePickerType.time,
                  //initialValue: _initialValue,
                  icon: Icon(Icons.access_time),
                  timeLabelText: "Time",
                  use24HourFormat: false,
                  onChanged: (val) {
                    //time
                  },
                  validator: (val) {
                    return null;
                  },
                  onSaved: (val) {},
                )
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              buttonMinWidth: 150.0,
              children: <Widget>[
                RaisedButton(
                  elevation: 8.0,
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  onPressed: () {
                    widget
                        .reminderTitleCallBack(descriptionTextController.text);
                    titleTextController.clear();
                    titleTextController.clear();
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                RaisedButton(
                  color: Colors.grey[300],
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
