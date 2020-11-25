import 'package:flutter/material.dart';

class BottomReminderSheet extends StatefulWidget {
  final Function taskTitleCallBack;

  BottomReminderSheet(
      {@required
          this.taskTitleCallBack}); //TODO 2: Once the constructor is initialised, the function passed just comes and sits in the class memory.

  @override
  _BottomReminderSheetState createState() => _BottomReminderSheetState();
}

class _BottomReminderSheetState extends State<BottomReminderSheet> {
  final taskTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String taskText;

    return Container(
      color: Colors.transparent,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    taskTextController: taskTextController,
                    hintText: 'Reminder Title'),
                SizedBox(height: 10.0),
                ReminderSheetTextField(
                    taskTextController: taskTextController,
                    hintText: 'Reminder Description'),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              buttonMinWidth: 150.0,
              children: <Widget>[
                RaisedButton(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  onPressed: () {
                    widget.taskTitleCallBack(
                        taskText); //TODO 3: Here the function taskTitleCallBack is called and taskText is passed, Now it is performed!
                    taskTextController.clear();
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
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Done',
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

class ReminderSheetTextField extends StatelessWidget {
  final TextEditingController taskTextController;
  String taskText;
  final String hintText;

  ReminderSheetTextField(
      {this.taskTextController, this.taskText, this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: taskTextController,
      autocorrect: true,
      // autofocus:
      //     true, //To automatically enable the textfield and show keyboard
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Colors.grey[400],
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Colors.grey[400],
          ),
        ),
      ),
      onChanged: (value) {
        taskText = value;
      },
    );
  }
}
